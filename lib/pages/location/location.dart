import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/text_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../utils/colors.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/map.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    top: height * 0.055,
                    right: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Location",
                      size: height * 0.033,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextLight(
                      text:
                          "B-19, 10-B Scheme, Gopalpura Road, Jaipur, Rajasthan 302018",
                      size: height * 0.020,
                      color: AppColors.iconColors,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Punch In",
                              size: height * 0.026,
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            TextLight(
                              text: "10:00 AM",
                              color: AppColors.iconColors,
                              size: height * 0.023,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Punch Out",
                              size: height * 0.026,
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            TextLight(
                              text: "--:--",
                              color: AppColors.iconColors,
                              size: height * 0.023,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.loginPageInputText,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: "05"),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        BigText(text: ":"),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.loginPageInputText,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: "05"),
                        ),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        BigText(text: ":"),
                        SizedBox(
                          width: width * 0.015,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.loginPageInputText,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: "12"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SwipeableButtonView(
                      buttonText: 'Swipe to Punch Out',
                      buttonWidget: Container(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),
                      ),
                      activeColor: AppColors.blueColor,
                      isFinished: true,
                      onWaitingProcess: () {
                        // Future.delayed(Duration(seconds: 2), () {
                        //   setState(() {
                        //     isFinished = true;
                        //   });
                        // });
                      },
                      onFinish: () {
                        // await Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         type: PageTransitionType.fade,
                        //         child: DashboardScreen()));
                        //
                        // //TODO: For reverse ripple effect animation
                        // setState(() {
                        //   isFinished = false;
                        // });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
