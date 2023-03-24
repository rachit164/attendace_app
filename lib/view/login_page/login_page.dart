import 'dart:convert';

import 'package:attendance_app/view/home_page/home_page.dart';
import 'package:attendance_app/providers/auth_provider.dart';
import 'package:attendance_app/providers/drop_down_list.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/alert_message.dart';
import 'package:attendance_app/view_model/auth_view_model.dart';
import 'package:attendance_app/widgets/big_text_bold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drop_down.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _passwordVisible;
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _passwordVisible = false;
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    var dropDownData =
        Provider.of<DropDownProvider>(context, listen: false).dropDown();
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);
    final authViewModel = Provider.of<AuthViewModel>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    AlertMessages alert = AlertMessages();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: height * 0.08),
          child: Form(
            key: _formKey,
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
                const Dropdown(),
                SizedBox(
                  height: height * 0.005,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.offwhite,
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
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (valu) {
                      FocusScope.of(context).requestFocus(_focusNodes[0]);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: passwordController,
                    focusNode: _focusNodes[0],
                    obscureText:
                        _focusNodes[0].hasFocus ? !_passwordVisible : true,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: IconButton(
                        icon: const Icon(
                          // Based on passwordVisible state choose the icon
                          Icons.lock,
                        ),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          _focusNodes[0].hasFocus
                              ? setState(() {
                                  _passwordVisible = !_passwordVisible;
                                })
                              : null;
                        },
                      ),
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.offwhite,
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
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
                      if (emailController.text.isEmpty ||
                          !emailController.text.contains('@')) {
                        alert.showError(context, 'Email is not valid ');
                      } else if (passwordController.text.isEmpty) {
                        alert.showError(context, 'Please enter password');
                      } else {
                        authProvider.login(emailController.text.toString(),
                            passwordController.text.toString(), context);
                        // var data = json.encode({
                        //   "Company": {
                        //     "CompanyId": 1,
                        //     "CompanyName":
                        //         "VertexPlus Technologies Private Limited",
                        //     "CompanyCode": "VTPL03"
                        //   },
                        //   "EmailId": "admin@vertexplus.com",
                        //   "Password": "password123",
                        //   "GrantType": "password",
                        //   "Reason": "Dummy Login Reason"
                        // });
                        // authViewModel.loginApi(data, context);
                        // print("api hit");
                      }
                    },
                    child: authProvider.loading
                        // authViewModel.loading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
