import 'dart:convert';
import 'package:attendance_app/widgets/text_light.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../view/leave_request/leave_request.dart';
import 'big_text_bold.dart';

class TeamLeaves extends StatefulWidget {
  const TeamLeaves({Key? key}) : super(key: key);

  @override
  State<TeamLeaves> createState() => _TeamLeavesState();
}

class _TeamLeavesState extends State<TeamLeaves> {
  List _items = [];
  String? username;
  String? userImage;
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/myleaves.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      print("..number of items ${_items.length}");
    });
  }

  user() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("userName") ?? "";
      userImage = prefs.getString("userImage") ?? "";
    });
  }

  @override
  initState() {
    super.initState();
    user();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                                  initialChildSize: 0.6,
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
                                                          CircleAvatar(
                                                            radius: 27,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: CircleAvatar(
                                                                radius: 25,
                                                                child: ClipOval(
                                                                  child: Image
                                                                      .network(
                                                                    userImage!,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                )),
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              BigText(
                                                                text: username!,
                                                                size: 16,
                                                              ),
                                                              TextLight(
                                                                text:
                                                                    "Web Designer",
                                                                size: 14,
                                                                color: AppColors
                                                                    .greyColor,
                                                              ),
                                                            ],
                                                          ),
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
                                                                    "Applied On",
                                                                size: 14,
                                                                color: AppColors
                                                                    .greyColor,
                                                              ),
                                                              const SizedBox(
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
                                                                    .greyColor,
                                                              ),
                                                              const SizedBox(
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
                                                                    .greyColor,
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
                                                        duration:
                                                            const Duration(
                                                          seconds: 2,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color:
                                                                Colors.black12,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                        child: Theme(
                                                          data: ThemeData()
                                                              .copyWith(
                                                            dividerColor: Colors
                                                                .transparent,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 8,
                                                              right: 8,
                                                            ),
                                                            child:
                                                                ExpansionTile(
                                                              title: const Text(
                                                                  '1 task assigned in this duration'),
                                                              // leading:
                                                              //     Image.asset(
                                                              //   "assets/images/tick@2x.png",
                                                              //   width: 20,
                                                              //   height: 20,
                                                              // ),
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
                                                                              text: "Task",
                                                                              size: 15,
                                                                              color: AppColors.greyColor,
                                                                            ),
                                                                            TextLight(
                                                                              text: "New web UI design",
                                                                              size: 15,
                                                                              color: AppColors.blackColor,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            TextLight(
                                                                              text: "Project Manager",
                                                                              size: 15,
                                                                              color: AppColors.greyColor,
                                                                            ),
                                                                            TextLight(
                                                                              text: "Lokesh Gupta",
                                                                              size: 15,
                                                                              color: AppColors.blackColor,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 6,
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              TextLight(
                                                                text: "Status",
                                                                color: AppColors
                                                                    .greyColor,
                                                                size: 16,
                                                              ),
                                                              TextLight(
                                                                text:
                                                                    "Approved",
                                                                color: AppColors
                                                                    .redColor,
                                                                size: 16,
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Container(
                                                            width: 100,
                                                            height: 44,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                      ),
                                                                      primary:
                                                                          AppColors
                                                                              .greenColor,
                                                                      elevation:
                                                                          0.0,
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8)),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                'Approve',
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .whiteColor),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            width: 100,
                                                            height: 44,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                      ),
                                                                      elevation:
                                                                          0.0,
                                                                      primary: AppColors
                                                                          .redColor
                                                                          .withOpacity(
                                                                              0.1),
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8)),
                                                              onPressed: () {},
                                                              child: const Text(
                                                                'Reject',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ),
                                                          ),
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
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 12, right: 12, bottom: 8),
                      child: Container(
                        height: 135,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    child: ClipOval(
                                      child: Image.network(
                                        userImage!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: width * 0.53,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // BigText(
                                        //   text: username!,
                                        //   size: 17,
                                        // ),

                                        Text(
                                          username!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 15,
                                          ),
                                        ),

                                        TextLight(
                                          text: "Web Designer",
                                          size: 13,
                                          color: AppColors.greyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: _items[index]["status"] ==
                                              "Approved"
                                          ? AppColors.greenColor
                                              .withOpacity(0.1)
                                          : (_items[index]["status"] ==
                                                  "Rejected"
                                              ? AppColors.redColor
                                                  .withOpacity(0.1)
                                              : Colors.yellow.withOpacity(0.1)),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextLight(
                                        text: _items[index]["status"],
                                        size: 12,
                                        color: _items[index]["status"] ==
                                                "Approved"
                                            ? AppColors.greenColor
                                            : (_items[index]["status"] ==
                                                    "Rejected"
                                                ? AppColors.redColor
                                                : Colors.yellow),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextLight(
                                        text: _items[index]["time"],
                                        size: 14,
                                        color: AppColors.greyColor,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      BigText(
                                        text: _items[index]["date"],
                                        size: 18,
                                      )
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                      color: AppColors.offwhite,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ],
                              ),
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
