import 'package:flutter/material.dart';

const backgroundGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
      Color.fromARGB(255, 173, 208, 241),
      Color(0xffF5F8FD),
    ]));

const backgroundGradient2 = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
      Color(0xff4530B3),
      Color(0xff7061E0),
    ]));

const buttonStyle = ButtonStyle(
    elevation: MaterialStatePropertyAll(5),
    backgroundColor: MaterialStatePropertyAll(Colors.white));

const textButtonstyleDark = TextStyle(
    color: Color(0xff030B3E), fontWeight: FontWeight.bold, fontSize: 15);

const whiteTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17);

// SnackBar customSnackbar = SnackBar(
//     behavior: SnackBarBehavior.floating,
//     content: Text(
//       '',
//       style: TextStyle(fontSize: 18),
//     ),
//     backgroundColor: Colors.redAccent,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
