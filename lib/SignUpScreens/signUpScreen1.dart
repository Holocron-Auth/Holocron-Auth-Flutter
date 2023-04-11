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
        body: Container(
            color: Colors.black,
            child: Center(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0.15 * height),
                  child: Image.asset('assets/Logo.png'),
                ),
                //  name,mobile number and email id fields along with a request OTP button , and a  login text button
                // Container(),
                Container(
                  width: 0.9 * width,
                  height: 0.08 * height,
                  margin: EdgeInsets.only(top: 0.07 * height),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 1, color: Colors.orange),
                      color: Color(0xff404040)),
                  padding:
                      EdgeInsets.only(left: 0.05 * width, top: 0.03 * width),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(width: 1, color: Colors.orange),
                        //   borderRadius: BorderRadius.circular(15.0),
                        // ),
                        border: InputBorder.none,
                        hintText: 'Name',
                        // labelText: 'Mobile Number',
                        hintStyle: TextStyle(
                            color: Color(0xffFFB267),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(bottom: 0.025 * height),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 0.9 * width,
                  height: 0.08 * height,
                  margin: EdgeInsets.only(top: 0.03 * height),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 1, color: Colors.orange),
                      color: Color(0xff404040)),
                  padding:
                      EdgeInsets.only(left: 0.05 * width, top: 0.03 * width),
                  child: Form(
                    key: _formKey1,
                    child: TextFormField(
                      controller: mobileNo,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(width: 1, color: Colors.orange),
                        //   borderRadius: BorderRadius.circular(15.0),
                        // ),
                        border: InputBorder.none,
                        hintText: 'Mobile Number or Email ID',
                        // labelText: 'Mobile Number',
                        hintStyle: TextStyle(
                            color: Color(0xffFFB267),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(bottom: 0.025 * height),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 0.9 * width,
                  height: 0.08 * height,
                  margin: EdgeInsets.only(top: 0.03 * height),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 1, color: Colors.orange),
                      color: Color(0xff404040)),
                  padding:
                      EdgeInsets.only(left: 0.05 * width, top: 0.01 * width),
                  child: Form(
                    key: _formKey2,
                    child: TextFormField(
                      controller: password,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Password';
                        }
                        else if(validateStructure(value)){
                          return 'Please enter a valid stronger password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(width: 1, color: Colors.orange),
                        //   borderRadius: BorderRadius.circular(15.0),
                        // ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),

                        // labelText: 'Mobile Number',
                        hintStyle: TextStyle(
                            color: Color(0xffFFB267),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(bottom: 0.025 * height),
                      ),
                    ),
                  ),
                ),
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
                        // Do something when the button is pressed
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => LoginScreenState()),
                        // );

                        if (_formKey.currentState!.validate() &&
                            _formKey1.currentState!.validate() &&
                            _formKey2.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _formKey1.currentState!.save();
                          _formKey2.currentState!.save();
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signUpScreenState2()),
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
            ))));
  }
}
//     Container(
//       color: Colors.black,
//         child: Column(
//             children: [
//         Container(
//         margin: EdgeInsets.only(top: 0.25 * height),
//         child: Image.asset('assets/Logo.png'),
//
//       ),
//   ]
//     ),
// )));}}
