import 'dart:async';
import 'package:attendance_app/view/login_page/login_page.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blueColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/splash_bg.png"),
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/logo_icon1x.png",
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
      ),
    );
  }
}
