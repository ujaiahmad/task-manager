import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/Model%20file/event.dart';
import 'package:new_and_improved_todo/Model%20file/eventModal.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:new_and_improved_todo/custom%20widgets/customAppBar.dart';
import 'package:new_and_improved_todo/custom%20widgets/customCardforEachDay.dart';
import 'package:new_and_improved_todo/custom%20widgets/customColumnPadding.dart';
import 'package:new_and_improved_todo/custom%20widgets/taskform.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarCustom extends StatefulWidget {
  static String id = 'tableCalendar';
  const TableCalendarCustom({super.key});

  @override
  State<TableCalendarCustom> createState() => _TableCalendarCustomState();
}

class _TableCalendarCustomState extends State<TableCalendarCustom> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late List<Event> eventList;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    getEventByDay();
  }

  void getEventByDay() {
    setState(() {
      eventList =
          List.from(context.read<EventModal>().getEventsForday(_selectedDay));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventModal>(
      builder: (context, value, child) => Scaffold(
        appBar: CustomAppBar(),
        body: CustomContainerPadding(
            widget: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      eventList = List.from(context
                          .read<EventModal>()
                          .getEventsForday(_selectedDay));
                    });
                  },

                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  // eventLoader: context.read<EventModal>().getEventsForday(_selectedDay),
                  rangeSelectionMode: RangeSelectionMode.toggledOff,
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                        color: Color(0xff030B3E), fontWeight: FontWeight.bold),
                    outsideDaysVisible: false,
                  ),
                ),
                eventList.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'No task for today\nclick on \'+\' icon to create new task',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: eventList.length,
                          itemBuilder: (context, index) {
                            return CustomCardforEachDay(
                              eventList: eventList,
                              index: index,
                            );
                            // Text(eventList[index].task);
                          },
                        ),
                      )
              ],
            ),
            gradientColor: backgroundGradient),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, TaskForm.id,
            //     arguments: (_selectedDay, _focusedDay));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskForm(
                    selectedDay: _selectedDay,
                    focusedDay: _focusedDay,
                  ),
                )).then((value) => getEventByDay());
          },
          shape: CircleBorder(),
          backgroundColor: Color(0xff4530B3),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
