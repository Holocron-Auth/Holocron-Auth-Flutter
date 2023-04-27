import 'package:flutter/material.dart';
import '../settings.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:holocron_auth_flutter/custom_expansion_tile.dart';
import '../custom_expansion_tile.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../ProfileUpdationScreens/profile2.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../home.dart';
import 'dart:io';
//TASK ACTIONS
//dropdowns and photo uploading left with the logic of completing the gauge and passing name and password from the signup screen1

int _currentProgress = 40;
int counter = 2;
int counter1 = 0;
// final _formKey2 = GlobalKey<FormState>();
// final _formKey3 = GlobalKey<FormState>();
// final _formKey4 = GlobalKey<FormState>();
final _formKey5 = GlobalKey<FormState>();
final _formKey6 = GlobalKey<FormState>();
final _formKey7 = GlobalKey<FormState>();
final _formKey8 = GlobalKey<FormState>();
final _formKey9 = GlobalKey<FormState>();
final _formKey10 = GlobalKey<FormState>();
final _formKey11 = GlobalKey<FormState>();
DateTime _currentDate = DateTime.now();

class profileScreen2 extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final String jwt;
  final void Function(String) onSave;

  const profileScreen2({
    Key? key,
    required this.name,
    required this.number,
    required this.email,
    required this.jwt,
    required this.onSave,
  }) : super(key: key);
  @override
  profileScreen2State createState() => profileScreen2State();
}

class profileScreen2State extends State<profileScreen2> {
  final List<String> gender = [
    'Male',
    'Female',
    'Other',
  ];
  final List<String> privacy = ['On', 'Off'];
  String? selectedValue;
  String? selectedValue2;
  File? _imageFile;


  Future<void> _getImageFromGallery() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  late TextEditingController _controller5;
  late TextEditingController _controller6;
  late TextEditingController _controller7;
  bool _isEditing = false;
  bool _isEditing2 = false;
  bool _isEditing3 = false;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  late String mobileNumber;
  bool hasError = false;
  String errorMessage = "";
  String? _selectedValue;
  String? _selectedValue2;


  void _collapseTile(isExpanded) {
    setState(() {
      isExpanded = false;
    });
  }

  DateTime selectedDate = DateTime.now();

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 365000))) &&
        day.isBefore(DateTime.now().add(Duration(days: 1))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name);
    _controller2 = TextEditingController(text: widget.number);
    _controller3 = TextEditingController(text: widget.email);
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
  }

  void _incrementProgress() {
    setState(() {
      _currentProgress += 25;
    });
  }





  @override
  Widget build(BuildContext context) {
    var borderColor = Colors.transparent;
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 0.08 * height, left: 0.01 * width),
                            // color: Colors.orange,
                            height: 0.05 * height,
                            width: 0.65 * width,
                            padding: EdgeInsets.only(left: 0.014 * width),
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            )),
                        Container(
                            height: 0.08 * height,
                            width: 0.65 * width,
                            // color: Colors.pink,
                            // margin: EdgeInsets.only(top:0.01*height,left:0.03*height),
                            padding: EdgeInsets.only(
                                top: 0.01 * height, left: 0.014 * width),
                            child: Text(
                              'Complete your profile to access all features',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(
                          top: 0.08 * MediaQuery.of(context).size.height),
                      height: 0.13 * MediaQuery.of(context).size.height,
                      width: 0.3 * MediaQuery.of(context).size.width,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            startAngle: 270,
                            endAngle: 270,
                            showLabels: false,
                            showTicks: false,
                            minimum: 0,
                            maximum: 100,
                            axisLineStyle: AxisLineStyle(
                              color: Color(0xff2B2B2B),
                              thickness: 10,
                              cornerStyle: CornerStyle.bothFlat,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                value: _currentProgress.toDouble(),
                                onValueChanged: (value) {
                                  setState(() {
                                    double _currentProgress1 = value;
                                    _currentProgress =
                                        _currentProgress1.toInt();
                                    // _currentProgress = value;
                                  });
                                },
                                cornerStyle: CornerStyle.bothCurve,
                                width: 10,
                                enableAnimation: true,
                                animationType: AnimationType.ease,
                                color: Color(0xffFFB267),
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  angle: 90,
                                  positionFactor: 0.15,
                                  widget: Container(
                                      child: Text(
                                        '$_currentProgress%',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ))),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

                // Primary Information* part verification logic pending as well as requests to be sent to backend
                Container(
                  margin: EdgeInsets.only(
                      left: 0.03 * width,
                      right: 0.03 * width,
                      top: 0.01 * height,
                      bottom: 0.01 * height),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: isExpanded ?Colors.orange : Colors.transparent,
                      color: Colors.orange,
                      width: 1.0,
                    ),
                    //border radius to appear only when expanded
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    // margin: EdgeInsets.only(top: 0.04 * height, left:0.025*width, right: 0.025*width),
                    child: customExpansionTile(
                      // borderColor: Colors.transparent,
                      onExpansionChanged: (bool expanded) {
                        isExpanded = expanded;
                        print(isExpanded);
                      },
                      initiallyExpanded: true,
                      // backgroundColor: Color(0xff535252),
                      backgroundColor: Colors.black,
                      leading: null,
                      // trailing: Icon(Icons.arrow_forward_rounded),
                      trailing: Icon(Icons.keyboard_arrow_down_rounded),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Color(0xff2B2B2B),
                      tilePadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      // backgroundColor: Color(0xff535252),
                      title: Container(
                        // color: _isExpanded ? Colors.blue : null,
                        child: Text(
                          "Primary Information*",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // borderSide: BorderSide(color: Colors.white),

                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                right: 0.03 * width, left: 0.03 * width),

                            padding: EdgeInsets.only(top: 0.02*height, bottom: 0.02*height, left:0.02*width, right: 0.02*width),
                            decoration: BoxDecoration(
                              color: Color(0xff2B2B2B),
                              border: Border.all(
                                // color: isExpanded ?Colors.orange : Colors.transparent,
                                color: Colors.orange,
                                width: 1.0,
                              ),
                              //border radius to appear only when expanded
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          child: Text(''+ _controller.text, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w400, fontSize: 18),)
                            ),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2B2B2B),
                              border: Border.all(
                                // color: isExpanded ?Colors.orange : Colors.transparent,
                                color: Colors.orange,
                                width: 1.0,
                              ),
                              //border radius to appear only when expanded
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: 0.02*height, right: 0.03 * width, left: 0.03 * width),
                            padding: EdgeInsets.only(top: 0.02*height, bottom: 0.02*height, left:0.02*width, right: 0.02*width),
                            child: Text(''+_controller2.text, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w400, fontSize: 18),)
                            ),
                        Container(
                            decoration: BoxDecoration(
                              color: Color(0xff2B2B2B),
                              border: Border.all(
                                // color: isExpanded ?Colors.orange : Colors.transparent,
                                color: Colors.orange,
                                width: 1.0,
                              ),
                              //border radius to appear only when expanded
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: 0.02*height, right: 0.03 * width, left: 0.03 * width, bottom:0.02*height),
                            padding: EdgeInsets.only(top: 0.02*height, bottom: 0.02*height, left:0.02*width, right: 0.02*width),
                            child: Text(''+_controller3.text, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w400, fontSize: 18),)
                            ),
                      ],
                    ),
                  ),
                ),
                // ESSENTIAL Information* part verification logic pending as well as requests to be sent to backend
                Container(
                  margin: EdgeInsets.only(
                      left: 0.03 * width,
                      right: 0.03 * width,
                      top: 0.01 * height,
                      bottom: 0.01 * height),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: isExpanded ?Colors.orange : Colors.transparent,
                      color: Colors.orange,
                      width: 1.0,
                    ),
                    //border radius to appear only when expanded
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      // margin: EdgeInsets.only(top: 0.04 * height, left:0.025*width, right: 0.025*width),
                      child: customExpansionTile(
                        // borderColor: Colors.transparent,
                        onExpansionChanged: (bool expanded) {
                          isExpanded2 = expanded;
                          print(isExpanded);
                          borderColor =
                          isExpanded2 ? Colors.orange : Colors.transparent;
                        },
                        initiallyExpanded: true,
                        // backgroundColor: Color(0xff535252),
                        backgroundColor: Colors.black,
                        leading: null,
                        // trailing: Icon(Icons.arrow_forward_rounded),
                        trailing: Icon(Icons.keyboard_arrow_down_rounded),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        collapsedBackgroundColor: Color(0xff2B2B2B),
                        tilePadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: Container(
                          // color: _isExpanded ? Colors.blue : null,
                          child: Text(
                            "Essential Information",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 0.02 * height,
                                right: 0.03 * width,
                                left: 0.03 * width,
                                bottom: 0.02 * height
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Form(
                                      key: _formKey11,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(color: Colors.orange),
                                          filled: true,
                                          fillColor: Color(0xff2B2B2B),
                                          border: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.orange),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                            BorderSide(color: Colors.orange),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          labelText: 'Date of Birth',
                                          labelStyle: TextStyle(color: Colors.orange),
                                        ),
                                        validator: (value) {
                                          print(selectedDate);
                                          print(_currentDate);
                                          final difference = _currentDate
                                              .difference(selectedDate)
                                              .inDays;
                                          print(difference);
                                          if (value == null ||
                                              value.isEmpty ||
                                              difference < 5840) {
                                            // if(difference < 5840){
                                            return 'You should be above 16 to use the platform';
                                            // }
                                          }
                                          return null;
                                        },
                                        readOnly: true,
                                        controller: TextEditingController(
                                          text: "${selectedDate.toLocal()}"
                                              .split(' ')[0],
                                        ),
                                      ),
                                    )),
                                IconButton(
                                  icon: Icon(Icons.calendar_today,
                                      color: Colors.orange),
                                  onPressed: () => {
                                    //validate the date picked if you're above 16 years old
                                    _selectDate(context)
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  right: 0.03 * width,
                                  left: 0.05 * width,
                                  bottom: 0.02 * height),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundImage: _imageFile != null
                                            ? FileImage(_imageFile!)
                                            : null,
                                        child: _imageFile == null
                                            ? IconButton(
                                          icon: Icon(Icons.camera_alt),
                                          onPressed: _getImageFromGallery,
                                          iconSize: 30,
                                        )
                                            : null,
                                      ),
                                    ),
                                    Container(
                                      child: IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.orange),
                                        onPressed: () {
                                          _getImageFromGallery();
                                          // code to open gallery or camera for selecting a new image
                                        },
                                      ),
                                    )
                                  ])),
                          Container(
                              height: 0.09 * height,
                              width: 0.87 * width,
                              decoration: BoxDecoration(
                                color: Color(0xff2B2B2B),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Form(
                                key: _formKey9,
                                child: SizedBox(
                                  height: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xff2B2B2B),
                                          filled: true,
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                          ),
                                        ),
                                        iconStyleData: const IconStyleData(
                                          // color: Colors.white,
                                          // size: 30,
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        dropdownStyleData:
                                        const DropdownStyleData(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        isExpanded: true,
                                        hint: const Text(
                                          "Gender",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.orange),
                                        ),
                                        items: gender
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return " Please select your Gender";
                                          }
                                        },
                                        onChanged: (value) {
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {},
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2B2B2B),
                                border: Border.all(
                                  // color: isExpanded ?Colors.orange : Colors.transparent,
                                  color: Colors.orange,
                                  width: 1.0,
                                ),
                                //border radius to appear only when expanded
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: EdgeInsets.only(
                                  top: 0.02 * height,
                                  right: 0.03 * width,
                                  left: 0.03 * width),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey5,
                                      child: TextFormField(
                                        controller: _controller4,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          errorStyle:
                                          TextStyle(color: Colors.orange),
                                          hintText: 'Address',
                                          hintStyle:
                                          TextStyle(color: Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2B2B2B),
                                border: Border.all(
                                  // color: isExpanded ?Colors.orange : Colors.transparent,
                                  color: Colors.orange,
                                  width: 1.0,
                                ),
                                //border radius to appear only when expanded
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: EdgeInsets.only(
                                  top: 0.02 * height,
                                  right: 0.03 * width,
                                  left: 0.03 * width),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey6,
                                      child: TextFormField(
                                        controller: _controller5,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          errorStyle:
                                          TextStyle(color: Colors.orange),
                                          hintText: 'Pincode',
                                          hintStyle:
                                          TextStyle(color: Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                color: Color(0xff2B2B2B),
                                border: Border.all(
                                  // color: isExpanded ?Colors.orange : Colors.transparent,
                                  color: Colors.orange,
                                  width: 1.0,
                                ),
                                //border radius to appear only when expanded
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: EdgeInsets.only(
                                  top: 0.02 * height,
                                  right: 0.03 * width,
                                  left: 0.03 * width),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey7,
                                      child: TextFormField(
                                        controller: _controller6,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          errorStyle:
                                          TextStyle(color: Colors.orange),
                                          hintText: 'Country',
                                          hintStyle:
                                          TextStyle(color: Colors.orange),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: 0.87 * width,
                              height: 0.075 * height,
                              margin: EdgeInsets.only(
                                  top: 0.02 * height, bottom: 0.02 * height),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  gradient: const LinearGradient(
                                    colors: [Colors.orange, Colors.deepOrange],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.1, 0.9],
                                    tileMode: TileMode.repeated,
                                  )),
                              child: ElevatedButton(
                                onPressed: () {
                                  if(_formKey11.currentState!.validate()){
                                    _formKey11.currentState!.save();
                                    setState(() {
                                      isExpanded2= false;
                                    });
                                  }

                                  int count = 0;
                                },
                                child: Text(
                                  'Save and Proceed',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,

                                  shadowColor: Colors.transparent,
                                  // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              )),
                        ],
                      )),
                ),
                Container(
                    width: 0.94 * width,
                    height: 0.075 * height,
                    // color: Color(0xff535252),
                    margin: EdgeInsets.only(top: 0.01 * height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color(0xff535252),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => settingsScreen()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 0.62 * width),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ))
                          // Icon(icon)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,

                        shadowColor: Colors.transparent,
                        // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
                Container(
                    width: 0.93 * width,
                    height: 0.075 * height,
                    margin: EdgeInsets.only(
                        top: 0.02 * height, bottom: 0.02 * height),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.9],
                          tileMode: TileMode.repeated,
                        )),
                    child: ElevatedButton(
                      onPressed: () {
                        String name = widget.name;
                        String number = widget.number;
                        String email = _controller.text;
                        File? image = _imageFile;
                        //2,3,4,11
                        if( _formKey11.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    homeScreen1(
                                      // name: widget.name,
                                      // number: widget.number,
                                      // email: widget.email,
                                      // image: image,
                                      jwt: widget.jwt,
                                    )),
                          );
                        }
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,

                        shadowColor: Colors.transparent,
                        // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.orange,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 1900,
              maximumYear: 2025,
            ),
          );
        });
  }

  buildMaterialDatePicker(BuildContext context) async {
    DateTime _currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    // if (picked != null && picked != selectedDate) {
    //   setState(() {
    //     selectedDate = picked;
    //   });
    // }
    if (picked != null && picked != selectedDate) {
      final difference = _currentDate.difference(picked).inDays;
      if (difference < 16 * 365) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("You must be at least 16 years old."),
          ),
        );
      } else {
        setState(() {
          selectedDate = picked;
        });
      }
    }
  }
}
