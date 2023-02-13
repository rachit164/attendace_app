import 'package:attendance_app/pages/home_page/home_page.dart';

import 'package:attendance_app/pages/my_attendance/my_attendance.dart';
import 'package:attendance_app/pages/punching/punching.dart';
import 'package:attendance_app/providers/auth_provider.dart';
import 'package:attendance_app/providers/drop_down_list.dart';
import 'package:attendance_app/providers/punching_provider.dart';
import 'package:attendance_app/utils/routes/routes.dart';
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
        ChangeNotifierProvider(create: (_) => PunchingProvider())
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
          routes: {
            "/": (context) => const HomePage(),
            MyRoutes.homepage: (context) => const HomePage(),
            MyRoutes.myAttendance: (context) => const MyAttendance(),
            MyRoutes.punching: (context) => const PunchingPage(),
          }),
    );
  }
}
