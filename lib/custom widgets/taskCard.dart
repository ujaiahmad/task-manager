import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/constant/constant.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.person,
    required this.timeline,
  });
  final String task;
  final String person;
  final String timeline;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task,
              style: whiteTextStyle,
            ),
            Text(
              person,
              style: TextStyle(color: Colors.white70),
            ),
            Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(),
                ),
                Spacer(),
                Text(timeline, style: TextStyle(color: Colors.white70)),
                SizedBox(width: 5)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
