import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:new_and_improved_todo/custom%20widgets/customAppBar.dart';
import 'package:new_and_improved_todo/custom%20widgets/customColumnPadding.dart';
import 'package:new_and_improved_todo/custom%20widgets/taskCard.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CalendarPage extends StatelessWidget {
  static String id = 'calendarPage';
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: CustomContainerPadding(
            gradientColor: backgroundGradient,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  headerProps: const EasyHeaderProps(
                    monthPickerType: MonthPickerType.switcher,
                    dateFormatter: null,
                  ),
                  activeColor: Color(0xff412DA8),
                  onDateChange: (selectedDate) {
                    print(selectedDate);
                  },
                  dayProps: const EasyDayProps(
                      dayStructure: DayStructure.monthDayNumDayStr,
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff3371FF),
                              Color(0xff8426D6),
                            ],
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('Ongoing',
                      style: whiteTextStyle.copyWith(color: Color(0xff030B3E))),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.2,
                          endChild: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TaskCard(
                              task: 'Mobile App Design',
                              person: 'Mike and Anita',
                              timeline: '${index + 1}',
                            ),
                          ),
                          // indicatorStyle: IndicatorStyle(
                          //   width: 35,
                          //   // iconStyle: IconStyle(
                          //   //   color: Colors.white,
                          //   //   iconData: Icons.insert_emoticon,
                          //   // ),
                          // ),
                          beforeLineStyle: LineStyle(thickness: 2),
                          afterLineStyle: LineStyle(thickness: 2),
                          startChild: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              index == 0
                                  ? Text(
                                      '$index:00',
                                      style:
                                          TextStyle(color: Color(0xff030B3E)),
                                    )
                                  : SizedBox.shrink(),
                              Spacer(),
                              Text(
                                '${index + 1}:00',
                                style: TextStyle(color: Color(0xff030B3E)),
                              ),
                            ],
                          ));
                    },
                  ),
                )
              ],
            )));
  }
}
