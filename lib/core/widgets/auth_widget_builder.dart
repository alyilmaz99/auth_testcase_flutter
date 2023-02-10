import 'package:auth_testcase_flutter/core/model/user.dart';
import 'package:auth_testcase_flutter/core/service/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({super.key, required this.onPageBuilder});
  final Widget Function(
      BuildContext context, AsyncSnapshot<UserModel?> snapShot) onPageBuilder;
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context, listen: false);
    return StreamBuilder<UserModel?>(
      stream: _authService.onAuthStateChanged,
      builder: (context, AsyncSnapshot<UserModel?> snapshot) {
        final _userData = snapshot.data;
        if (_userData != null) {
          return MultiProvider(
            providers: [
              Provider.value(value: _userData),
            ],
            child: onPageBuilder(context, snapshot),
          );
        }
        return onPageBuilder(context, snapshot);
      },
    );
  }
}
