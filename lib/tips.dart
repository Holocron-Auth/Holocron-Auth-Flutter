import 'package:flutter/material.dart';


class tipsScreen extends StatefulWidget {
  @override
  tipsScreen1State createState() => tipsScreen1State();
}

class tipsScreen1State extends State<tipsScreen>{
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
                                    child:Text("Security Tips",style:TextStyle(color:Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
                                ),]))

                    ]
                )
            )
        )
    );
  }
}