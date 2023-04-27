import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';
import '../SignUpScreens/signUpScreen1.dart';
import 'dart:io';
import '../home.dart';
import 'package:http/http.dart' as http;
import '../loginresponse.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenState2 extends StatefulWidget {
  final String mobileNumber;
  LoginScreenState2({required this.mobileNumber, Key? key}) : super(key: key);
  @override
  LoginScreen2 createState() => LoginScreen2();
}

class LoginScreen2 extends State<LoginScreenState2> {
  TextEditingController _controller1 = TextEditingController(text: '');
  late TextEditingController _controller2;
  String _otpCode = '';
  late String mobileNumber;
  bool hasError = false;
  String errorMessage = "";
  int _timerCountdown = 60;
  bool _isTimerRunning = false;
  Timer? _resendOtpTimer;
  bool isChecked = false;
  bool isVerified = false;
  late SharedPreferences pref;

  void initShareddPref() async {
    pref = await SharedPreferences.getInstance();
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

  @override
  void dispose() {
    _resendOtpTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initShareddPref();
    mobileNumber = widget.mobileNumber;
    String mobileNumber1 = '+91 ' + mobileNumber;
    _controller2 = TextEditingController(text: mobileNumber1);
    _startResendOtpTimer();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return Colors.orange;
    }

    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.25 * height),
                child: Image.asset('assets/Logo (1).png'),
              ),
              Container(
                decoration: BoxDecoration(
                  //outline border
                  border: Border.all(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.only(top: 0.03 * height),
                width: 0.8 * width,
                height: 0.055 * height,
                child: TextField(
                  controller: _controller2,
                  // hintText: 'Mobile Number',
                  // labelText: 'Mobile Number',
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Color(0xffFFB267),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    contentPadding: EdgeInsets.only(left: 0.05 * width),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 0.02 * height, right: 0.59 * width),
                child: Text(
                  "ENTER OTP",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.03 * height),
                child: PinCodeTextField(
                  autofocus: true,
                  controller: _controller1,
                  // hideCharacter: true,
                  highlight: true,
                  highlightColor: Colors.orange,
                  defaultBorderColor: Colors.white,
                  hasTextBorderColor: Colors.white,
                  highlightPinBoxColor: Colors.black,
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
                  wrapAlignment: WrapAlignment.spaceAround,
                  //underline color

                  pinBoxColor: Colors.black,
                  pinTextStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  hasError: hasError,
                  // cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  // appContext: context,
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(top: 0.02 * height, left: 0.05 * width),
                  child: TextButton(
                    onPressed: () {
                      // Do something when the button is pressed
                      if (_isTimerRunning) {
                        _startResendOtpTimer();
                      }
                    },
                    child: Text('Resend OTP($_timerCountdown s)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  )),

              //create a checkbox to keep you logged in

              Container(
                  width: 0.8 * width,
                  height: 0.055 * height,
                  margin: EdgeInsets.only(top: 0.04 * height),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        tileMode: TileMode.repeated,
                      )),
                  child: ElevatedButton(
                    onPressed: () async {
                      String name = "Ritvik Pendyala";
                      String number = widget.mobileNumber;
                      String email = "pendyala20096@iiitd.ac.in";
                      File image = File("assets/Change.png");
                      if (_controller1.text.length == 6) {
                        // String response = await _loginWithPhone(
                        //     number, _controller1.text);
                        // print(response);
                        var response = await LoginResponse.loginWithPhone(
                            number, _controller1.text);
                        print(response.JWT);
                        print("Im here from the login screen");
                        if (response.message ==
                            'User registered successfully') {
                          var JWT = response.JWT;
                          pref.setString('JWT', JWT);
                          // print(response.name);
                          // print(response.email);
                          // print(response.mobileNumber);
                          // print(response.image);
                          // access user data

                          print("Going to home screen");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homeScreen1(
                                      // name: response.name,
                                      // number: response.mobileNumber,
                                      // email: response.email,
                                      // image: response.image,
                                      jwt: JWT,
                                    )),
                          );
                        }
                        else if (response.message == "Invalid OTP") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Invalid OTP",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Error registering user",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
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
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0.23 * width),
                      child: Text("Don't have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ))),
                  Container(
                      child: TextButton(
                    onPressed: () {
                      // Do something when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signUpScreen1()),
                      );
                    },
                    child: Text('Sign Up!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
