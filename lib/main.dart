import 'package:attendance_app/view/home_page/home_page.dart';
import 'package:attendance_app/view/login_page/user_view_model.dart';

import 'package:attendance_app/view/my_attendance/my_attendance.dart';
import 'package:attendance_app/view/punching/punching.dart';
import 'package:attendance_app/view/splash_screen/splash_screen.dart';
import 'package:attendance_app/providers/auth_provider.dart';
import 'package:attendance_app/providers/drop_down_list.dart';
import 'package:attendance_app/providers/punching_provider.dart';
import 'package:attendance_app/utils/routes/routes.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:attendance_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => DropDownProvider()),
        ChangeNotifierProvider(create: (_) => PunchingProvider()),

        //MVVM codes
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Inter',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
                // titleMedium: const TextStyle(
                //   fontSize: 24,
                //   fontFamily: 'RobotoCondensed',
                // ),
              ),
        ),
        initialRoute: RoutesName.loginPage,
        onGenerateRoute: Routes.generateRoute,
        // routes: {
        //   "/": (context) => const PunchingPage(),
        //   RoutesName.homepage: (context) => const HomePage(),
        //   RoutesName.myAttendance: (context) => const MyAttendance(),
        //   RoutesName.punching: (context) => const PunchingPage(),
        // }
      ),
    );
  }
}
