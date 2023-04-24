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
              Container(
                margin: EdgeInsets.only(top:0.06*height),
                  child:Row(
          children:[
              Container(
                margin: EdgeInsets.only(left: 0.05*width, right: 0.08*width),
                child:IconButton(icon:Icon(Icons.arrow_back_ios), color:Colors.white, iconSize: 30,
                    onPressed: (){
                  Navigator.pop(context);
                },)
                ),


              Container(
                // margin: EdgeInsets.only(top: 0.08*height, bottom: 0.1*height),
                child:Text("Profile Screen",style:TextStyle(color:Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
              ),]))

            ]
          )
        )
      )
    );
  }
}