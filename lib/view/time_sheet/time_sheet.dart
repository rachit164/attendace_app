import 'dart:convert';

import 'package:attendance_app/view/time_sheet_page/time_sheet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text_bold.dart';
import '../../widgets/text_light.dart';
import '../leave_request/leave_request.dart';

class TimeSheet extends StatefulWidget {
  const TimeSheet({Key? key}) : super(key: key);

  @override
  State<TimeSheet> createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/timesheet.json');
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

  TextEditingController fromDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final now = DateTime.now();
    String formatter = DateFormat('d-MM-y').format(now);

    return Scaffold(
      backgroundColor: AppColors.offwhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TimeSheetPage()));
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  BigText(text: "Time Sheet")
                ],
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Container(
                height: 50,
                width: width - width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.24,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: formatter,
                            hintStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          controller: fromDateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              setState(() {
                                fromDateController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              fromDateController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                        child: Image.asset(
                          "assets/images/calendar_icon@2x.png",
                          width: width * 0.05,
                          height: height * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 0.2,
              ),
              SizedBox(
                  height: height * 0.784,
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
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.001),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: DraggableScrollableSheet(
                                            initialChildSize: 0.5,
                                            minChildSize: 0.2,
                                            maxChildSize: 0.75,
                                            builder: (_, controller) {
                                              return Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    topRight:
                                                        Radius.circular(25.0),
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
                                                            itemCount: 1,
                                                            itemBuilder:
                                                                (_, index) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 20,
                                                                ),
                                                                child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "assets/images/activity_icon@2x.png",
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              TextLight(
                                                                                text: "Activity",
                                                                                size: 14,
                                                                                color: AppColors.blueColor,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 3,
                                                                              ),
                                                                              TextLight(
                                                                                text: "Costumer Meeting",
                                                                                size: 16,
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "assets/images/date@2x.png",
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              TextLight(
                                                                                text: "Date & Time",
                                                                                size: 14,
                                                                                color: AppColors.blueColor,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 3,
                                                                              ),
                                                                              TextLight(
                                                                                text: "Feb 28,2023 - Mar 10,2023",
                                                                                size: 16,
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "assets/images/description_icon@2x.png",
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              TextLight(
                                                                                text: "Description",
                                                                                size: 14,
                                                                                color: AppColors.blueColor,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 3,
                                                                              ),
                                                                              const Text(
                                                                                "Leave application for function.",
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontFamily: 'Inter',
                                                                                ),
                                                                                maxLines: 2,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Image
                                                                              .asset(
                                                                            "assets/images/doc_icon@2x.png",
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              TextLight(
                                                                                text: "Attach File",
                                                                                size: 14,
                                                                                color: AppColors.blueColor,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 3,
                                                                              ),
                                                                              const Text(
                                                                                "Plan work flowchart filetype.ppt",
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontFamily: 'Inter',
                                                                                ),
                                                                                maxLines: 2,
                                                                              )
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Image.asset(
                                                                                "assets/images/user_icon@2x.png",
                                                                                width: 32,
                                                                                height: 32,
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 12,
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  TextLight(
                                                                                    text: "Assigned By",
                                                                                    size: 14,
                                                                                    color: AppColors.blueColor,
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 3,
                                                                                  ),
                                                                                  const Text(
                                                                                    "Prashant Pareek",
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      fontFamily: 'Inter',
                                                                                    ),
                                                                                    maxLines: 2,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Image.asset(
                                                                                "assets/images/tick_icon@2x.png",
                                                                                width: 32,
                                                                                height: 32,
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 12,
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  TextLight(
                                                                                    text: "Status",
                                                                                    size: 14,
                                                                                    color: AppColors.blueColor,
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    height: 3,
                                                                                  ),
                                                                                  const Text(
                                                                                    "Completed",
                                                                                    style: TextStyle(
                                                                                      fontSize: 16,
                                                                                      fontFamily: 'Inter',
                                                                                    ),
                                                                                    maxLines: 2,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ]),
                                                              );
                                                            }))
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: _items[index]["status"] ==
                                                      "Approved"
                                                  ? AppColors.greenColor
                                                      .withOpacity(0.1)
                                                  : (_items[index]["status"] ==
                                                          "Rejected"
                                                      ? AppColors.redColor
                                                          .withOpacity(0.1)
                                                      : Colors.blue
                                                          .withOpacity(0.1)),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child: Center(
                                              child: TextLight(
                                                text: _items[index]["status"],
                                                size: 12,
                                                color: _items[index]
                                                            ["status"] ==
                                                        "Approved"
                                                    ? AppColors.greenColor
                                                    : (_items[index]
                                                                ["status"] ==
                                                            "Rejected"
                                                        ? AppColors.redColor
                                                        : Colors.blue),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextLight(
                                            text: _items[index]["time"],
                                            size: 14,
                                            color: AppColors.greyColor,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          BigText(
                                            text: _items[index]["reason"],
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
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.greyColor,
                                            size: 22,
                                          )),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
