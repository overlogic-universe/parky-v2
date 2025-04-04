import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../core/constants/failures/auth_exception_message_constant.dart';
import '../../../core/failures/auth_exception.dart';
import '../../../domain/entities/login_with_email_password_request.dart';
import '../../models/user_model.dart';
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
  Future<UserModel> getUserModel() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final snapshot = await firestore.usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        return UserModel.fromFirestore(
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
  Future<UserModel> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: loginWithEmailPasswordRequest.email,
      password: loginWithEmailPasswordRequest.password,
    );
    return getUserModel();
  }

  @override
  Future<UserModel> loginWithGoogle() async {
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

      return getUserModel();
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
