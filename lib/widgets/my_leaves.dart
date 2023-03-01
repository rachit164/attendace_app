import 'dart:convert';

import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:attendance_app/view/leave_request/leave_request.dart';
import 'package:attendance_app/widgets/text_light.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import 'big_text_bold.dart';

class MyLeaves extends StatefulWidget {
  const MyLeaves({Key? key}) : super(key: key);

  @override
  State<MyLeaves> createState() => _MyLeavesState();
}

class _MyLeavesState extends State<MyLeaves> {
  List _items = [];
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/myleaves.json');
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LeaveRequest()));
        },
        backgroundColor: AppColors.blueColor,
        elevation: 15,
        splashColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            height: 50,
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
                  size: 17,
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
          SizedBox(
            height: height * 0.005,
          ),
          SizedBox(
            height: height * 0.70,
            width: width,
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              color: const Color.fromRGBO(0, 0, 0, 0.001),
                              child: GestureDetector(
                                onTap: () {},
                                child: DraggableScrollableSheet(
                                  initialChildSize: 0.4,
                                  minChildSize: 0.2,
                                  maxChildSize: 0.75,
                                  builder: (_, controller) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.0),
                                          topRight: Radius.circular(25.0),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            color: Colors.grey[600],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              controller: controller,
                                              itemCount: 1,
                                              itemBuilder: (_, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/date@2x.png",
                                                            width: 35,
                                                            height: 35,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextLight(
                                                                text:
                                                                    "Applied On",
                                                                size: 14,
                                                                color: AppColors
                                                                    .blueColor,
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              TextLight(
                                                                text:
                                                                    "Feb 28,2023",
                                                                size: 16,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/date@2x.png",
                                                            width: 35,
                                                            height: 35,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextLight(
                                                                text:
                                                                    "Period of leave requested",
                                                                size: 14,
                                                                color: AppColors
                                                                    .blueColor,
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              TextLight(
                                                                text:
                                                                    "Feb 28,2023 - Mar 10,2023",
                                                                size: 16,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/reason@2x.png",
                                                            width: 35,
                                                            height: 35,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextLight(
                                                                text:
                                                                    "Reason of Leave requested",
                                                                size: 14,
                                                                color: AppColors
                                                                    .blueColor,
                                                              ),
                                                              const SizedBox(
                                                                height: 3,
                                                              ),
                                                              TextLight(
                                                                text:
                                                                    "Leave application for function.",
                                                                size: 16,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      AnimatedContainer(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5,
                                                                left: 10,
                                                                right: 10),
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black12),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                        child: Theme(
                                                          data: ThemeData().copyWith(
                                                              dividerColor: Colors
                                                                  .transparent),
                                                          child: ExpansionTile(
                                                            title: const Text(
                                                                '1 task assigned in this duration'),
                                                            leading:
                                                                Image.asset(
                                                              "assets/images/tick@2x.png",
                                                              width: 20,
                                                              height: 20,
                                                            ),
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextLight(
                                                                    text:
                                                                        "Date & Time",
                                                                    size: 15,
                                                                    color: AppColors
                                                                        .greyColor,
                                                                  ),
                                                                  TextLight(
                                                                    text:
                                                                        "Feb 28,2023 - 11:00 AM to 09:00 PM",
                                                                    size: 15,
                                                                    color: AppColors
                                                                        .blackColor,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          TextLight(
                                                                            text:
                                                                                "Task",
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                AppColors.greyColor,
                                                                          ),
                                                                          TextLight(
                                                                            text:
                                                                                "New web UI design",
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                AppColors.blackColor,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          TextLight(
                                                                            text:
                                                                                "Project Manager",
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                AppColors.greyColor,
                                                                          ),
                                                                          TextLight(
                                                                            text:
                                                                                "Lokesh Gupta",
                                                                            size:
                                                                                15,
                                                                            color:
                                                                                AppColors.blackColor,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 6,
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          TextLight(
                                                            text: "Status",
                                                            color: AppColors
                                                                .blueColor,
                                                            size: 16,
                                                          ),
                                                          TextLight(
                                                            text: "Approved",
                                                            color: AppColors
                                                                .redColor,
                                                            size: 16,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      // showModalBottomSheet<void>(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (BuildContext context) {
                      //     return Container(
                      //       decoration: const BoxDecoration(
                      //         color: AppColors.whiteColor,
                      //         borderRadius: BorderRadius.only(
                      //           topRight: Radius.circular(40),
                      //           topLeft: Radius.circular(40),
                      //         ),
                      //       ),
                      //       height: height * 0.55,
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 10, right: 8, top: 20),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Image.asset(
                      //                   "assets/images/date@2x.png",
                      //                   width: 35,
                      //                   height: 35,
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 8,
                      //                 ),
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     TextLight(
                      //                       text: "Applied On",
                      //                       size: 14,
                      //                       color: AppColors.blueColor,
                      //                     ),
                      //                     TextLight(
                      //                       text: "Feb 28,2023",
                      //                       size: 16,
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             ),
                      //             const SizedBox(
                      //               height: 15,
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Image.asset(
                      //                   "assets/images/date@2x.png",
                      //                   width: 35,
                      //                   height: 35,
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     TextLight(
                      //                       text: "Period of leave requested",
                      //                       size: 14,
                      //                       color: AppColors.blueColor,
                      //                     ),
                      //                     TextLight(
                      //                       text: "Feb 28,2023 - Mar 10,2023",
                      //                       size: 16,
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             ),
                      //             const SizedBox(
                      //               height: 15,
                      //             ),
                      //             Row(
                      //               children: [
                      //                 Image.asset(
                      //                   "assets/images/reason@2x.png",
                      //                   width: 35,
                      //                   height: 35,
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     TextLight(
                      //                       text: "Reason of Leave requested",
                      //                       size: 14,
                      //                       color: AppColors.blueColor,
                      //                     ),
                      //                     TextLight(
                      //                       text:
                      //                           "Leave application for function.",
                      //                       size: 16,
                      //                     ),
                      //                   ],
                      //                 )
                      //               ],
                      //             ),
                      //             const SizedBox(
                      //               height: 15,
                      //             ),
                      //             AnimatedContainer(
                      //               padding: const EdgeInsets.only(
                      //                   bottom: 5, left: 10, right: 10),
                      //               duration: const Duration(seconds: 2),
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(color: Colors.black12),
                      //               ),
                      //               child: Theme(
                      //                 data: ThemeData().copyWith(
                      //                     dividerColor: Colors.transparent),
                      //                 child: ExpansionTile(
                      //                   title: const Text(
                      //                       '1 task assigned in this duration'),
                      //                   leading: Image.asset(
                      //                     "assets/images/tick@2x.png",
                      //                     width: 20,
                      //                     height: 20,
                      //                   ),
                      //                   children: [
                      //                     Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         TextLight(
                      //                           text: "Date & Time",
                      //                           size: 15,
                      //                           color: AppColors.greyColor,
                      //                         ),
                      //                         TextLight(
                      //                           text:
                      //                               "Feb 28,2023 - 11:00 AM to 09:00 PM",
                      //                           size: 15,
                      //                           color: AppColors.blackColor,
                      //                         ),
                      //                         const SizedBox(
                      //                           height: 2,
                      //                         ),
                      //                         Row(
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment
                      //                                   .spaceBetween,
                      //                           children: [
                      //                             Column(
                      //                               crossAxisAlignment:
                      //                                   CrossAxisAlignment
                      //                                       .start,
                      //                               children: [
                      //                                 TextLight(
                      //                                   text: "Task",
                      //                                   size: 15,
                      //                                   color:
                      //                                       AppColors.greyColor,
                      //                                 ),
                      //                                 TextLight(
                      //                                   text:
                      //                                       "New web UI design",
                      //                                   size: 15,
                      //                                   color: AppColors
                      //                                       .blackColor,
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                             Column(
                      //                               crossAxisAlignment:
                      //                                   CrossAxisAlignment
                      //                                       .start,
                      //                               children: [
                      //                                 TextLight(
                      //                                   text: "Project Manager",
                      //                                   size: 15,
                      //                                   color:
                      //                                       AppColors.greyColor,
                      //                                 ),
                      //                                 TextLight(
                      //                                   text: "Lokesh Gupta",
                      //                                   size: 15,
                      //                                   color: AppColors
                      //                                       .blackColor,
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               height: 10,
                      //             ),
                      //             Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 TextLight(
                      //                   text: "Status",
                      //                   color: AppColors.blueColor,
                      //                   size: 16,
                      //                 ),
                      //                 TextLight(
                      //                   text: "Approved",
                      //                   color: AppColors.redColor,
                      //                   size: 16,
                      //                 )
                      //               ],
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 110,
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 85,
                                    decoration: const BoxDecoration(
                                      color: AppColors.offwhite,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextLight(
                                        text: _items[index]["status"],
                                        size: 14,
                                        color: AppColors.redColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextLight(
                                    text: _items[index]["time"],
                                    size: 14,
                                    color: AppColors.blueColor,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  BigText(
                                    text: _items[index]["date"],
                                    size: 20,
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: AppColors.offwhite,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
