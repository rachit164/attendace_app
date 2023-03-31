import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text_bold.dart';
import '../../widgets/text_light.dart';

class TimeSheetPage extends StatefulWidget {
  const TimeSheetPage({Key? key}) : super(key: key);

  @override
  State<TimeSheetPage> createState() => _TimeSheetPageState();
}

class _TimeSheetPageState extends State<TimeSheetPage> {
  TextEditingController fromDateController = TextEditingController();

  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final now = DateTime.now();
    String formatter = DateFormat('d-M-y').format(now);

    return Scaffold(
      backgroundColor: AppColors.offwhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                      BigText(text: "Time Sheet"),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DropdownButtonActivity(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DropdownButtonFromTime(),
                      DropdownButtonToTime(),
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
                          hintText: 'Write a description...'),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/attach_icon@2x.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextLight(
                          text: "Attach File",
                          size: 15,
                          color: AppColors.greyColor,
                        ),
                      ],
                    ),
                  ),
                  const DropdownButtonAssigned(),
                  const DropdownButtonStatus(),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blueColor,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
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

class DropdownButtonActivity extends StatefulWidget {
  const DropdownButtonActivity({super.key});

  @override
  State<DropdownButtonActivity> createState() => _DropdownButtonActivityState();
}

class _DropdownButtonActivityState extends State<DropdownButtonActivity> {
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
            text: "Activity",
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
                'Please select activity',
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

class DropdownButtonFromTime extends StatefulWidget {
  const DropdownButtonFromTime({super.key});

  @override
  State<DropdownButtonFromTime> createState() => _DropdownButtonFromTimeState();
}

class _DropdownButtonFromTimeState extends State<DropdownButtonFromTime> {
  List<String> list = <String>['Half Day', 'Full Day'];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String? dropdownValue;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: width * 0.42,
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLight(
            text: "From Time",
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
                'Time',
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

class DropdownButtonToTime extends StatefulWidget {
  const DropdownButtonToTime({super.key});

  @override
  State<DropdownButtonToTime> createState() => _DropdownButtonToTimeState();
}

class _DropdownButtonToTimeState extends State<DropdownButtonToTime> {
  List<String> list = <String>['Half Day', 'Full Day'];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String? dropdownValue;
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(8)),
      width: width * 0.42,
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextLight(
            text: "To Time",
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
                'Time',
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

class DropdownButtonAssigned extends StatefulWidget {
  const DropdownButtonAssigned({super.key});

  @override
  State<DropdownButtonAssigned> createState() => _DropdownButtonAssignedState();
}

class _DropdownButtonAssignedState extends State<DropdownButtonAssigned> {
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
            text: "Assigned By",
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

class DropdownButtonStatus extends StatefulWidget {
  const DropdownButtonStatus({super.key});

  @override
  State<DropdownButtonStatus> createState() => _DropdownButtonStatusState();
}

class _DropdownButtonStatusState extends State<DropdownButtonStatus> {
  List<String> list = <String>['Completed', 'Pending'];

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
            text: "Status",
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
                'Please select status',
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
