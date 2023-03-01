import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/team_leaves.dart';
import 'package:attendance_app/widgets/text_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_leaves.dart';

class LeaveTracker extends StatelessWidget {
  const LeaveTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: AppColors.offwhite,
            bottom: const TabBar(
              labelColor: AppColors.blueColor,
              indicatorColor: AppColors.blueColor,
              labelPadding: EdgeInsets.only(bottom: 10),
              unselectedLabelColor: Colors.black54,
              tabs: [
                Text(
                  "My Leaves",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Team Leaves",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            title: BigText(
              text: 'Leave Tracker',
            ),
          ),
          body: const TabBarView(
            children: [
              MyLeaves(),
              TeamLeaves(),
            ],
          ),
        ),
      ),
    );
  }
}
