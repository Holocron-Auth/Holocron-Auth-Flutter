// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// final _formKey2 = GlobalKey<FormState>();
// final _formKey3 = GlobalKey<FormState>();
// final _formKey4 = GlobalKey<FormState>();
//
// class EditableTextField extends StatefulWidget {
//   final String initialValue;
//   // final String finalValue;
//   final void Function(String) onSave;
//
//
//
//   const EditableTextField({
//     Key? key,
//     required this.initialValue,
//     // required this.finalValue,
//     required this.onSave,
//
//   }) : super(key: key);
//
//   @override
//   _EditableTextFieldState createState() => _EditableTextFieldState();
// }
//
// class _EditableTextFieldState extends State<EditableTextField> {
//   late TextEditingController _controller;
//   late TextEditingController _controller2;
//   late TextEditingController _controller3;
//   late FocusNode _focusNode;
//   late FocusNode _focusNode2;
//   late FocusNode _focusNode3;
//   bool _isEditing = false;
//   bool _isEditing2 = false;
//   bool _isEditing3 = false;
//
//   DateTime selectedDate = DateTime.now();
//
//   /// This decides which day will be enabled
//   /// This will be called every time while displaying day in calender.
//   bool _decideWhichDayToEnable(DateTime day) {
//     if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
//         day.isBefore(DateTime.now().add(Duration(days: 10))))) {
//       return true;
//     }
//     return false;
//   }
//
//   _selectDate(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     assert(theme.platform != null);
//     switch (theme.platform) {
//       case TargetPlatform.android:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//         return buildMaterialDatePicker(context);
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//         return buildCupertinoDatePicker(context);
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController(text: widget.initialValue);
//     _controller2 = TextEditingController(text: widget.initialValue);
//     _controller3 = TextEditingController(text: widget.initialValue);
//     _focusNode = FocusNode();
//     _focusNode2 = FocusNode();
//     _focusNode3 = FocusNode();
//   }
//   // void initState2() {
//   //   super.initState();
//   //   _controller2 = TextEditingController(text: widget.initialValue);
//   //   _focusNode2 = FocusNode();
//   // }
//
//   // void initState() {
//   //   super.initState();
//   //
//   // }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     _focusNode.dispose();
//     _focusNode2.dispose();
//     _focusNode3.dispose();
//     super.dispose();
//   }
//   void _toggleEditMode2(){
//     setState(() {
//       _formKey3.currentState!.validate()
//           ? _isEditing2 = !_isEditing2
//           : _formKey3.currentState!.validate();
//       if (!_isEditing2) {
//         final String text = _controller2.text.trim();
//         widget.onSave(text);
//         _focusNode2.unfocus();
//       } else {
//         _focusNode2.requestFocus();
//       }
//     });
//   }
//   void _toggleEditMode3(){
//     setState(() {
//       _formKey4.currentState!.validate()
//           ? _isEditing3 = !_isEditing3
//           : _formKey4.currentState!.validate();
//       if (!_isEditing3) {
//         final String text = _controller3.text.trim();
//         widget.onSave(text);
//         _focusNode3.unfocus();
//       } else {
//         _focusNode3.requestFocus();
//       }
//     });
//   }
//   void _toggleEditMode() {
//     setState(() {
//       _formKey2.currentState!.validate()
//           ? _isEditing = !_isEditing
//           : _formKey2.currentState!.validate();
//       if (!_isEditing) {
//         final String text = _controller.text.trim();
//         widget.onSave(text);
//         _focusNode.unfocus();
//       } else {
//         _focusNode.requestFocus();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Container(
//
//               decoration: BoxDecoration(
//                 color:Color(0xff2B2B2B),
//                 border: Border.all(
//                   // color: isExpanded ?Colors.orange : Colors.transparent,
//                   color: Colors.orange,
//                   width: 1.0,
//                 ),
//                 //border radius to appear only when expanded
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               margin: EdgeInsets.only(top: 0.2*MediaQuery.of(context).size.height, left: 5, right: 5, bottom: 0.001*MediaQuery.of(context).size.height),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Form(
//                       key: _formKey2,
//                       child: TextFormField(
//                         controller: _controller,
//                         focusNode: _focusNode,
//                         enabled: _isEditing,
//                         decoration: InputDecoration(
//                           // filled: true,
//                           // fillColor: Color(0xff2B2B2B),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           errorStyle: TextStyle(color: Colors.orange),
//                           hintText: 'Name',
//                           hintStyle: TextStyle(color: Colors.orange),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Name';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: _toggleEditMode,
//                     icon: _isEditing
//                         ? Icon(Icons.done, color: Colors.orange)
//                         : Icon(Icons.edit, color: Colors.orange),
//                   ),
//                 ],
//               )),
//           Container(
//
//               decoration: BoxDecoration(
//                 color:Color(0xff2B2B2B),
//                 border: Border.all(
//                   // color: isExpanded ?Colors.orange : Colors.transparent,
//                   color: Colors.orange,
//                   width: 1.0,
//                 ),
//                 //border radius to appear only when expanded
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               margin: EdgeInsets.only(top: 100, left: 5, right: 5, bottom: 100),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Form(
//                       key: _formKey3,
//                       child: TextFormField(
//                         controller: _controller2,
//                         focusNode: _focusNode2,
//                         enabled: _isEditing2,
//                         decoration: InputDecoration(
//                           // filled: true,
//                           // fillColor: Color(0xff2B2B2B),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           errorStyle: TextStyle(color: Colors.orange),
//                           hintText: 'Phone Number',
//                           hintStyle: TextStyle(color: Colors.orange),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Number';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: _toggleEditMode2,
//                     icon: _isEditing2
//                         ? Icon(Icons.done, color: Colors.orange)
//                         : Icon(Icons.edit, color: Colors.orange),
//                   ),
//                 ],
//               )),
//           Container(
//
//               decoration: BoxDecoration(
//                 color:Color(0xff2B2B2B),
//                 border: Border.all(
//                   // color: isExpanded ?Colors.orange : Colors.transparent,
//                   color: Colors.orange,
//                   width: 1.0,
//                 ),
//                 //border radius to appear only when expanded
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               margin: EdgeInsets.only(top: 0.02*MediaQuery.of(context).size.height, left: 5, right: 5, bottom: 0.02*MediaQuery.of(context).size.height),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Form(
//                       key: _formKey4,
//                       child: TextFormField(
//                         controller: _controller3,
//                         focusNode: _focusNode3,
//                         enabled: _isEditing3,
//                         decoration: InputDecoration(
//                           // filled: true,
//                           // fillColor: Color(0xff2B2B2B),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           focusedErrorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             // borderSide: BorderSide(
//                             //   color: Colors.orange,
//                             // ),
//                           ),
//                           errorStyle: TextStyle(color: Colors.orange),
//                           hintText: 'Phone Number',
//                           hintStyle: TextStyle(color: Colors.orange),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Number';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: _toggleEditMode2,
//                     icon: _isEditing3
//                         ? Icon(Icons.done, color: Colors.orange)
//                         : Icon(Icons.edit, color: Colors.orange),
//                   ),
//                 ],
//               )),
//           Container(
//             margin: EdgeInsets.only(top: 0.02*MediaQuery.of(context).size.height, left: 5, right: 5, bottom: 0.02*MediaQuery.of(context).size.height),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xff2B2B2B),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.orange),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText: 'Date of Birth',
//                       labelStyle: TextStyle(color: Colors.orange),
//                     ),
//                     readOnly: true,
//                     controller: TextEditingController(
//                       text: "${selectedDate.toLocal()}".split(' ')[0],
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.calendar_today, color: Colors.orange),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   buildCupertinoDatePicker(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext builder) {
//           return Container(
//             height: MediaQuery.of(context).copyWith().size.height / 3,
//             color: Colors.orange,
//             child: CupertinoDatePicker(
//               mode: CupertinoDatePickerMode.date,
//               onDateTimeChanged: (picked) {
//                 if (picked != null && picked != selectedDate)
//                   setState(() {
//                     selectedDate = picked;
//                   });
//               },
//               initialDateTime: selectedDate,
//               minimumYear: 1900,
//               maximumYear: 2025,
//             ),
//           );
//         });
//   }
//
//   buildMaterialDatePicker(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2025),
//       initialEntryMode: DatePickerEntryMode.calendar,
//       initialDatePickerMode: DatePickerMode.day,
//       selectableDayPredicate: _decideWhichDayToEnable,
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
// }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/cupertino.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
// //       home: DatePickerDemo(),
// //     );
// //   }
// // }
// //
// //
// //
// //
// // class DatePickerDemo extends StatefulWidget {
// //   @override
// //   _DatePickerDemoState createState() => _DatePickerDemoState();
// // }
// //
// // class _DatePickerDemoState extends State<DatePickerDemo> {
// //   /// Which holds the selected date
// //   /// Defaults to today's date.
// //   DateTime selectedDate = DateTime.now();
// //
// //   /// This decides which day will be enabled
// //   /// This will be called every time while displaying day in calender.
// //   bool _decideWhichDayToEnable(DateTime day) {
// //     if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
// //         day.isBefore(DateTime.now().add(Duration(days: 10))))) {
// //       return true;
// //     }
// //     return false;
// //   }
// //
// //   _selectDate(BuildContext context) {
// //     final ThemeData theme = Theme.of(context);
// //     assert(theme.platform != null);
// //     switch (theme.platform) {
// //       case TargetPlatform.android:
// //       case TargetPlatform.fuchsia:
// //       case TargetPlatform.linux:
// //       case TargetPlatform.windows:
// //         return buildMaterialDatePicker(context);
// //       case TargetPlatform.iOS:
// //       case TargetPlatform.macOS:
// //         return buildCupertinoDatePicker(context);
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             // Text(
// //             //   "${selectedDate.toLocal()}".split(' ')[0],
// //             //   style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
// //             // ),
// //             // SizedBox(
// //             //   height: 20.0,
// //             // ),
// //             // ElevatedButton(
// //             //   onPressed: () => _selectDate(context),
// //             //   child: Text(
// //             //     'Select date',
// //             //     style:
// //             //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// //             //   ),
// //             //   // color: Colors.greenAccent,
// //             // ),
// //             Container(
// //               margin: EdgeInsets.only(top: 100, left: 5, right: 5, bottom: 100),
// //                 child:Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextFormField(
// //                         decoration: InputDecoration(
// //                           border: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.orange),
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderSide: BorderSide(color: Colors.orange),
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                           labelText: 'Date of Birth',
// //                           labelStyle: TextStyle(color: Colors.orange),
// //                         ),
// //                         readOnly: true,
// //                         controller: TextEditingController(
// //                           text: "${selectedDate.toLocal()}".split(' ')[0],
// //                         ),
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.calendar_today, color: Colors.orange),
// //                       onPressed: () => _selectDate(context),
// //                     ),
// //                   ],
// //                 ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   buildCupertinoDatePicker(BuildContext context) {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (BuildContext builder) {
// //           return Container(
// //             height: MediaQuery.of(context).copyWith().size.height / 3,
// //             color: Colors.black,
// //             child: CupertinoDatePicker(
// //               mode: CupertinoDatePickerMode.date,
// //               onDateTimeChanged: (picked) {
// //                 if (picked != null && picked != selectedDate)
// //                   setState(() {
// //                     selectedDate = picked;
// //                   });
// //               },
// //               initialDateTime: selectedDate,
// //               minimumYear: 1900,
// //               maximumYear: 2025,
// //             ),
// //           );
// //         });
// //   }
// //
// //   buildMaterialDatePicker(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: selectedDate,
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime(2025),
// //       initialEntryMode: DatePickerEntryMode.calendar,
// //       initialDatePickerMode: DatePickerMode.day,
// //       selectableDayPredicate: _decideWhichDayToEnable,
// //     );
// //     if (picked != null && picked != selectedDate)
// //       setState(() {
// //         selectedDate = picked;
// //       });
// //   }
// // }
