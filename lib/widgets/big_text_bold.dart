import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  BigText(
      {required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 0,
      Key? key})
      : super(key: key);
  final Color? color;
  final String text;
  double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: 'Inter',
          fontSize: size == 0 ? 20 : size,
          fontWeight: FontWeight.bold),
    );
  }
}
