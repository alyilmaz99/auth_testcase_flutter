import 'package:auth_testcase_flutter/core/model/user.dart';
import 'package:auth_testcase_flutter/core/service/auth_service.dart';
import 'package:auth_testcase_flutter/core/service/firebase_service.dart';
import 'package:auth_testcase_flutter/core/widgets/auth_widget.dart';
import 'package:auth_testcase_flutter/core/widgets/auth_widget_builder.dart';
import 'package:auth_testcase_flutter/firebase_options.dart';
import 'package:auth_testcase_flutter/view/homepage_view.dart';
import 'package:auth_testcase_flutter/view/loginpage_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(
          create: (_) => AuthService(),
        )
      ],
      child: AuthWidgetBuilder(
        onPageBuilder: (context, AsyncSnapshot<UserModel?> snapShot) =>
            MaterialApp(
          title: 'Flutter Auth',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.amber,
          ),
          home: AuthWidget(
            snapshot: snapShot,
          ),
        ),
      ),
    );
  }
}
