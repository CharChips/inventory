// //this below code designs the modalbottomsheet

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:task_manager2/models/model.dart';
// import 'package:task_manager2/providers/task_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:task_manager2/tasksScreen.dart';

// class NewEntry extends ConsumerStatefulWidget {
//   final Task? initialtask;

//   NewEntry({this.initialtask, super.key});

//   @override
//   ConsumerState<NewEntry> createState() => _NewEntryState();
// }

// class _NewEntryState extends ConsumerState<NewEntry> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   final _taskNameController = TextEditingController();
//   final _taskDescriptionController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialtask != null) {
//       _taskNameController.text = widget.initialtask!.taskname;
//       _taskDescriptionController.text = widget.initialtask!.description;
//       selectedDate = widget.initialtask!.date;
//       selectedTime = TimeOfDay(
//         hour: widget.initialtask!.hour!,
//         minute: widget.initialtask!.min!,
//       );
//     }
//   }

//   void timePicker() async {
//     final now = TimeOfDay.now();
//     final pickedTime = await showTimePicker(
//       context: context,
//       initialTime: now,
//     );

//     if (pickedTime != null) {
//       setState(() {
//         selectedTime = pickedTime;
//       });
//     }
//   }

//   void presentDatePicker() async {
//     final now = DateTime.now();
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 1),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }

//   Future<void> onaddtask() async {
//     final initialTask = widget.initialtask;
//     final taskname = _taskNameController.text;
//     final taskdescription = _taskDescriptionController.text;
//     final taskdate = selectedDate ?? initialTask?.date;
//     final hour = selectedTime?.hour ?? initialTask?.hour;
//     final min = selectedTime?.minute ?? initialTask?.min;

//     if (taskname.isEmpty ||
//         taskdescription.isEmpty ||
//         taskdate == null ||
//         hour == null ||
//         min == null) {
//       print('Please fill in all fields.');
//       return;
//     }

//     final newTask = Task(
//       taskname: taskname,
//       description: taskdescription,
//       date: taskdate,
//       hour: hour,
//       min: min,
//       id: initialTask?.id ?? '',
//       hourcheck: hour,
//     );

//     if (initialTask != null) {
//       final url = Uri.https(
//           'task-manager-app-67b0c-default-rtdb.firebaseio.com',
//           '/Tasklist/${initialTask.id}.json');
//       final response = await http.patch(
//         url,
//         headers: {'Content-type': 'application/json'},
//         body: json.encode({
//           'taskname': taskname,
//           'description': taskdescription,
//           'date': taskdate!.toIso8601String(),
//           'hour': hour,
//           'min': min,
//           'hourcheck': hour,
//           'id': initialTask?.id ?? ''
//         }),
//       );

//       if (response.statusCode >= 400) {
//         print('Failed to update task. Please try again.');
//         return;
//       }

//       ref.read(taskprovider.notifier).edittask(newTask);
//     } else {
//       final url = Uri.https(
//           'task-manager-app-67b0c-default-rtdb.firebaseio.com',
//           '/Tasklist.json');
//       final response = await http.post(
//         url,
//         headers: {'Content-type': 'application/json'},
//         body: json.encode({
//           'taskname': _taskNameController.text,
//           'description': _taskDescriptionController.text,
//           'date': formatter.format(selectedDate!),
//           'hour': selectedTime!.hour,
//           'min': selectedTime!.minute,
//           'hourcheck': selectedTime!.hour,
//         }),
//       );

//       if (response.statusCode >= 400) {
//         print('Failed to add task. Please try again.');
//         return;
//       }

//       final data = json.decode(response.body) as Map<String, dynamic>;
//       final String id = data['name'];

//       newTask.id = id;
//       ref.read(taskprovider.notifier).addTask(newTask);
//     }

//     _taskNameController.clear();
//     _taskDescriptionController.clear();
//     Navigator.of(context).pop(Tasksscreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: const Color.fromARGB(255, 224, 113, 105)),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: TextField(
//                   controller: _taskNameController,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text(
//                       "Task Name",
//                       style: GoogleFonts.lato(
//                           textStyle: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color.fromARGB(255, 193, 128, 124)),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: TextField(
//                   controller: _taskDescriptionController,
//                   maxLines: 6,
//                   minLines: 1,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text(
//                       "Task Description",
//                       style: GoogleFonts.lato(
//                           textStyle: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.pink.shade200),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0.50),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Deadline:",
//                         style:
//                             GoogleFonts.lato(color: Colors.red, fontSize: 18),
//                       ),
//                       SizedBox(width: 5),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: presentDatePicker,
//                             icon: Icon(Icons.calendar_month_outlined,
//                                 color: Colors.blueAccent),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             selectedDate == null
//                                 ? 'Select Date'
//                                 : DateFormat.yMd().format(selectedDate!),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(width: 10),
//                           IconButton(
//                             onPressed: timePicker,
//                             icon: Icon(Icons.watch_later_outlined,
//                                 color: Colors.blueAccent),
//                           ),
//                           Text(
//                             selectedTime == null
//                                 ? 'Select Time'
//                                 : '${selectedTime!.hour}:${selectedTime!.minute}',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: onaddtask,
//               child: Container(
//                 width: 300,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.pink.shade300,
//                       const Color.fromARGB(255, 224, 113, 105),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 12),
//                 alignment: Alignment.center,
//                 child: Text(
//                   widget.initialtask == null ? "Add Task" : "Update Task",
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w800,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
