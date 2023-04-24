import 'package:flutter/material.dart';
import '../LoginScreens/loginScreen1.dart';
import '../SignUpScreens/signUpScreen2.dart';

final _formKey = GlobalKey<FormState>();
final _formKey1 = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();

final name = TextEditingController();
final mobileNo = TextEditingController();
final password = TextEditingController();

bool _isPasswordVisible = false;

class signUpScreen1 extends StatefulWidget {
  @override
  signUpScreen1State createState() => signUpScreen1State();
}

class signUpScreen1State extends State<signUpScreen1> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;

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
  }

  @override
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
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
                                key: _formKey1,
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
                                  controller: _controller3,
                                  obscureText: !_isPasswordVisible,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a Password';
                                    } else if (!validateStructure(value)) {
                                      return 'Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                      child: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
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
                                    hintText: 'Password',
                                    hintStyle: TextStyle(color: Colors.orange),
                                  ),
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
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _formKey1.currentState!.validate() &&
                                _formKey2.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _formKey1.currentState!.save();
                              _formKey2.currentState!.save();
                            }
                            String name = _controller.text;
                            String mobile = _controller2.text;
                            String password = _controller3.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signUpScreenState2(
                                      name: name,
                                      number: mobile,
                                      password: password,
                                      onSave: (value) {
                                        print(value);
                                      })),
                            );
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
