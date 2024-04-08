import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_and_improved_todo/Model%20file/event.dart';
import 'package:new_and_improved_todo/Model%20file/eventModal.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:provider/provider.dart';

class CustomCardforEachDay extends StatelessWidget {
  const CustomCardforEachDay({
    super.key,
    required this.eventList,
    required this.index,
  });

  final List<Event> eventList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventModal>(
      builder: (context, value, child) {
        return Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            eventList[index].task,
                            style: whiteTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    DropdownButton(
                      iconEnabledColor: Colors.white,
                      alignment: Alignment.center,
                      underline: Container(
                        height: 0,
                      ),
                      style: whiteTextStyle.copyWith(fontSize: 15),
                      borderRadius: BorderRadius.circular(15),
                      dropdownColor: Color(0xff4530B3),
                      value: value.events[index].status,
                      items: const [
                        DropdownMenuItem(
                          value: 'Ongoing',
                          child: Text('Ongoing'),
                        ),
                        DropdownMenuItem(
                          value: 'inProgress',
                          child: Text('In Progress'),
                        ),
                        DropdownMenuItem(
                          value: 'review',
                          child: Text('Pending Review'),
                        ),
                        DropdownMenuItem(
                          value: 'done',
                          child: Text('Done'),
                        ),
                      ],
                      onChanged: (value1) {
                        context.read<EventModal>().updateStatus(index, value1!);
                        // print(value.events[index].status);
                      },
                    )
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: Colors.white38),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(5),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.task,
                    //           color: Colors.white70,
                    //         ),
                    //         Text(eventList[index].status,
                    //             style: TextStyle(color: Colors.white)),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
                Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 8),
                    Text(
                        DateFormat('EE, d MMM yyyy, h:mm a')
                            .format(eventList[index].date),
                        style: TextStyle(color: Colors.white70)),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 8),
                Builder(
                  builder: (context) {
                    List<Widget> personWidget = [
                      Icon(
                        Icons.groups_outlined,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 8)
                    ];
                    for (var person in eventList[index].person) {
                      personWidget.add(Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          person,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ));
                    }
                    return Row(children: personWidget);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
