import 'package:clockify/features/login/presentation/pages/login_screen.dart';
import 'package:clockify/features/password/presentation/pages/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Route _createRouteForLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
    );
  }

  @override
  void initState() {
    super.initState();
    // Fade animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Navigate after animation is done
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Simulate for over 3 seconds
    
    // TEMP
    // _createRouteForLoginScreen();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

    // var box = Hive.box('appBox');
    // bool isLoggedIn = box.get('isLoggedIn', defaultValue: false); // Check login status locally

    // // Navigate based on login status
    // if (mounted) {
    //     Navigator.pushReplacement(
    //       context, 
    //       MaterialPageRoute(builder: (context) => LoginScreen()
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset("assets/images/Logo.png", alignment: Alignment.center, height: 40, width: 260)
            )
          )
        )
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

