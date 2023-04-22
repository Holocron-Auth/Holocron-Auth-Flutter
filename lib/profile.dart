import 'package:flutter/material.dart';


class profileScreen extends StatefulWidget {
  @override
  profileScreen1State createState() => profileScreen1State();
}

class profileScreen1State extends State<profileScreen>{
  @override
  Widget build(BuildContext context){
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child:SingleChildScrollView(
          child:Column(
            children:[

            ]
          )
        )
      )
    );
  }
}