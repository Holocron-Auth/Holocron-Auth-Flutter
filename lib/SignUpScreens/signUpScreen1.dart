import 'package:flutter/material.dart';
import '../LoginScreens/loginScreen1.dart';
import '../SignUpScreens/signUpScreen2.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter_curl/flutter_curl.dart';
import 'package:http/http.dart' as http;

final _formKey = GlobalKey<FormState>();
final _formKey1 = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();

// final name = TextEditingController();
// final mobileNo = TextEditingController();
// final email = TextEditingController();

bool _isPasswordVisible = false;

class signUpScreen1 extends StatefulWidget {
  @override
  signUpScreen1State createState() => signUpScreen1State();
}

class signUpScreen1State extends State<signUpScreen1> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }



  Future<String> generateOTP(String phone) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'application/json',
    };

    var data = '{"json": {"phone": "$phone"}}';

    var url = Uri.parse('https://holocron-auth.gjd.one/api/trpc/mobile.generateOTPWithPhone');
    var res = await http.post(url, headers: headers, body: data);
    print(res.body);
    if (res.statusCode != 200) {
      // throw Exception('http.post error: statusCode= ${res.statusCode}');
      return 'Error Moving forward';
    }
    else{
      return 'Success';
    }
    print(res.body);
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final List<SimCard> simCards = (await MobileNumber.getSimCards)!;
      final String mobileNumber1 = (await MobileNumber.mobileNumber)!;
      print(mobileNumber1);
      print(simCards);
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;

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
                      margin: EdgeInsets.only(top: 0.15 * height),
                      child: Image.asset('assets/Logo.png'),
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
                            top: 0.1 * height,
                            right: 0.03 * width,
                            left: 0.03 * width),
                        child: Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(color: Colors.orange),
                                    hintText: 'Name',
                                    hintStyle: TextStyle(color: Colors.orange),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
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
                                key: _formKey2,
                                child: TextFormField(
                                  controller: _controller2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(color: Colors.orange),
                                    hintText: 'Mobile Number',
                                    hintStyle: TextStyle(color: Colors.orange),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your mobile number';
                                    }
                                    else if(value.length != 10){
                                      return 'Please enter a valid mobile number';
                                    }
                                    return null;
                                  },
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
                                key: _formKey1,
                                child: TextFormField(
                                  controller: _controller3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(color: Colors.orange),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.orange),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Email Address';
                                    }
                                    else if (EmailValidator.validate(value) == false) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        width: 0.8 * width,
                        height: 0.065 * height,
                        margin: EdgeInsets.only(top: 0.07 * height),
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
                            print(_simCard);
                            if (_formKey.currentState!.validate() &&
                                _formKey1.currentState!.validate()) {

                              String name = _controller.text;
                              String mobile = _controller2.text;
                              String email = _controller3.text;
                              String mobile2= '91+91' + '$mobile';
                              String last10 = _mobileNumber.substring(_mobileNumber.length - 10);
                              if(mobile  != last10){
                                print(mobile);
                                print(last10);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content :

                                      Text("The phone number that you've entered isn't the same as the you've entered in the field above\n Please enter the phone number registered with your Sim Card "),


                                    duration: Duration(seconds: 2),

                                  ),
                                );
                              }
                              else {
                                _formKey.currentState!.save();
                                _formKey1.currentState!.save();
                                _formKey2.currentState!.save();
                                //uncomment the below line when pushing
                                String response = await generateOTP(last10);
                                print(response);
                                if(response == "error"){
                                  print('In here');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content :

                                        Text("Please check your internet connection or try again later"),

                                      duration: Duration(seconds: 2),

                                    ),
                                  );
                                }
                                else if(response == "Success"){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            signUpScreenState2(
                                                name: name,
                                                number: mobile,
                                                email: email,
                                                // password: password,
                                                onSave: (value) {
                                                  print(value);
                                                })),
                                  );
                                }
                              }
                            }

                          },
                          child: Text(
                            'Request OTP',
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
                            child: Text("Already have an account?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ))),
                        Container(
                            margin: EdgeInsets.only(right: 0.23 * width),
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
                  ],
                )))));
  }
}
