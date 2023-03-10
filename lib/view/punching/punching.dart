import 'dart:async';

import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:attendance_app/widgets/text_light.dart';
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
  bool isFinished = false;
  bool isIn = false;
  String inTime = "";
  String outTime = "";
  DateTime datetime = DateTime.now();
  String punchIn = "", punchOut = "";
  Timer? _timer;

  Duration duration = Duration();

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  void _determinePosition() async {
    bool serviceEnabled;
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
    if (punchTimeData != null) {
      final body = json.decode(prefs.getString("punchTime") as String);
      setState(() {
        punchIn = body['punchIn'];
        punchOut = body['punchOut'];
        startTimer();
      });
    }
  }

  @override
  void dispose() {
    //  _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    print("===========================");
    print("punchIn" + punchIn);
    print("===========================");
    if (punchIn != "" && punchOut == '') {
      print("punch in timer start" + punchIn);
      //time = currentTime - punchTime;

      _timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    }

    // Set Millisecond.
//    _stopWatchTimer.setPresetTime(mSec: 1234);
    // Start timer.
    //   _stopWatchTimer.onStartTimer();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    @override
    final punching = Provider.of<PunchingProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    DateTime datetime = DateTime.now();
    String formattedDate = DateFormat('hh:mm a').format(datetime);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));

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
            top: 50,
            left: 5,
            right: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
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
                      height: height * 0.010,
                    ),
                    TextLight(
                      text:
                          "B-19, 10-B Scheme, Gopalpura Road, Jaipur, Rajasthan 302018",
                      size: height * 0.020,
                      color: AppColors.iconColors,
                    ),
                    SizedBox(
                      height: height * 0.025,
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
                              text: punchIn.isEmpty ? "--/--" : punchIn,
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
                              text: punchOut.isEmpty ? "--/--" : punchOut,
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
                            color: AppColors.offwhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: hours),
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
                          decoration: const BoxDecoration(
                            color: AppColors.offwhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: minutes),
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
                          decoration: const BoxDecoration(
                            color: AppColors.offwhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: BigText(text: seconds),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: SwipeableButtonView(
                          buttonText: punchIn.isEmpty
                              ? "Swipe to punch in"
                              : "Swipe to punch out",
                          buttontextstyle: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          buttonWidget: Container(
                            child: Container(
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          activeColor: punchIn.isEmpty
                              ? AppColors.blueColor
                              : AppColors.greenColor,
                          isFinished: isFinished,
                          onWaitingProcess: () {
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {
                                isFinished = true;
                              });
                            });
                          },
                          isActive: punchOut.isNotEmpty ? false : true,
                          disableColor: AppColors.redColor,
                          onFinish: () async {
                            if (punchIn == '') {
                              var res = {
                                "punchIn": formattedDate,
                                "punchOut": "",
                                "dateTIme": DateTime.now().toString(),
                              };
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  "punchTime", json.encode(res));
                            } else {
                              var res = {
                                "punchIn": punchIn,
                                "punchOut": formattedDate,
                                "dateTIme": DateTime.now().toString()
                              };
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  "punchTime", json.encode(res));
                            }
                            if (punchIn == '') {
                              punching.punchInOut(latitude1, longitude,
                                  formattedDate, punchOut, context);
                              setState(() {
                                isIn = true;
                              });
                            } else {
                              punching.punchInOut(latitude1, longitude, punchIn,
                                  formattedDate, context);
                            }

                            // //
                            // // //TODO: For reverse ripple effect animation
                            setState(() {
                              isFinished = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PunchingPage(),
                              ),
                            );
                          },
                        ),
                      ),
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
