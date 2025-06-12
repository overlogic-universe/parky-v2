import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/extensions/firebase_extension.dart';
import '../../../core/failures/auth_exception.dart';
import '../../../core/failures/auth_failure_type.dart';
import '../../../domain/entities/login_with_email_password_request.dart';
import '../../models/student_model.dart';
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
  Future<StudentModel> loginWithEmailAndPassword({
    required LoginWithEmailPasswordRequest loginWithEmailPasswordRequest,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: loginWithEmailPasswordRequest.email,
      password: loginWithEmailPasswordRequest.password,
    );
    return getStudentModel();
  }

  @override
  Future<StudentModel> loginWithGoogle() async {
    final GoogleSignInAccount? googleStudent = await googleSignIn.signIn();
    if (googleStudent == null) {
      throw AuthException(
        type: AuthFailureType.loginWithGoogleAbortedByStudent,
      );
    }

    final GoogleSignInAuthentication googleAuth =
        await googleStudent.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential studentCredential = await firebaseAuth
        .signInWithCredential(credential);

    final student = studentCredential.user;
    if (student != null) {
      if (!student.email!.endsWith("@student.ums.ac.id")) {
        await signOut();
        throw AuthException(type: AuthFailureType.invalidEmailDomain);
      }

      return getStudentModel();
    }

    throw AuthException(type: AuthFailureType.loginWithGoogleFailed);
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }

  @override
  Future<StudentModel> getStudentModel() async {
    try {
      final student = firebaseAuth.currentUser;
      if (student == null) {
        throw AuthException(type: AuthFailureType.studentNotFound);
      }
      final snapshot =
          await firestore.studentsCollection.doc(student.uid).get();
      if (snapshot.exists) {
        return StudentModel.fromFirestore(
          snapshot as DocumentSnapshot<Map<String, dynamic>>,
        );
      } else {
        throw AuthException(type: AuthFailureType.studentNotFound);
      }
    } catch (e) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final currentUser = firebaseAuth.currentUser;

    if (currentUser == null || currentUser.email == null) {
      throw AuthException(type: AuthFailureType.studentNotFound);
    }

    final credential = EmailAuthProvider.credential(
      email: currentUser.email!,
      password: oldPassword,
    );

    await currentUser.reauthenticateWithCredential(credential);

    // Check if old and new password are the same
    if (oldPassword == newPassword) {
      throw AuthException(type: AuthFailureType.passwordUnchanged);
    }

    // Update to new password
    await currentUser.updatePassword(newPassword);
  }
}
