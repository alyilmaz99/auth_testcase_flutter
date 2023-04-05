// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auth_testcase_flutter/core/model/user.dart';
import 'package:auth_testcase_flutter/core/service/auth_service.dart';
import 'package:auth_testcase_flutter/core/service/mixin_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ConvertUser implements IAuthService {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  UserModel _getUser(User? user) {
    return UserModel(userId: user!.uid, userMail: user.email!);
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    var _tempUser = await _authInstance.createUserWithEmailAndPassword(
        email: email, password: password);
    return convertUser(_tempUser);
  }

  @override
  Stream<UserModel?> get onAuthStateChanged =>
      _authInstance.authStateChanges().map(_getUser);

  @override
  Future<UserModel> singInEmailAndPassword(
      {required String email, required String password}) async {
    var _tempUser = await _authInstance.signInWithEmailAndPassword(
        email: email, password: password);
    return convertUser(_tempUser);
  }

  @override
  Future<void> signOut() async {
    await _authInstance.signOut();
  }
}
