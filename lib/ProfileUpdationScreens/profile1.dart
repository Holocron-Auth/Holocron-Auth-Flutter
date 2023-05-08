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
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

//TASK ACTIONS
//dropdowns and photo uploading left with the logic of completing the gauge and passing name and password from the signup screen1

int _currentProgress = 40;
int counter = 2;
int counter1 = 0;
final _formKey2 = GlobalKey<FormState>();
final _formKey3 = GlobalKey<FormState>();
final _formKey4 = GlobalKey<FormState>();
final _formKey5 = GlobalKey<FormState>();
final _formKey6 = GlobalKey<FormState>();
final _formKey7 = GlobalKey<FormState>();
final _formKey8 = GlobalKey<FormState>();
final _formKey9 = GlobalKey<FormState>();
final _formKey10 = GlobalKey<FormState>();
final _formKey11 = GlobalKey<FormState>();
DateTime _currentDate = DateTime.now();
String?  genderValue = '';

class profileScreen3 extends StatefulWidget {
  final String jwt;
  final Map<String, dynamic> data1;

  const profileScreen3({
    Key? key,
    required this.jwt,
    required this.data1,
  }) : super(key: key);
  @override
  profileScreen3State createState() => profileScreen3State();
}

class profileScreen3State extends State<profileScreen3> {
  final List<String> gender = [
    'Male',
    'Female',
    'Other',
  ];
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  // late TextEditingController _controller5;
  late TextEditingController _controller5 = TextEditingController();
  late TextEditingController _controller6 = TextEditingController();
  late TextEditingController _controller7 = TextEditingController();

  //
  // late TextEditingController _controller6;
  // late TextEditingController _controller7;
  bool _isEditing = false;
  bool _isEditing2 = false;
  bool _isEditing3 = false;
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  TextEditingController _otpcontroller1 = TextEditingController(text: '');
  String _otpCode = '';
  late String mobileNumber;
  bool hasError = false;
  String errorMessage = "";
  int _timerCountdown = 60;
  bool _isTimerRunning = false;
  Timer? _resendOtpTimer;
  late Future<Map<String, dynamic>> data;

  // late String name;
  // late String email;
  // late String number;
  // late String emailverified;
  // late String dob;
  // late String gender;
  // late String address;
  // late String pincode;
  // late String country;
  // late String completedProfile;
  // late String profileImage;
  String name = '';
  String email = '';
  String number = '';
  DateTime emailverified = DateTime.now();
  String dob = '';
  String gender1 = '';
  String address = '';
  String pincode = '';
  String country = '';
  bool completedProfile = false;
  String profileImage = '';

  // Future<Map<String, dynamic>> _getData(String jwt) async {
  //   print("Inside the get data thingi");
  //   var headers = {
  //     'ngrok-skip-browser-warning': '1',
  //     'Content-Type': 'text/plain',
  //   };
  //
  //   var data = '{"json": {"jwt": "${jwt}"}}';
  //
  //   var url = Uri.parse(
  //       'https://d7f5-103-25-231-102.ngrok-free.app/api/trpc/mobile.getAllUserDetails');
  //   var res = await http.post(url, headers: headers, body: data);
  //   if (res.statusCode != 200) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Details couldn't be retrieved"),
  //       duration: Duration(seconds: 2),
  //     ));
  //   }
  //   print(res.body);
  //   print("splitter");
  //   var decoded = jsonDecode(res.body);
  //   print(decoded);
  //   print(decoded['result']['data']['json']['user']['name']);
  //   print(jsonDecode(res.body)['result']['data']['json']['name']);
  //   print(decoded['result'].runtimeType);
  //   return decoded['result'];
  // }

  //send request for otp code here
  Future<String> generateOTP(String email) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };

    var data = '{"json": {"email": "$email"}}';

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/auth.generateOTPWithEmail');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      return 'error';
    } else {
      return 'success';
    }
    print(res.body);
  }

  Future<String> verifyEmail(String jwt, String otp) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };

    var data = '{"json": {"jwt": "$jwt", "otp": "$otp"}}';

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.verifyEmail');
    var res = await http.post(url, headers: headers, body: data);
    print(res.body);
    var decocded = jsonDecode(res.body);
    if (res.statusCode != 200) {
      return 'error';
    } else {
      return 'success';
    }
    print(res.body);
  }

  Future<String> updateProfile(String jwt, String image, String dob,
      String? gender, String address, String pincode, String country) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };

    var data =
        '{"json":{"jwt": "$jwt","image":"$image","dateofbirth":"$dob","gender": "$gender","address":"$address","pincode":"$pincode","country":"$country"}}';

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.updateProfile');
    var res = await http.post(url, headers: headers, body: data);
    print(res.body);

    if (res.statusCode != 200) {
      return "error";
    } else {
      return "success";
    }
    print(res.body);
  }

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
    // _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _resendOtpTimer?.cancel();
    super.dispose();
  }

  void initState()  {
    super.initState();
    _controller5 = TextEditingController(text: widget.data1['data']['json']['user']['address']);
    _controller6 = TextEditingController(text: widget.data1['data']['json']['user']['pincode']);
    _controller7 = TextEditingController(text: widget.data1['data']['json']['user']['country']);
    print("Here's the token");
    // var data1 = await  _getData();
    // {
    //   print("Data is here");
    //   name = data['data']['json']['user']['name'];
    //   email = data['data']['json']['user']['email'];
    //   number = data['data']['json']['user']['phone'];
    //   dob = data['data']['json']['user']['dateOfBirth'];
    //   gender1 = data['data']['json']['user']['gender'];
    //   address = data['data']['json']['user']['address'];
    //   pincode = data['data']['json']['user']['pincode'];
    //   country = data['data']['json']['user']['country'];
    //   completedProfile = data['data']['json']['user']['completedProfile'];
    //   print("Completed data extraction");
    // });
    _controller = TextEditingController(text: widget.data1['data']['json']['user']['name']);
    _controller2 = TextEditingController(text: widget.data1['data']['json']['user']['phone']);
    _controller3 = TextEditingController(text: widget.data1['data']['json']['user']['email']);
    _controller4 = TextEditingController(text: widget.data1['data']['json']['user']['dateOfBirth']);
    print(_controller3.text);
  }

  void _incrementProgress() {
    setState(() {
      _currentProgress += 25;
    });
  }
  // _controller.text = name;

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
                              "Update Profile",
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
                            padding: EdgeInsets.only(
                                top: 0.02 * height,
                                bottom: 0.02 * height,
                                left: 0.02 * width,
                                right: 0.02 * width),
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
                            child: Text(
                              _controller.text,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
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
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: 0.02 * height,
                                right: 0.03 * width,
                                left: 0.03 * width),
                            padding: EdgeInsets.only(
                                top: 0.02 * height,
                                bottom: 0.02 * height,
                                left: 0.02 * width,
                                right: 0.02 * width),
                            child: Text(
                              _controller2.text,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: 0.02 * height,
                                right: 0.03 * width,
                                left: 0.03 * width),
                            padding: EdgeInsets.only(
                                top: 0.02 * height,
                                bottom: 0.02 * height,
                                left: 0.02 * width,
                                right: 0.02 * width),
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
                            child: Text(
                              _controller4.text.substring(0,10),
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
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
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 0.02 * height,
                              right: 0.03 * width,
                              left: 0.03 * width,
                            ),
                            padding: EdgeInsets.only(
                                top: 0.02 * height,
                                bottom: 0.02 * height,
                                left: 0.02 * width,
                                right: 0.02 * width),
                            child: Text(
                              _controller3.text,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
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
                              onPressed: () async {
                                print("Button pressed");
                                String response = await generateOTP(_controller3.text);
                                // String response = "success";
                                if (response == "success") {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xff2B2B2B),
                                          title: Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.04 * height),
                                              padding: EdgeInsets.only(
                                                  top: 0.02 * height,
                                                  left: 0.02 * width,
                                                  right: 0.02 * width),
                                              decoration: BoxDecoration(
                                                color: Color(0xff2B2B2B),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  // color: isExpanded ?Colors.orange : Colors.transparent,
                                                  color: Colors.orange,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Text(
                                                  '${_controller3.text}',
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 18))),
                                          content: Container(
                                              height: 0.35 * height,
                                              width: 0.8 * width,
                                              child: Column(children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 0.01 * width,
                                                        right: 0.15 * width),
                                                    child: Text(
                                                        'OTP Sent to your email  ID Successfully',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 12))),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 0.02 * height,
                                                        right: 0.35 * width),
                                                    child: Text('ENTER OTP',
                                                        style: TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 24,
                                                        ))),
                                                Card(
                                                  color: Color(0xff2B2B2B),
                                                  margin: EdgeInsets.only(
                                                      top: 0.04 * height),
                                                  child: PinCodeTextField(
                                                    autofocus: true,
                                                    controller: _otpcontroller1,
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
                                                    wrapAlignment: WrapAlignment
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
                                                Container(
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                            top: 0.02 * height,
                                                          ),
                                                          height: 0.05 * height,
                                                          width: 0.3 * width,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
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
                                                          child: ElevatedButton(
                                                            child:
                                                                Text('Cancel'),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          )),
                                                      Container(
                                                          height: 0.05 * height,
                                                          width: 0.3 * width,
                                                          margin:
                                                              EdgeInsets.only(
                                                            top: 0.02 * height,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0),
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
                                                          child: ElevatedButton(
                                                              child: Text(
                                                                  'Verify'),
                                                              onPressed: () async {
                                                                String
                                                                    response =
                                                                    await verifyEmail(
                                                                        widget
                                                                            .jwt,
                                                                        _otpcontroller1.text);
                                                                if (response ==
                                                                    'success') {
                                                                  Navigator.pop(
                                                                      context);
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          SnackBar(
                                                                    content: Text(
                                                                        'Email Verified Successfully!'),
                                                                    duration: Duration(
                                                                        seconds:
                                                                            2),
                                                                  ));
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          SnackBar(
                                                                    content: Text(
                                                                        'Otp Failed Try Again!'),
                                                                    duration: Duration(
                                                                        seconds:
                                                                            2),
                                                                  ));
                                                                }

                                                                setState(() {
                                                                  _currentProgress =
                                                                      50;
                                                                });
                                                              }))
                                                    ]))
                                              ])),
                                        );
                                      });
                                } else if (response == "error") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('Otp Failed Try Again!'),
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              },
                              child: Text(
                                'Verify Email Address',
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
                          isExpanded2 = expanded;
                          print(isExpanded);
                          borderColor =
                              isExpanded2 ? Colors.orange : Colors.transparent;
                        },
                        initiallyExpanded: isExpanded2,
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
                        // backgroundColor: Color(0xff535252),
                        title: Container(
                          // color: _isExpanded ? Colors.blue : null,
                          child: Text(
                            "Essential Information",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        children: [
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
                                          setState(() {
                                            genderValue = value;
                                          });
                                          //Do something when changing the item if you want.
                                        },
                                        onSaved: (value) {},
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(right:0.7*width, top:0.01*height),
                            child: Text("Address", style: TextStyle(color: Colors.white),),
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
                            margin: EdgeInsets.only(right:0.7*width, top:0.01*height),
                            child: Text("Pincode", style: TextStyle(color: Colors.white),),
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
                            margin: EdgeInsets.only(right:0.7*width, top:0.01*height),
                            child: Text("Country", style: TextStyle(color: Colors.white),),
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
                                        controller: _controller7,
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
                                onPressed: () async {
                                  _collapseTile(isExpanded2);
                                  //  count the number of non null formKeys in this expansion tile as all aren't compulaory fields
                                  int count = 0;
                                  // if(_controller5.text)
                                  if(_controller5.text != "NA"){
                                    count+=1;
                                  }
                                  if(_controller6.text != "NA"){
                                    count+=1;
                                  }
                                  if(_controller7.text != "NA"){
                                    count+=1;
                                  }
                                  if(genderValue !=""){
                                    count+=1;
                                  }
                                  setState(() {
                                    _currentProgress += count*10;
                                  });
                                  if(genderValue == ""){
                                    genderValue="NA";
                                  }
                                  String image  = '/default.jpg';
                                  String response = await updateProfile(widget.jwt, image, _controller4.text, genderValue, _controller5.text, _controller6.text, _controller7.text);
                                  if(response == 'success'){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Details Successfully Updated'),
                                          duration: Duration(seconds: 2),
                                        ));
                                  }
                                  else if(response  == "error"){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration: Duration(seconds: 2),
                                            content: Text("Due to some unforseen issue your details haven't been saved")));

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
                      )),
                ),
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
                        // // String name1 = name;
                        // // String number1 = number;
                        // // String email1 = _controller.text;
                        // // File? image1 = _imageFile;
                        // //2,3,4,11
                        // if (_formKey2.currentState!.validate() &&
                        //     _formKey3.currentState!.validate() &&
                        //     _formKey4.currentState!.validate() &&
                        //     _formKey11.currentState!.validate()) {
                        //   // Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(
                        //   //       builder: (context) =>
                        //   //           homeScreen1(
                        //   //             name: widget.name,
                        //   //             number: widget.number,
                        //   //             email: email,
                        //   //             image: image,
                        //   //           )),
                        //   // );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  homeScreen1(jwt: widget.jwt),
                            ));

                        },

                      child: Text(
                        'Back Home',
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
