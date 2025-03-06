import 'package:clockify/core/themes/theme.dart';
import 'package:clockify/features/login/presentation/pages/login_screen.dart';
import 'package:clockify/features/password/presentation/pages/password_screen.dart';
import 'package:clockify/features/register/presentation/pages/register_screen.dart';
import 'package:clockify/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox('appBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/password': (context) => PasswordScreen(),
      },
      theme: appTheme,
    );
  }
}
