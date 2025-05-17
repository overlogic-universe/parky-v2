import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/shared/data/datasources/remote/network_info.dart';

final internetConnectionCheckerProvider = Provider<InternetConnectionChecker>(
  (ref) => InternetConnectionChecker.instance,
);

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final internetConnectionChecker = ref.watch(
    internetConnectionCheckerProvider,
  );
  return NetworkInfoImpl(internetConnectionChecker: internetConnectionChecker);
});

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final googleSignInProvider = Provider<GoogleSignIn>((ref) => GoogleSignIn());

final sqfliteDatabaseProvider = Provider<Database>(
  (ref) => throw UnimplementedError(),
);

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);
