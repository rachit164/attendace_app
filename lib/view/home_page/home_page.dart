import 'package:attendance_app/view/my_attendance/my_attendance.dart';
import 'package:attendance_app/view/punching/punching.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/routes/routes.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/text_light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<Auth>(context, listen: false);

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    Future<void> checkAlreadyLoggedIn() async {
      final SharedPreferences prefs = await _prefs;

      var username = prefs.getString("userName");
      print(username);
    }

    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.35,
                  decoration: const BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03,
                            top: height * 0.06,
                            right: width * 0.03),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 28,
                                child: Image.asset(
                                  "assets/images/bell_icon@3x.png",
                                  width: width * 0.07,
                                  height: height * 0.07,
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.punching);
                              },
                              child: Container(
                                child: Image.asset(
                                  "assets/images/bell_icon@3x.png",
                                  width: width * 0.07,
                                  height: height * 0.07,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Container(
                              child: Image.asset(
                                "assets/images/menu_icon@3x.png",
                                width: width * 0.08,
                                height: height * 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.03, top: height * 0.02),
                        child: BigText(
                          text: authProvider.userName.toString(),
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: TextLight(
                          text: "Welcome to VertexPlus Technologies",
                          size: height * 0.022,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.myAttendance);
                        },
                        child: Container(
                          height: width * 0.43,
                          width: width * 0.43,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/attendance_icon2x.png",
                                width: width * 0.10,
                                height: height * 0.10,
                              ),
                              TextLight(
                                text: 'Attendance',
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.leaveTracker);
                        },
                        child: Container(
                          height: width * 0.43,
                          width: width * 0.43,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/leave_tracker_icon2x.png",
                                width: width * 0.10,
                                height: height * 0.10,
                              ),
                              TextLight(
                                text: 'Leave Tracker',
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: width * 0.43,
                        width: width * 0.43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/time_sheet_icon2x.png",
                              width: width * 0.10,
                              height: height * 0.10,
                            ),
                            TextLight(
                              text: 'Time Sheet',
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: width * 0.43,
                        width: width * 0.43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/announcement_icon2x.png",
                              width: width * 0.10,
                              height: height * 0.10,
                            ),
                            TextLight(
                              text: 'Announcement',
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.05,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: width * 0.43,
                        width: width * 0.43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/task_icon2x.png",
                              width: width * 0.10,
                              height: height * 0.10,
                            ),
                            TextLight(
                              text: 'Task',
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: width * 0.43,
                        width: width * 0.43,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/file_icon2x.png",
                              width: width * 0.10,
                              height: height * 0.10,
                            ),
                            TextLight(
                              text: 'File',
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: width * 0.03,
                ),
              ],
            ),
            Positioned(
              top: height * 0.31,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  height: height * 0.08,
                  width: width - 95,
                  child: const TextField(
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Services',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}