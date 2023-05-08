import 'package:flutter/material.dart';
import '../LoginScreens/loginScreen2.dart';
import '../SignUpScreens/signUpScreen1.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter_curl/flutter_curl.dart';
import 'package:http/http.dart' as http;


final _formKey = GlobalKey<FormState>();

class LoginScreenState extends StatefulWidget {
  @override
  LoginScreen1 createState() => LoginScreen1();
}

class LoginScreen1 extends State<LoginScreenState> {
  TextEditingController _controller = TextEditingController();
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  void initState() {
    super.initState();

    _controller = TextEditingController();
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
    late
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.25 * height),
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
                    top: 0.02 * height,
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
                width: 0.9 * width,
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

                    print(_simCard);
                    if (_formKey.currentState!.validate()) {
                      String mobile = _controller.text;
                      String last10 = _mobileNumber.substring(_mobileNumber.length - 10);
                      if(mobile  != last10){
                        print(mobile);
                        print(last10);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(


                              content:Text("The phone number that you've entered isn't the same as the you've entered in the field above\n Please enter the phone number registered with your Sim Card "),


                            duration: Duration(seconds: 2),

                          ),
                        );
                      }
                      else {
                        print(_simCard);
                        _formKey.currentState!.save();
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
                                    LoginScreenState2(
                                        mobileNumber: last10
                                        )),
                          );
                        }
                      }
                    }
                  },
                  child: Text(
                    'Get OTP',
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
                      MaterialPageRoute(builder: (context) => signUpScreen1()),
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
    );
  }
}
