import 'package:flutter/material.dart';

class CustomisedRichText extends StatelessWidget {
  const CustomisedRichText(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.firstColor,
      required this.secondColor,
      required this.fontHeight});
  final String firstText;
  final String secondText;
  final Color firstColor;
  final Color secondColor;
  final double fontHeight;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: fontHeight, fontWeight: FontWeight.bold),
      TextSpan(children: [
        TextSpan(text: firstText, style: TextStyle(color: firstColor)),
        TextSpan(text: secondText, style: TextStyle(color: secondColor)),
      ]),
    );
  }
}
