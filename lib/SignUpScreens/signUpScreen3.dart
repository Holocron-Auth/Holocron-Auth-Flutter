import 'package:flutter/material.dart';
//import the login screen 1
import '../LoginScreens/loginScreen1.dart';
import '../SignUpScreens/signUpScreen1.dart';
import '../ProfileUpdationScreens/profile1.dart';

class signUpScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      body: Container(
        // color: Colors.black,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.3 * height),
              height: 121,
              width: 121,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.9],
                    tileMode: TileMode.repeated,
                  )),
              child: Icon(Icons.check_rounded, size: 100),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.05 * height, right: 0.04 * width, left: 0.04 * width),
              child: Text(
                'Account Created!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 0.01 * height, left: 0.01 * width, right: 0.01 * width),
              child: Text(
                "Unlock the full potential now. Complete Your Profile and Gain Access to All the Features and Benefits.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
                width: 0.8 * width,
                height: 0.055 * height,
                margin: EdgeInsets.only(top: 0.05 * height),
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
                    String initialValue = 'Ritvik Pendyala';
                    String number = "9502546860";
                    // Do something when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => profileScreen1(
                              name: initialValue,
                              number: number,
                              onSave: (value) {
                                print(value);
                              })),
                    );
                  },
                  child: Text(
                    'Complete Your Profile',
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
    );
  }
}
