import 'package:flutter/material.dart';
import '../settings.dart';
import 'package:holocron_auth_flutter/custom_expansion_tile.dart';


class profileScreen1 extends StatefulWidget {
  @override
  profileScreen1State createState() => profileScreen1State();
}

class profileScreen1State extends State<profileScreen1> {
  @override
  Widget build(BuildContext context) {
    bool isExpanded =  false;
    var borderColor = Colors.transparent;
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
                            color: Colors.orange,
                            height: 0.05 * height,
                            width: 0.65 * width,
                            padding: EdgeInsets.only(left: 0.014 * width),
                            child: Text(
                              "Profile",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            )),
                        Container(
                            height: 0.08 * height,
                            width: 0.65 * width,
                            color: Colors.pink,
                            // margin: EdgeInsets.only(top:0.01*height,left:0.03*height),
                            padding: EdgeInsets.only(
                                top: 0.01 * height, left: 0.014 * width),
                            child: Text(
                              'Complete your profile to access all features',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.08 * height),
                      height: 0.13 * height,
                      width: 0.3 * width,
                      child: Text("Hi"),
                      color: Colors.blue,
                    )
                  ],
                ),
                Container(
                    width: 0.95 * width,
                    margin: EdgeInsets.only(top: 0.04 * height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ExpansionTile(
                      trailing: Icon(Icons.arrow_forward_rounded),
                      // collapsedBackgroundColor: Color(0xff535252),
                      tilePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

                      collapsedBackgroundColor: Color(0xff2b2b2b),
                      backgroundColor: Color(0xff535252),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      //define a border radius for this tile

                      children: [
                        Container(
                            width: 0.8 * width,
                            height: 0.075 * height,
                            margin: EdgeInsets.only(
                                top: 0.07 * height, bottom: 0.02 * height),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
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
                              },
                              child: Text(
                                'Save and Proceed',
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
                      title: const Text(
                        "Primary Details*",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Container(
                    width: 0.95 * width,
                    margin: EdgeInsets.only(top: 0.04 * height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ExpansionTile(
                      trailing: Icon(Icons.arrow_forward_rounded),
                      // collapsedBackgroundColor: Color(0xff535252),
                      tilePadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      collapsedBackgroundColor: Color(0xff2b2b2b),
                      backgroundColor: Color(0xff535252),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      //define a border radius for this tile

                      children: [
                        Container(
                            width: 0.8 * width,
                            height: 0.075 * height,
                            margin: EdgeInsets.only(
                                top: 0.07 * height, bottom: 0.02 * height),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
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
                              },
                              child: Text(
                                'Save and Proceed',
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
                      title: const Text(
                        "Essential Information",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Container(
                    width: 0.95 * width,
                    margin: EdgeInsets.only(top: 0.04 * height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: ExpansionTile(
                      trailing: Icon(Icons.arrow_forward_rounded),
                      // collapsedBackgroundColor: Color(0xff535252),
                      tilePadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      collapsedBackgroundColor: Color(0xff2b2b2b),
                      backgroundColor: Color(0xff535252),
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      //define a border radius for this tile

                      children: [
                        Container(
                            width: 0.8 * width,
                            height: 0.075 * height,
                            margin: EdgeInsets.only(
                                top: 0.07 * height, bottom: 0.02 * height),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
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
                              },
                              child: Text(
                                'Save',
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
                      title: const Text(
                        "Other Details*",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Container(

                  margin: EdgeInsets.only(left:0.03*width, right: 0.03*width, top:0.01*height, bottom: 0.01*height),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: isExpanded ?Colors.orange : Colors.transparent,
                      color: borderColor,
                      width: 1.0,
                    ),
                    //border radius to appear only when expanded
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child:ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  // margin: EdgeInsets.only(top: 0.04 * height, left:0.025*width, right: 0.025*width),
                  child:customExpansionTile(
                    // borderColor: Colors.transparent,
                    onExpansionChanged: (bool expanded){
                      print("hello");
                      isExpanded = expanded;
                      print(isExpanded);
                      borderColor = isExpanded ? Colors.orange : Colors.transparent;
                    },
                    // backgroundColor: Color(0xff535252),
                    backgroundColor: Colors.black,
                    leading: null,
                    trailing: Icon(Icons.arrow_forward_rounded),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    collapsedBackgroundColor:  Color(0xff535252),
                    tilePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // backgroundColor: Color(0xff535252),
                    title: Container(
                      // color: _isExpanded ? Colors.blue : null,
                      child: Text(
                        "Trial", style: TextStyle(color: Colors.white),

                      ),
                    ),
                    // borderSide: BorderSide(color: Colors.white),

                    children: [
                      Container(
                          width: 0.8 * width,
                          height: 0.075 * height,
                          margin: EdgeInsets.only(
                              top: 0.07 * height, bottom: 0.02 * height),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
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
                            },
                            child: Text(
                              'Save and Proceed',
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
                  ),
                ),),
                Container(
                    width: 0.95 * width,
                    height: 0.075 * height,
                    // color: Color(0xff535252),
                    margin: EdgeInsets.only(top: 0.04 * height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color(0xff535252),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => settingsScreen()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 0.63 * width),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ))
                          // Icon(icon)
                        ],
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
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
//
//
//
// class profileScreen1 extends StatefulWidget {
//   @override
//   profileScreen1State createState() => profileScreen1State();
// }
//
// class profileScreen1State extends State<profileScreen1> {
//   bool _isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       backgroundColor: Colors.black,
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: _isExpanded ? Colors.grey : Colors.transparent,
//                     width: _isExpanded ? 1.0 : 0.0,
//                   ),
//                 ),
//               ),
//               child: ExpansionTile(
//                 tilePadding:
//                 EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 initiallyExpanded: false,
//                 title: Text('Tile 1'),
//                 trailing: Icon(Icons.expand_more),
//                 childrenPadding: EdgeInsets.only(bottom: 16.0),
//                 onExpansionChanged: (bool isExpanded) {
//                   setState(() {
//                     _isExpanded = isExpanded;
//                   });
//                 },
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text('This is the content of Tile 1'),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: _isExpanded ? Colors.grey : Colors.transparent,
//                     width: _isExpanded ? 1.0 : 0.0,
//                   ),
//                 ),
//               ),
//               child: ExpansionTile(
//                 tilePadding:
//                 EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 initiallyExpanded: false,
//                 title: Text('Tile 2'),
//                 trailing: Icon(Icons.expand_more),
//                 childrenPadding: EdgeInsets.only(bottom: 16.0),
//                 onExpansionChanged: (bool isExpanded) {
//                   setState(() {
//                     _isExpanded = isExpanded;
//                   });
//                 },
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text('This is the content of Tile 2'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
