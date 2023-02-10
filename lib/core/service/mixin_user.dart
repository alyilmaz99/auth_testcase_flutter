import 'package:auth_testcase_flutter/core/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin ConvertUser {
  UserModel convertUser(UserCredential user) {
    return UserModel(userId: user.user!.uid, userMail: user.user!.email!);
  }
}
