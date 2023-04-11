import 'package:flutter/material.dart';

class settingsScreen extends StatefulWidget {
  @override
  settingsScreen1State createState() => settingsScreen1State();
}

class settingsScreen1State extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
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
                              "Settings",
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
                              'Manage your account',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ],
                ),
                Container(
                    width: 0.95 * width,
                    height: 0.075 * height,
                    margin: EdgeInsets.only(top: 0.01 * height),


                    child:ElevatedButton(

                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => signUpScreen1()),
                        // );
                        // Do something when the button is pressed
                      },
                      child: Text('Delete My Account', style: TextStyle(color:Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                      style: ElevatedButton.styleFrom(

                        primary: Colors.black,
                        side: BorderSide(color: Colors.orange, width: 1),
                        shadowColor: Colors.transparent,
                        // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    )),
                Container(
                  height:0.05*height,
                  width:0.4*width,
                  margin: EdgeInsets.only(top:0.01*height),
                  // color:Colors.pink,
                    child: TextButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreenState()),
                        // );
                      },
                      child: Text('View Login History',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    )
                ),
                Container(
                  // color:Colors.pink,
                    height:0.04*height,
                    width:0.4*width,
                    child: TextButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreenState()),
                        // );
                      },
                      child: Text('Terms and Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    )
                )
              ],
            ),
          ),
        ));
  }
}
