import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/text_light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../../providers/punching_provider.dart';
import '../../utils/colors.dart';
import 'dart:convert';

class PunchingPage extends StatefulWidget {
  const PunchingPage({Key? key}) : super(key: key);

  @override
  State<PunchingPage> createState() => _PunchingPageState();
}

class _PunchingPageState extends State<PunchingPage> {
  double? latitude1;
  double? longitude;
  bool _isIn = false;
  String inTime = "";
  String outTime = "";
  DateTime datetime = DateTime.now();
  String punchIn = "", punchOut = "";
  void _determinePosition() async {
    bool serviceEnabled;
    DateTime dt = DateTime.now();
    String hour = dt.hour.toString();
    print(hour); //output (24 hour format): 20

    String minute = dt.minute.toString();
    print(minute);

    String second = dt.second.toString();
    print(second);

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print('Printing text before getCurrentLocation()');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    latitude1 = position.latitude;
    longitude = position.longitude;
  }

  @override
  void initState() {
    // final punchdata = Provider.of<PunchingProvider>(context, listen: false);
    // print(punchdata);
    _determinePosition();
    // TODO: implement initState
    super.initState();

    setState(() {
      punchIn = "";
      punchOut = "";
    });

    getLastPunching();
  }

  void getLastPunching() async {
    final prefs = await SharedPreferences.getInstance();
    String? punchTimeData = prefs.getString("punchTime");
    print("=====punchTime====");
    print(punchTimeData);
    print("=====punchTime====");
    if (punchTimeData != null) {
      final body = json.decode(punchTimeData);
      print("=====body====");
      print(body);
      print("=====body====");
    }
  }

  //get latitude and departure

  @override
  Widget build(
    BuildContext context,
  ) {
    @override
    final punching = Provider.of<PunchingProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //  DateTime datetime = DateTime.now();
    // String formattedDate = DateFormat('kk:mm a').format(datetime);
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
                              text: "==",
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
                              text: "===",
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
                    TextButton(
                      onPressed: () {
                        punching.punchInOut(latitude1!, longitude!);
                        _isIn = true;
                        // print("lati" + latitude1.toString());
                        // print("lon" + longitude.toString());
                      },
                      child: Text("Get POSITION"),
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
                        _determinePosition;
                        // Future.delayed(Duration(seconds: 2), () {
                        //   setState(() {
                        //     isFinished = true;
                        //   });
                        // });
                      },
                      onFinish: () async {
                        _determinePosition;
                        print("On finish method");

                          var res = {
                            "punchIn": "555",
                            "punchOut": "",
                            "dateTIme": DateTime.now()
                          };
                          final prefs = await SharedPreferences.getInstance();
                           await prefs.setString("punchTime", res.toString());
                        }


                        //
                        // // await Navigator.push(
                        // //     context,
                        // //     PageTransition(
                        // //         type: PageTransitionType.fade,
                        // //         child: DashboardScreen()));
                        // //
                        // // //TODO: For reverse ripple effect animation
                        // // setState(() {
                        // //   isFinished = false;
                        // // });
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
