import 'package:auth_testcase_flutter/core/model/user.dart';

abstract class IAuthService {
  Future<UserModel> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<UserModel> singInEmailAndPassword(
      {required String email, required String password});
  Future<void> signOut();
  Stream<UserModel?> get onAuthStateChanged;
}
