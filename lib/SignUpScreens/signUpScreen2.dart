import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';
import '../LoginScreens/loginScreen1.dart';
import '../SignUpScreens/signUpScreen3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../SignUpScreens/registrationresponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUpScreenState2 extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final void Function(String) onSave;

  const signUpScreenState2(
      {Key? key,
      required this.name,
      required this.number,
      required this.email,
      required this.onSave})
      : super(key: key);

  @override
  signUpScreen2 createState() => signUpScreen2();
}

class signUpScreen2 extends State<signUpScreenState2> {
  TextEditingController _controller1 = TextEditingController(text: '');
  late TextEditingController _controller2;
  String _otpCode = '';
  late String mobileNumber;
  bool hasError = false;
  String errorMessage = "";
  int _timerCountdown = 120;
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
      _timerCountdown = 120;
      _isTimerRunning = false;
    });
    _resendOtpTimer?.cancel();
  }

  @override
  void dispose() {
    _resendOtpTimer?.cancel();
    super.dispose();
  }

  late SharedPreferences pref_login;

  void initShareddPref() async {
    pref_login = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initShareddPref();
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
              margin: EdgeInsets.only(top: 0.02 * height, right: 0.59 * width),
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

            Row(children: [
              Container(
                  margin:
                      EdgeInsets.only(top: 0.02 * height, left: 0.05 * width),
                  child: TextButton(
                    onPressed: () {
                      // Do something when the button is pressed
                    },
                    child: Text('Resend OTP($_timerCountdown s)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        )),
                  )),
            ]),

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
                    String name = widget.name;
                    String number = widget.number;
                    String email = widget.email;
                    print(_controller1.text);
                    if (_controller1.text.length == 6) {
                      var response = await RegistrationResponse.registerUser(
                          email, number, name, _controller1.text);
                      print("Here's the response!!!!!!!");
                      print(response);
                      var JWT = response.jwt;
                      print("Here's the JWT!!!!!!!");
                      print(JWT);
                      print(response.message);
                      print("Storing in this secure place");
                      pref_login.setString('JWT', JWT);
                      print("Successfully stored on the secure ass place");
                      print('Original JWT: $JWT');
                      if (response.message == 'User registered successfully') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signUpScreen3(
                                    name: name,
                                    number: number,
                                    email: email,
                                    jwt: response.jwt,
                                  )),
                        );
                      } else if (response.message == "Invalid OTP") {
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
                      } else {
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
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please enter an OTP of 6 digits",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
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
                    child: Text("Already have an account",
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
                          builder: (context) => LoginScreenState()),
                    );
                  },
                  child: Text('Log In!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                )),
              ],
            ),

            // Container(
            //     width: 0.8*width,
            //     height: 0.055*height,
            //     margin: EdgeInsets.only(top: 0.01 * height),
            //
            //
            //     child:ElevatedButton(
            //
            //       onPressed: () {
            //         // Do something when the button is pressed
            //       },
            //       child: Text('Sign Up', style: TextStyle(color:Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
            //       style: ElevatedButton.styleFrom(
            //
            //         primary: Colors.black,
            //         side: BorderSide(color: Colors.orange, width: 1),
            //         shadowColor: Colors.transparent,
            //         // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
            //
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //       ),
            //     )),
          ],
        )),
      )),
    );
  }
}
