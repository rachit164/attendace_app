import 'dart:async';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:attendance_app/view/login_page/login_page.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/view/splash_screen/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        // () => Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoginPage(),
        //   ),
        // ),
        // () => SplashServices().checkAuthentication(context));
        () => checkAlreadyLoggedIn());
  }

  Future<void> checkAlreadyLoggedIn() async {
    final SharedPreferences prefs = await _prefs;

    var isLoggedIn = prefs.getString("token");
    if (isLoggedIn == null || isLoggedIn == "") {
      Navigator.pushReplacementNamed(context, RoutesName.loginPage);
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.homepage);
    }
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
