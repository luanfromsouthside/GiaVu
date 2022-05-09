import 'package:flutter/material.dart';

//color
const kPrimaryColor = Color(0xFF8E24AA);
const kLightColor = Color(0xFFE1BEE7);

//font
class PrimaryFont {
  static String font = 'Roboto';

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.w100,
      fontSize: size
    );
  }

  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.w300,
      fontSize: size
    );
  }

  static TextStyle regular(double size) {
    return TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.w400,
      fontSize: size
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.w500,
      fontSize: size
    );
  }

  static TextStyle bold(double size) {
    return TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.w700,
      fontSize: size
    );
  }
}

//extension
extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

//Dialog
class CustomDialog {
  static makeDialog({
    required BuildContext context,
    required String title,
    required String content,
    List<Widget>? actions
  }) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      )
    );
  }
}