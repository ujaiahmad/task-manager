import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:new_and_improved_todo/homepage.dart';

class GetStarted extends StatelessWidget {
  static String id = 'getStarted';
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: backgroundGradient,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
                    child: Image.asset('asset/people1.png'),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Manage your daily tasks',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff030B3E)),
                ),
                const SizedBox(height: 24),
                const Text(
                    'Team and Project management with solution providing App',
                    style: TextStyle(color: Color(0xff030B3E))),
                const SizedBox(height: 25),
                ElevatedButton(
                    style: buttonStyle,
                    onPressed: () =>
                        Navigator.pushNamed(context, MyHomePage.id),
                    child:
                        const Text('Get Started', style: textButtonstyleDark))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
