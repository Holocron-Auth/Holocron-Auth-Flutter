import 'package:flutter/material.dart';
import '../LoginScreens/loginScreen2.dart';

class LoginScreenState extends StatefulWidget {
  @override
  LoginScreen1 createState() => LoginScreen1();
}

class LoginScreen1 extends State<LoginScreenState> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.25 * height),
              child: Image.asset('assets/Logo.png'),
            ),

            Container(
              //textfield form for mobile number
              width: 0.8 * width,
              height: 0.055 * height,
              margin: EdgeInsets.only(top: 0.07 * height),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black),
              child: TextFormField(
                //required
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },


                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  hintStyle: TextStyle(
                      color: Color(0xffFFB267),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  contentPadding:
                      EdgeInsets.only(left: 0.05 * width, top: 0.015 * height),
                ),
              ),
            ),
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
                  onPressed: () {
                    // Do something when the button is pressed
                    String mobileNumber = _controller.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreenState2(mobileNumber: mobileNumber)
                        )
                    );
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
      ),
    );
  }
}
