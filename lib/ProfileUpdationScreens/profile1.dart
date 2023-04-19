import 'package:flutter/material.dart';
import '../settings.dart';
import 'package:holocron_auth_flutter/custom_expansion_tile.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../ProfileUpdationScreens/profile2.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:pin_code_text_field/pin_code_text_field.dart';

int _currentProgress = 20;
final _formKey2 = GlobalKey<FormState>();
final _formKey3 = GlobalKey<FormState>();
final _formKey4 = GlobalKey<FormState>();
final _formKey5 = GlobalKey<FormState>();
final _formKey6 = GlobalKey<FormState>();
final _formKey7 = GlobalKey<FormState>();

class profileScreen1 extends StatefulWidget {
  final String name;
  final String number;
  final void Function(String) onSave;

  const profileScreen1({
    Key? key,
    required this.name,
    required this.number,
    required this.onSave,
  }) : super(key: key);
  @override
  profileScreen1State createState() => profileScreen1State();
}

class profileScreen1State extends State<profileScreen1> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  late TextEditingController _controller5;
  late TextEditingController _controller6;
  late FocusNode _focusNode;
  late FocusNode _focusNode2;
  late FocusNode _focusNode3;
  bool _isEditing = false;
  bool _isEditing2 = false;
  bool _isEditing3 = false;
  bool isExpanded = false;
  bool isExpanded2 = false;
  TextEditingController _otpcontroller1 = TextEditingController(text: '');
  late TextEditingController _otpcontroller2;
  String _otpCode = '';
  late String mobileNumber;
  bool hasError = false;
  String errorMessage = "";
  int _timerCountdown = 60;
  bool _isTimerRunning = false;
  Timer? _resendOtpTimer;
  bool isChecked = false;

  void _startResendOtpTimer() {
    setState(() {
      _isTimerRunning = true;
    });

    _resendOtpTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerCountdown > 0) {
        setState(() {
          _timerCountdown--;
        });
      } else {
        setState(() {
          _isTimerRunning = false;
        });
        _resendOtpTimer?.cancel();
      }
    });
  }

  void _resetResendOtpTimer() {
    setState(() {
      _timerCountdown = 60;
      _isTimerRunning = false;
    });
    _resendOtpTimer?.cancel();
  }

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  DateTime selectedDate = DateTime.now();

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
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
    _focusNode.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _resendOtpTimer?.cancel();
    super.dispose();
  }

  void _toggleEditMode2() {
    setState(() {
      _formKey3.currentState!.validate()
          ? _isEditing2 = !_isEditing2
          : _formKey3.currentState!.validate();
      if (!_isEditing2) {
        final String text = _controller2.text.trim();
        widget.onSave(text);
        _focusNode2.unfocus();
      } else {
        _focusNode2.requestFocus();
      }
    });
  }

  void _toggleEditMode3() {
    setState(() {
      _formKey4.currentState!.validate()
          ? _isEditing3 = !_isEditing3
          : _formKey4.currentState!.validate();
      if (!_isEditing3) {
        final String text = _controller3.text.trim();
        widget.onSave(text);
        _focusNode3.unfocus();
      } else {
        _focusNode3.requestFocus();
      }
    });
  }

  void _toggleEditMode() {
    setState(() {
      _formKey2.currentState!.validate()
          ? _isEditing = !_isEditing
          : _formKey2.currentState!.validate();
      if (!_isEditing) {
        final String text = _controller.text.trim();
        widget.onSave(text);
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }
    });
  }

  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name);
    _controller2 = TextEditingController(text: widget.number);
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _focusNode = FocusNode();
    _focusNode2 = FocusNode();
    _focusNode3 = FocusNode();
    // here lets initialise the flutter widget SFRadialGauge again with the new value

    // isExpanded = false;
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
                        borderColor =
                            isExpanded ? Colors.orange : Colors.transparent;
                      },
                      initiallyExpanded: isExpanded,
                      // backgroundColor: Color(0xff535252),
                      backgroundColor: Colors.black,
                      leading: null,
                      trailing: Icon(Icons.arrow_forward_rounded),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Color(0xff535252),
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
                            margin: EdgeInsets.only(
                                right: 0.03 * width, left: 0.03 * width),
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: Form(
                                    key: _formKey2,
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: _focusNode,
                                      enabled: _isEditing,
                                      decoration: InputDecoration(
                                        // filled: true,
                                        // fillColor: Color(0xff2B2B2B),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.orange),
                                        hintText: 'Name',
                                        hintStyle:
                                            TextStyle(color: Colors.orange),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _toggleEditMode,
                                  icon: _isEditing
                                      ? Icon(Icons.done, color: Colors.orange)
                                      : Icon(Icons.edit, color: Colors.orange),
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
                                    key: _formKey3,
                                    child: TextFormField(
                                      controller: _controller2,
                                      focusNode: _focusNode2,
                                      enabled: _isEditing2,
                                      decoration: InputDecoration(
                                        // filled: true,
                                        // fillColor: Color(0xff2B2B2B),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.orange),
                                        hintText: 'Phone Number',
                                        hintStyle:
                                            TextStyle(color: Colors.orange),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _toggleEditMode2,
                                  icon: _isEditing2
                                      ? Icon(Icons.done, color: Colors.orange)
                                      : Icon(Icons.edit, color: Colors.orange),
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
                                    key: _formKey4,
                                    child: TextFormField(
                                      controller: _controller3,
                                      // focusNode: _focusNode3,
                                      // enabled: _isEditing3,
                                      decoration: InputDecoration(
                                        // filled: true,
                                        // fillColor: Color(0xff2B2B2B),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // borderSide: BorderSide(
                                          //   color: Colors.orange,
                                          // ),
                                        ),
                                        errorStyle:
                                            TextStyle(color: Colors.orange),
                                        hintText: 'Email ID',
                                        hintStyle:
                                            TextStyle(color: Colors.orange),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Email ID';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      // _toggleEditMode3;
                                      //validate the formkey
                                      if (_formKey4.currentState!.validate()) {
                                        showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => Container(
                                                height: 0.25 * height,
                                                width: 0.3 * width,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff2B2B2B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 0.3 * height,
                                                    bottom: 0.3 * height,
                                                    left: 0.1 * width,
                                                    right: 0.1 * width),
                                                child: Column(children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0.04 * height),
                                                    child: Text(
                                                        '${_controller3.text}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 20)),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0.02 * height,
                                                        right: 0.335 * width,
                                                        left: 0.02 * width),
                                                    child: Text(
                                                        'OTP sent to your email ID successfully',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 12)),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0.02 * height,
                                                        right: 0.55 * width,
                                                        left: 0.02 * width),
                                                    child: Text('ENTER OTP',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)),
                                                  ),
                                                  Card(
                                                    color: Color(0xff2B2B2B),
                                                    margin: EdgeInsets.only(
                                                        top: 0.04 * height),
                                                    child: PinCodeTextField(
                                                      autofocus: true,
                                                      controller:
                                                          _otpcontroller1,
                                                      // hideCharacter: true,
                                                      highlight: true,
                                                      highlightColor:
                                                          Colors.orange,
                                                      defaultBorderColor:
                                                          Colors.white,
                                                      hasTextBorderColor:
                                                          Colors.white,
                                                      highlightPinBoxColor:
                                                          Colors.black,
                                                      // highlightPinBoxColor: Color(0xff2B2B2B),
                                                      maxLength: 6,
                                                      onTextChanged: (text) {
                                                        setState(() {
                                                          hasError = false;
                                                        });
                                                      },
                                                      onDone: (text) {
                                                        print("DONE $text");
                                                      },

                                                      pinBoxWidth: 40,

                                                      pinBoxHeight: 50,
                                                      pinBoxRadius: 5,
                                                      pinBoxBorderWidth: 2,
                                                      hasUnderline: true,
                                                      wrapAlignment:
                                                          WrapAlignment
                                                              .spaceAround,
                                                      //underline color

                                                      pinBoxColor:
                                                          Color(0xff2B2B2B),
                                                      pinTextStyle: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.white),
                                                      hasError: hasError,
                                                      // cursorColor: Colors.black,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      // appContext: context,
                                                    ),
                                                  ),
                                                  Visibility(
                                                    child: Text(
                                                      "Wrong PIN!",
                                                    ),
                                                    visible: hasError,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0.45 * width),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          // Do something when the button is pressed
                                                        },
                                                        child: Text(
                                                            'Resend OTP($_timerCountdown s)',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.orange,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                                      )),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                            width: 0.37 * width,
                                                            height: 0.075 *
                                                                height,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0.03 *
                                                                        height,
                                                                    bottom: 0.01 *
                                                                        height,
                                                                    left: 0.02 *
                                                                        width),
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    gradient:
                                                                        const LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .orange,
                                                                        Colors
                                                                            .deepOrange
                                                                      ],
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      stops: [
                                                                        0.1,
                                                                        0.9
                                                                      ],
                                                                      tileMode:
                                                                          TileMode
                                                                              .repeated,
                                                                    )),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .transparent,

                                                                shadowColor: Colors
                                                                    .transparent,
                                                                // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            )),
                                                        Container(
                                                            width: 0.37 * width,
                                                            height:
                                                                0.075 * height,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 0.03 *
                                                                        height,
                                                                    bottom: 0.01 *
                                                                        height,
                                                                    right: 0.02 *
                                                                        width),
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                    gradient:
                                                                        const LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .orange,
                                                                        Colors
                                                                            .deepOrange
                                                                      ],
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      stops: [
                                                                        0.1,
                                                                        0.9
                                                                      ],
                                                                      tileMode:
                                                                          TileMode
                                                                              .repeated,
                                                                    )),
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                //  OTP Verification Logic
                                                              },
                                                              child: Text(
                                                                'Verify',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .transparent,

                                                                shadowColor: Colors
                                                                    .transparent,
                                                                // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            )),
                                                      ]),
                                                ])));
                                      }
                                    },
                                    icon:
                                        Icon(Icons.done, color: Colors.orange)),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.02 * height,
                              right: 0.03 * width,
                              left: 0.03 * width),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
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
                                  readOnly: true,
                                  controller: TextEditingController(
                                    text: "${selectedDate.toLocal()}"
                                        .split(' ')[0],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today,
                                    color: Colors.orange),
                                onPressed: () => _selectDate(context),
                              ),
                            ],
                          ),
                        ),
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
                                if (_formKey2.currentState!.validate() &&
                                    _formKey3.currentState!.validate() &&
                                    _formKey4.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Processing Data')));
                                  _toggleExpansion();
                                  setState(() {
                                    _currentProgress += 13;
                                    // print(isExpanded);
                                    // isExpanded = !isExpanded;
                                    // print(isExpanded);
                                  });
                                }
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
                          isExpanded = expanded;
                          print(isExpanded);
                          borderColor =
                              isExpanded ? Colors.orange : Colors.transparent;
                        },
                        initiallyExpanded: isExpanded,
                        // backgroundColor: Color(0xff535252),
                        backgroundColor: Colors.black,
                        leading: null,
                        trailing: Icon(Icons.arrow_forward_rounded),
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        collapsedBackgroundColor: Color(0xff535252),
                        tilePadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        // backgroundColor: Color(0xff535252),
                        title: Container(
                          // color: _isExpanded ? Colors.blue : null,
                          child: Text(
                            "Essential Information",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // borderSide: BorderSide(color: Colors.white),

                        children: [
                            // Container(
                            //
                            // )
                        ],
                      )),
                ),
                Container(
                    width: 0.95 * width,
                    height: 0.075 * height,
                    // color: Color(0xff535252),
                    margin: EdgeInsets.only(top: 0.04 * height),
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
                              margin: EdgeInsets.only(left: 0.63 * width),
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
                  color: Color(0xff535252),
                  margin: EdgeInsets.only(top: 0.04 * height),
                  child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   _currentProgress += 20;
                      // });
                      //  navigate to EditableTextField screen
                      String initialValue = "ritvik";
                      // String finalValue = "9899326396";
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => EditableTextField(
                      //           initialValue: initialValue,
                      //           // finalValue: finalValue,
                      //           onSave: (value) {
                      //             print(value);
                      //           })),
                      //   // MaterialPageRoute(builder:(context) => EditableTextField())
                      // );
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
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
                  ),
                ),
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
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
