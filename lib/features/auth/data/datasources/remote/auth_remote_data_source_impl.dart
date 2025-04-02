import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../core/constants/failures/auth_exception_message_constant.dart';
import '../../../core/failures/auth_exception.dart';
import '../../models/auth_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
    required this.googleSignIn,
  });

  @override
  Future<AuthModel> getAuthModel() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final snapshot = await firestore.usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        return AuthModelFirestore.fromFirestore(
          snapshot as DocumentSnapshot<Map<String, dynamic>>,
        );
      }
    }
    throw AuthException(
      message: AuthExceptionMessageConstant.userNotFound,
      type: AuthFailureType.userNotFound,
    );
  }

  @override
  Future<AuthModel> loginWithEmailAndPassword({
    required AuthModel authModel,
  }) async {
    if (authModel.password == null) {
      throw AuthException(
        message: AuthExceptionMessageConstant.passwordIsNull,
        type: AuthFailureType.passwordIsNull,
      );
    }
    await firebaseAuth.signInWithEmailAndPassword(
      email: authModel.email,
      password: authModel.password!,
    );
    return getAuthModel();
  }

  @override
  Future<AuthModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw AuthException(
        message: AuthExceptionMessageConstant.loginWithGoogleAbortedByUser,
        type: AuthFailureType.loginWithGoogleAbortedByUser,
      );
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await firebaseAuth
        .signInWithCredential(credential);

    final user = userCredential.user;
    if (user != null) {
      if (!user.email!.endsWith("@student.ums.ac.id")) {
        await firebaseAuth.signOut();
        throw AuthException(
          message: AuthExceptionMessageConstant.invalidEmailDomain,
          type: AuthFailureType.invalidEmailDomain,
        );
      }

      final authModel = AuthModel(
        id: user.uid,
        username: user.displayName ?? "",
        email: user.email ?? "",
      );

      await firestore.usersCollection
          .doc(user.uid)
          .set(authModel.toFirestore());

      return authModel;
    }

    throw AuthException(
      message: AuthExceptionMessageConstant.loginWithGoogleFailed,
      type: AuthFailureType.loginWithGoogleFailed,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
