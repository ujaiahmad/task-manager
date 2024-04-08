import 'package:flutter/material.dart';
import 'package:new_and_improved_todo/Model%20file/eventModal.dart';
import 'package:new_and_improved_todo/getStarted.dart';
import 'package:new_and_improved_todo/homepage.dart';
import 'package:new_and_improved_todo/calendarDetail.dart';
import 'package:new_and_improved_todo/tableCalendar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => EventModal(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: GoogleFonts.roboto(Theme.of(context).textTheme),
        cardTheme: CardTheme(color: Color(0xff5451D6), elevation: 15),
        fontFamily: 'Fira Sans',
        useMaterial3: true,
      ),
      // home: GetStarted(),
      initialRoute: GetStarted.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        GetStarted.id: (context) => GetStarted(),
        CalendarPage.id: (context) => CalendarPage(),
        TableCalendarCustom.id: (context) => TableCalendarCustom(),
      },
    );
  }
}
