import 'package:flutter/material.dart';
import '../profile.dart';
import 'dart:io';

class homeScreen1 extends StatefulWidget {
  final String name;
  final String number;
  final File? image;

  const homeScreen1({
    Key? key,
    required this.name,
    required this.number,
    this.image,
  }) : super(key: key);
  @override
  homeScreen1State createState() => homeScreen1State();
}

class homeScreen1State extends State<homeScreen1> {
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image ?? File('assets/Change.png');
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
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 0.08 * height, left: 0.01 * width),
                        child: Text(
                          'Hi, ${widget.name}!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 0.01 * height, right: 0.12 * width),
                        child: Text(
                          'Review your security here!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin:
                        EdgeInsets.only(top: 0.06 * height, left: 0.01 * width),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    //make the circle avatar a button to go to the profile page
                    //
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to profile screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => profileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: FileImage(_image),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ))
              ],
            ),
          ],
        )),
      ),
    );
  }
}
