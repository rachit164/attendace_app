import 'package:attendance_app/view/home_page/home_page.dart';
import 'package:attendance_app/view/login_page/login_page.dart';
import 'package:attendance_app/view/my_attendance/my_attendance.dart';
import 'package:attendance_app/view/punching/punching.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homepage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());

      case RoutesName.loginPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());

      case RoutesName.punching:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PunchingPage());

      case RoutesName.myAttendance:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyAttendance());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
