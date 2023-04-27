import 'package:flutter/material.dart';
//import starterscreen2
import 'starter2.dart';

class StarterScreen extends StatelessWidget {
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
              margin: EdgeInsets.only(top: 0.25 * height),
              child: Image.asset('assets/Logo.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.05 * height),
              child: Text(
                'Your Key to Seamless Access',
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
                  top: 0.05 * height, left: 0.04 * width, right: 0.04 * width),
              child: Text(
                'Access multiple services with just one click, making the login process faster and more convenient than ever before.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.1 * height),
              width: 80,
              height: 80,
              child: GestureDetector(
                onTap: () {
                  // reroute to starter screen 2
                  // Navigator.pushNamed(context, '/starter2');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StarterScreen2()),
                  );
                },
                child: Image.asset(
                  'assets/starterbutton1.png',
                  width: 100,
                  height: 100,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
