import 'package:auth_testcase_flutter/core/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                await _authService.createUserWithEmailAndPassword(
                    email: 'okethis@gmail.com', password: 'serdem');
              },
              color: Colors.amber,
              child: const Text("Create User"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                await _authService.singInEmailAndPassword(
                    email: 'okethis@gmail.com', password: 'serdem');
              },
              color: Colors.amber,
              child: const Text("Sign In User"),
            ),
          ],
        ),
      ),
    );
  }
}
