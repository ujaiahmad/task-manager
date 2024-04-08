import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/Model%20file/eventModal.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:new_and_improved_todo/custom%20widgets/customAppBar.dart';
import 'package:new_and_improved_todo/custom%20widgets/customCardHomePage.dart';
import 'package:new_and_improved_todo/custom%20widgets/customColumnPadding.dart';
import 'package:new_and_improved_todo/custom%20widgets/customCardforEachDay.dart';
import 'package:new_and_improved_todo/tableCalendar.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  static String id = 'homePage';
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventModal>(
      builder: (context, value, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(),
        body: CustomContainerPadding(
          gradientColor: backgroundGradient2,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi Ujai',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                    Text(
                      'You have ${value.events.length.toString()} total events',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              value.events.isEmpty
                  ? Flexible(
                      flex: 2,
                      child: Card(
                        child: Center(
                          child: Text(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white60),
                              'No Task for today\nClick on the calendar icon to add task'),
                        ),
                      ),
                    )
                  : Flexible(
                      flex: 2,
                      child: CustomCardforEachDay(
                        eventList: value.getEventsForday(DateTime.now()),
                        index: 0,
                      )),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Monthly Review', style: whiteTextStyle),
                    IconButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(6),
                            shadowColor: MaterialStatePropertyAll(Colors.black),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff28D0FC))),
                        onPressed: () {
                          Navigator.pushNamed(context, TableCalendarCustom.id);
                        },
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomCardHomePage(
                              count: value.getStatus()[2].toString(),
                              flex: 3,
                              status: 'Ongoing'), //3
                          CustomCardHomePage(
                              count: value.getStatus()[0].toString(),
                              flex: 2,
                              status: 'Done'), //2
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomCardHomePage(
                              count: value.getStatus()[1].toString(),
                              status: 'In Progress',
                              flex: 2),
                          CustomCardHomePage(
                              count: value.getStatus()[3].toString(),
                              status: 'Waiting for review',
                              flex: 5)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
