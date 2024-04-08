import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/constant/constant.dart';

class CustomCardHomePage extends StatelessWidget {
  const CustomCardHomePage({
    super.key,
    required this.count,
    required this.status,
    required this.flex,
  });
  final String count;
  final String status;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: whiteTextStyle.copyWith(fontSize: 30),
          ),
          Text(
            status,
            style: TextStyle(color: Colors.white70),
          )
        ],
      )),
    );
  }
}
