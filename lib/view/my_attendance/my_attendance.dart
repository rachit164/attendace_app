import 'dart:convert';

import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/text_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAttendance extends StatefulWidget {
  const MyAttendance({Key? key}) : super(key: key);

  @override
  State<MyAttendance> createState() => _MyAttendanceState();
}

class _MyAttendanceState extends State<MyAttendance> {
  List _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      print("..number of items ${_items.length}");
    });
  }

  @override
  initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: height * 0.15,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10,
                bottom: 10,
                top: 10,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/burger_menu@3x.png",
                    width: width * 0.06,
                    height: height * 0.06,
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  BigText(
                    text: "My Attendance",
                    size: height * 0.024,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: height * 0.07,
            width: width - width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/left@2x.png",
                  width: width * 0.04,
                  height: height * 0.04,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                TextLight(
                  text: "01-Jan-2023 - 31-Jan-2023",
                  size: height * 0.022,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Image.asset(
                  "assets/images/right@2x.png",
                  width: width * 0.04,
                  height: height * 0.04,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: height * 0.61,
              width: width,
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextLight(
                                  text: _items[index]["day"],
                                  size: 16,
                                  color: AppColors.greyColor,
                                ),
                                BigText(
                                  text: _items[index]["date"],
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.5,
                            margin: EdgeInsets.only(
                              left: width * 0.02,
                              right: width * 0.02,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextLight(
                                      text: "Punch In",
                                      size: height * 0.02,
                                    ),
                                    TextLight(
                                      text: "Punch Out",
                                      size: height * 0.02,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Container(
                                  height: height * 0.003,
                                  color: AppColors.blueColor,
                                  width: width * 0.5,
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextLight(
                                      text: _items[index]["in"],
                                      size: height * 0.02,
                                    ),
                                    TextLight(
                                      text: _items[index]["out"],
                                      size: height * 0.02,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: 65,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextLight(
                                  text: "Hrs",
                                  size: 16,
                                  color: AppColors.greyColor,
                                ),
                                BigText(
                                  text: _items[index]["hrs"],
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              //   ],
              // ),
              )
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.15,
        width: width,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: width * 0.24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLight(
                    text: "Days",
                    color: AppColors.greyColor,
                    size: height * 0.022,
                  ),
                  BigText(
                    text: "24",
                    color: AppColors.greenColor,
                    size: height * 0.03,
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/images/border_vertical_line@2x.png",
              width: width * 0.01,
              height: height * 0.15,
            ),
            Container(
              width: width * 0.24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLight(
                    text: "Leaves",
                    color: AppColors.greyColor,
                    size: height * 0.023,
                  ),
                  BigText(
                    text: "03",
                    color: AppColors.redColor,
                    size: height * 0.03,
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/images/border_vertical_line@2x.png",
              width: width * 0.01,
              height: height * 0.15,
            ),
            Container(
              width: width * 0.23,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLight(
                    text: "Absent",
                    color: AppColors.greyColor,
                    size: height * 0.022,
                  ),
                  BigText(
                    text: "02",
                    size: height * 0.03,
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/images/border_vertical_line@2x.png",
              width: width * 0.01,
              height: height * 0.15,
            ),
            Container(
              width: width * 0.24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLight(
                    text: "Balance",
                    color: AppColors.greyColor,
                    size: height * 0.022,
                  ),
                  BigText(
                    text: "01",
                    color: AppColors.blueColor,
                    size: height * 0.03,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
