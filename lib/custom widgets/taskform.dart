import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_and_improved_todo/Model%20file/eventModal.dart';
import 'package:new_and_improved_todo/constant/constant.dart';
import 'package:new_and_improved_todo/custom%20widgets/customAppBar.dart';
import 'package:new_and_improved_todo/custom%20widgets/customColumnPadding.dart';
import 'package:new_and_improved_todo/custom%20widgets/customElevatedbutton.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatefulWidget {
  static String id = 'taskForm';
  const TaskForm({
    super.key,
    required this.selectedDay,
    required this.focusedDay,
  });
  final DateTime selectedDay;
  final DateTime focusedDay;
  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController personController = TextEditingController();
  late DateTime _taskDateAndTime;
  late String hintext1;
  List<String> person = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    hintext1 =
        DateFormat('E, d MMM yy, H:mm a').format(widget.focusedDay).toString();
    _taskDateAndTime = widget.selectedDay;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dateController.dispose();
    taskController.dispose();
    personController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomContainerPadding(
        widget: Form(
          key: _formKey,
          child: ListView(
            physics: ClampingScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Enter Task Name', style: textButtonstyleDark),
              ),
              TextFormField(
                controller: taskController,
                onChanged: (value) {
                  taskController.text = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter task name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4530B3)))),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Date', style: textButtonstyleDark),
                        ),
                        TextFormField(
                          enabled: false,
                          controller: dateController,
                          decoration: InputDecoration(
                              hintText: hintext1, border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    textbutton: 'Pick a time',
                    function: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) => setState(() {
                            _taskDateAndTime = DateTime(
                                widget.selectedDay.year,
                                widget.selectedDay.month,
                                widget.selectedDay.day,
                                value!.hour,
                                value.minute);
                            hintext1 = DateFormat('E, d MMM yy, H:mm a')
                                .format(_taskDateAndTime)
                                .toString();

                            print(_taskDateAndTime.toString());
                            print('Time added');
                          }));
                    },
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Person Involved?',
                              style: textButtonstyleDark),
                        ),
                        TextFormField(
                          controller: personController,
                          decoration: InputDecoration(
                              hintText: 'Enter person\' name',
                              border: OutlineInputBorder()),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter person\'s name';
                          //   }
                          //   return null;
                          // },
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    textbutton: 'Add person',
                    function: () {
                      if (personController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Please enter person\'s name',
                              style: TextStyle(fontSize: 18),
                            ),
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))));
                      } else {
                        person.add(personController.text);
                        personController.clear();
                        print('Person added');
                      }
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomElevatedButton(
                    textbutton: 'Cancel',
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomElevatedButton(
                    textbutton: 'Add Task',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.down,
                            content: Text(
                              'Processing Data...',
                              style: TextStyle(fontSize: 18),
                            ),
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))));
                        context.read<EventModal>().addEvents(
                            taskController.text, _taskDateAndTime, person);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        gradientColor: backgroundGradient,
      ),
    );
  }
}

// showModalBottomSheet(
//               backgroundColor: Color(0xffF5F8FD),
//               isScrollControlled: true,
//               context: context,
//               builder: (context) => Container(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(
//                       15, 15, 15, MediaQuery.of(context).viewInsets.bottom),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child:
//                             Text('Enter Task Name', style: textButtonstyleDark),
//                       ),
//                       TextField(
//                         autofocus: true,
//                         controller: taskController,
//                         onChanged: (value) {
//                           taskController.text = value;
//                         },
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(color: Color(0xff4530B3)))),
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child:
//                                       Text('Date', style: textButtonstyleDark),
//                                 ),
//                                 TextField(
//                                   enabled: false,
//                                   controller: dateController,
//                                   decoration: InputDecoration(
//                                       hintText: hintext1,
//                                       border: OutlineInputBorder()),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           CustomElevatedButton(
//                             textbutton: 'Pick a time',
//                             function: () {
//                               showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               ).then((value) => setState(() {
//                                     _taskDateAndTime = DateTime(
//                                         _selectedDay.year,
//                                         _selectedDay.month,
//                                         _selectedDay.day,
//                                         value!.hour,
//                                         value.minute);
//                                     hintext1 = _taskDateAndTime.toString();

//                                     print(_taskDateAndTime.toString());
//                                     print('Time added');
//                                   }));
//                             },
//                           )
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(15),
//                                   child: Text('Person Involved?',
//                                       style: textButtonstyleDark),
//                                 ),
//                                 TextField(
//                                   controller: personController,
//                                   decoration: InputDecoration(
//                                       hintText: 'Enter person\' name',
//                                       border: OutlineInputBorder()),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           CustomElevatedButton(
//                             textbutton: 'Add person',
//                             function: () {
//                               print('Person added');
//                               person.add(personController.text);
//                             },
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           CustomElevatedButton(
//                             textbutton: 'Cancel',
//                             function: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                           CustomElevatedButton(
//                             textbutton: 'Add Task',
//                             function: () {
//                               // EventModal().addEvents(taskController.text,
//                               //     _taskDateAndTime, person);

//                               // Provider.of<EventModal>(context).addEvents(
//                               //     taskController.text,
//                               //     _taskDateAndTime,
//                               //     person);

//                               context.read<EventModal>().addEvents(
//                                   taskController.text,
//                                   _taskDateAndTime,
//                                   person);

//                               print('task added');
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );