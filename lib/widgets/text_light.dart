import 'package:flutter/cupertino.dart';

class TextLight extends StatelessWidget {
  TextLight(
      {required this.text,
      this.color = const Color(0xFF332d2b),
      this.overflow = TextOverflow.clip,
      this.size = 0,
      Key? key})
      : super(key: key);
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: TextStyle(
          overflow: overflow,
          color: color,
          fontFamily: 'Inter',
          fontSize: size == 0 ? 20 : size,
          fontWeight: FontWeight.normal),
    );
  }
}
