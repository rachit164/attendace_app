import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/text_light.dart';

class LeaveRequest extends StatefulWidget {
  LeaveRequest({Key? key}) : super(key: key);

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat('d-M-y').format(now);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      BigText(text: "Leave Request")
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DropdownButtonExample(),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        color: AppColors.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLight(
                              text: "From date",
                              size: 15,
                              color: AppColors.greyColor,
                            ),
                            Container(
                              width: width * 0.38,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
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
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          fromDateController.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {}
                                    },
                                    child: Image.asset(
                                      "assets/images/date@2x.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        color: AppColors.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLight(
                              text: "To date",
                              size: 15,
                              color: AppColors.greyColor,
                            ),
                            Container(
                              width: width * 0.38,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.24,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: formatter,
                                        hintStyle: const TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 18),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      controller: toDateController,
                                      readOnly: true,
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
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                          setState(() {
                                            toDateController.text =
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
                                            DateFormat('dd-MM-yyyy')
                                                .format(pickedDate);
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                        setState(() {
                                          toDateController.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      } else {}
                                    },
                                    child: Image.asset(
                                      "assets/images/date@2x.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 8),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your reason here...'),
                    ),
                  ),
                  AnimatedContainer(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    duration: const Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Text('1 task assigned in this duration'),
                          // leading:
                          //     Image.asset(
                          //   "assets/images/tick@2x.png",
                          //   width: 20,
                          //   height: 20,
                          // ),
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            )
                          ],
                        )),
                  ),
                  // Container(
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.whiteColor,
                  //       borderRadius: BorderRadius.circular(8)),
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.all(10),
                  //   margin: const EdgeInsets.all(8),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         "assets/images/tick@2x.png",
                  //         width: 20,
                  //         height: 20,
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       const Text(
                  //         "2 Tasks",
                  //         style: TextStyle(
                  //             decoration: TextDecoration.underline,
                  //             fontFamily: 'Inter',
                  //             fontSize: 16,
                  //             color: AppColors.blueColor),
                  //       ),
                  //       const SizedBox(
                  //         width: 3,
                  //       ),
                  //       TextLight(
                  //         text: "assigned in this duration",
                  //         color: AppColors.blackColor,
                  //         size: 16,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blueColor,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Apply for 5 days leave',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> list = <String>['Half Day', 'Full Day'];

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLight(
            text: "Type",
            size: 14,
            color: AppColors.greyColor,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              value: dropdownValue,
              focusColor: Colors.transparent,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              style: const TextStyle(color: AppColors.blackColor),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              hint: const Text(
                'Please select leave type',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    color: AppColors.greyColor),
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
