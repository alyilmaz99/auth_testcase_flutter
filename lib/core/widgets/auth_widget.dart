import 'package:auth_testcase_flutter/core/model/user.dart';
import 'package:auth_testcase_flutter/view/homepage_view.dart';
import 'package:auth_testcase_flutter/view/loginpage_view.dart';
import 'package:flutter/material.dart';
import '../../view/errorpage_view.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key, required this.snapshot});
  final AsyncSnapshot<UserModel?> snapshot;
  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.active) {
      return snapshot.hasData ? const HomePage() : const LoginPage();
    }
    return const ErrorPage();
  }
}
