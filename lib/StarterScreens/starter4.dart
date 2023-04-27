import 'package:flutter/material.dart';
//import the login screen 1
import '../LoginScreens/loginScreen1.dart';
import '../SignUpScreens/signUpScreen1.dart';
class StarterScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      body: Container(
        // color: Colors.black,
        decoration: BoxDecoration(
          color: Colors.black,
          // image: DecorationImage(
          //   image: AssetImage('assets/image 9.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        // Container(
        //   color: Color.fromRGBO(0, 0, 0, 0.5),
        // ),
        child: Center(
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top: 0.25*height),
                  child: Image.asset('assets/Logo.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.05*height, right: 0.04*width, left: 0.04*width),
                  child: Text(

                    'Holocron OAuth',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,


                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.01*height, left: 0.01*width, right: 0.01*width),
                  child: Text(
                    "Login to Experience Holocron's Streamlined Access and Enhanced Security.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,


                    ),),
                ),

                Container(
                  width: 0.8*width,
                    height: 0.055*height,
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
                child:ElevatedButton(
                  onPressed: () {
                    // Do something when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreenState()),
                    );
                  },
                  child: Text('Log In', style: TextStyle(color:Colors.black, fontSize: 17, fontWeight: FontWeight.w500),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,

                    shadowColor: Colors.transparent,
                    // backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )),


                Container(
                    width: 0.8*width,
                    height: 0.055*height,
                    margin: EdgeInsets.only(top: 0.01 * height),


                    child:ElevatedButton(

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signUpScreen1()),
                        );
                        // Do something when the button is pressed
                      },
                      child: Text('Sign Up', style: TextStyle(color:Colors.white, fontSize: 17, fontWeight: FontWeight.w400),),
                      style: ElevatedButton.styleFrom(

                        primary: Colors.black,
                        side: BorderSide(color: Colors.orange, width: 1),
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
