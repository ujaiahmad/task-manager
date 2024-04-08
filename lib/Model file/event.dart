class Event {
  final String task;
  final DateTime date;
  final List<String> person;
  String status;
  Event(this.task, this.date, this.person, {this.status = 'Ongoing'});

  // void changeStatus(String status1) {
  //   status = status1;
  // }
}
