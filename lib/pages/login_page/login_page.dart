import 'package:attendance_app/pages/home_page/home_page.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _passwordVisible;
  @override
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  void initState() {
    _passwordVisible = false;
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: height * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.03),
                child: Image.asset(
                  "assets/images/logo_login.png",
                  width: width * 0.13,
                  height: height * 0.13,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(left: width * 0.03),
                child: BigText(
                  text: "Sign In",
                  color: AppColors.blackColor,
                  size: 25,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const TextField(
                  style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.loginPageInputText,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: AppColors.blueColor, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  focusNode: _focusNodes[0],
                  obscureText:
                      _focusNodes[0].hasFocus ? !_passwordVisible : true,
                  style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: IconButton(
                      icon: const Icon(
                        // Based on passwordVisible state choose the icon
                        Icons.lock,
                      ),
                      onPressed: () {},
                    ),

                    // _focusNodes[0].hasFocus
                    //     ? Image.asset("assets/images/password_active_icon.png")
                    //     : Image.asset("assets/images/password_icon.png"),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        _focusNodes[0].hasFocus
                            ? setState(() {
                                _passwordVisible = !_passwordVisible;
                              })
                            : null;
                      },
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: AppColors.loginPageInputText,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: AppColors.blueColor, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blueColor,
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
