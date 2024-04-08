import 'package:intl/intl.dart';
import 'package:new_and_improved_todo/Model%20file/event.dart';
import 'package:flutter/material.dart';

class EventModal extends ChangeNotifier {
  List<Event> events = [
    // Event('Example Task', DateTime.now(), ['Person1', 'Person2'])
  ];

  void addEvents(
    String task,
    DateTime date,
    List<String> person,
  ) {
    events.add(Event(task, date, person));
    notifyListeners();
  }

  void remove() {
    events.remove(Event);
    notifyListeners();
  }

  String getIndividualStatus(int index) {
    return events[index].status;
  }

  void updateStatus(int index, String status1) {
    events[index].status = status1;
    notifyListeners();
  }

  List<Event> getEventsForday(DateTime date) {
    List<Event> eventforday = [];
    for (var event in events) {
      if (DateFormat('dd-MM-yyyy').format(event.date) ==
          DateFormat('dd-MM-yyyy').format(date)) {
        // print(event.task);
        eventforday.add(event);
      }
    }
    return eventforday;
  }

  List<int> getStatus() {
    int done = 0;
    int inProgress = 0;
    int onGoing = 0;
    int review = 0;
    late List<int> statuses;
    for (var event in events) {
      if (event.status == 'Ongoing') {
        onGoing++;
      } else if (event.status == 'done') {
        done++;
      } else if (event.status == 'inProgress') {
        inProgress++;
      } else {
        review++;
      }
    }
    statuses = [done, inProgress, onGoing, review];
    return statuses;
  }

  void getEvents() {
    // var uhh = events[0].task;
    // print(events);
    for (var event in events) {
      print('------------------');
      print(event.task);
      print(event.date);
      print(event.person);
      print(event.status);
    }
  }
}
