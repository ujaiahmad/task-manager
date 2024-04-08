import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/constant/constant.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.textbutton,
    required this.function,
  });
  final String textbutton;
  final void Function() function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff4530B3)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))),
          child: Text(
            textbutton,
            style: whiteTextStyle.copyWith(fontSize: 13),
          )),
    );
  }
}
