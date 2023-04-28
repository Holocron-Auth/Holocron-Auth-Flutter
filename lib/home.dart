import 'package:flutter/material.dart';
import '../profile.dart';
import 'dart:io';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../tips.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:local_auth/local_auth.dart';
import '../ProfileUpdationScreens/profile1.dart';
import 'package:flutter/services.dart';

class homeScreen1 extends StatefulWidget {
  final String jwt;

  const homeScreen1({
    Key? key,
    required this.jwt,
  }) : super(key: key);
  @override
  homeScreen1State createState() => homeScreen1State();
}

class homeScreen1State extends State<homeScreen1> with WidgetsBindingObserver {
  late File _image;
  late String name;
  late String number;
  late String email;
  final auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;


  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
      print(_canCheckBiometrics);
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
      print(_availableBiometrics);
    });
  }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         sensitiveTransaction: true,
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //
  //   setState(
  //           () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }

  // Future<void> _authenticate() async {
  //   bool authenticated = false;
  //   try {
  //     setState(() {
  //       _isAuthenticating = true;
  //       _authorized = 'Authenticating';
  //     });
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         sensitiveTransaction: true, // add this line
  //       ),
  //     );
  //     setState(() {
  //       _isAuthenticating = false;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     setState(() {
  //       _isAuthenticating = false;
  //       _authorized = 'Error - ${e.message}';
  //     });
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  // }


  // Future<bool> isAuthorized() async {
  //   bool authenticated = false;
  //
  //   try {
  //     authenticated = await auth.authenticate(
  //       localizedReason: 'Let OS determine authentication method',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //       ),
  //     );
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //
  //   return authenticated;
  // }
  //
  // Future<void> _authenticate() async {
  //   setState(() {
  //     _isAuthenticating = true;
  //     _authorized = 'Authenticating';
  //   });
  //
  //   bool authenticated = await isAuthorized();
  //
  //   setState(() {
  //     _isAuthenticating = false;
  //     _authorized = authenticated ? 'Authorized' : 'Not Authorized';
  //   });
  // }
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    if (authenticated) {
      setState(() => _authorized = 'Authorized');
    } else {
      SystemNavigator.pop(); // Close the app if authentication is cancelled
    }
  }



  @override
  void initState() {
    super.initState();

    _checkBiometrics();
    _getAvailableBiometrics();
    //here check if authorsised only then allow the user to go to the home screen
    WidgetsBinding.instance!.addObserver(this);
    _authenticate();
    print("Here's the token");
    Map<String, dynamic> jwtDecoded = JwtDecoder.decode(widget.jwt);
    print(jwtDecoded);
    name = jwtDecoded['name'];
    print(name);
    number = jwtDecoded['phone'];
    print(number);
    email = jwtDecoded['email'];
    print(email);
      // _image = jwtDecoded['image']?? File('assets/Change.png');
      // print(_image);
    // if(_authorized == 'Not Authorized'){
    //   _authenticate();
    //
    // }
    // else if(_authorized == 'Authorized'){
    //   print(_authorized);

    // }



  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _authenticate();
    }
  }


  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;
    int dashno1 = 14;
    int dashno2 = 17;
    int dashno3 = 96;
    int dashno4 = 12;
    int dashno5 = 20;
    int dashno6 = 32;
    int _currentProgress = 90;

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
                          'Hi, ${name!}!',
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
                            top: 0.01 * height,
                            right: 0.1 * width,
                            left: 0.02 * width),
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
                        File _image1 = _image ?? File('assets/Change.png');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  profileScreen3(jwt: widget.jwt),
                            ));
                      },
                      child: CircleAvatar(
                        radius: 30.0,
                        // backgroundImage: FileImage(_image),
                        // child: Icon(
                        //   Icons.person,
                        //   color: Colors.white,
                        //   size: 30.0,
                        // ),
                      ),
                    ))
              ],
            ),
            Container(
                width: 0.95 * width,
                height: 0.55 * height,
                margin: EdgeInsets.only(top: 0.02 * height),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.02 * height,
                          right: 0.58 * width,
                          left: 0.02 * width),
                      child: Text(
                        'Dashboard',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffFFB267),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.005 * height,
                            right: 0.1 * width,
                            left: 0.04 * width),
                        child: Text(
                          'Here’s how your account has been performing so far!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.02 * height,
                            right: 0.01 * width,
                            left: 0.04 * width),
                        child: Row(children: [
                          Container(
                              width: 0.25 * width,
                              height: 0.15 * height,
                              margin: EdgeInsets.only(
                                right: 0.02 * width,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff535252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.only(top: 0.02 * height),
                                      child: Text(
                                        dashno1.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xffFFB267),
                                          fontSize: 49,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: 0.02 * height),
                                      child: Text(
                                        'Services',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ))
                                ],
                              )),
                          Container(
                              width: 0.25 * width,
                              height: 0.15 * height,
                              decoration: BoxDecoration(
                                color: Color(0xff535252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 0.02 * width,
                                          right: 0.02 * width),
                                      child: Text(
                                        dashno2.toString(),
                                        style: TextStyle(
                                          color: Color(0xffFFB267),
                                          fontSize: 49,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Container(
                                    child: Text(
                                      "Login\nAttempts",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 0.01 * width, right: 0.02 * width),
                              decoration: BoxDecoration(
                                color: Color(0xff535252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              width: 0.35 * width,
                              height: 0.15 * height,
                              child: Column(children: [
                                //Fill this
                                Container(),
                                Container(
                                  child: Text(
                                    'Better than 96% Smartphone users',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                )
                              ])),
                        ])),
                    Container(
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: 0.01 * height,
                                  right: 0.01 * width,
                                  left: 0.04 * width),
                              width: 0.25 * width,
                              height: 0.15 * height,
                              decoration: BoxDecoration(
                                color: Color(0xff535252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 0.02 * width,
                                          right: 0.02 * width),
                                      child: Text(
                                        dashno4.toString() + 's',
                                        style: TextStyle(
                                          color: Color(0xffFFB267),
                                          fontSize: 49,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Container(
                                    child: Text(
                                      "Avg. login time",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )),
                          //Fill this
                          Container(
                              child: Row(children: [
                            Column(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 0.01 * height,
                                    right: 0.01 * width,
                                    left: 0.01 * width),
                                width: 0.34 * width,
                                height: 0.15 * height,
                                decoration: BoxDecoration(
                                  color: Color(0xff535252),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(children: [
                                  Container(
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(left: 0.01 * width),
                                    height: 0.15 *
                                        MediaQuery.of(context).size.height,
                                    width: 0.13 *
                                        MediaQuery.of(context).size.width,
                                    child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          startAngle: 360,
                                          endAngle: 360,
                                          showLabels: false,
                                          showTicks: false,
                                          minimum: 0,
                                          maximum: 100,
                                          axisLineStyle: AxisLineStyle(
                                            color: Color(0xff2B2B2B),
                                            thickness: 15,
                                            cornerStyle: CornerStyle.bothFlat,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              value:
                                                  _currentProgress.toDouble(),
                                              onValueChanged: (value) {
                                                setState(() {
                                                  double _currentProgress1 =
                                                      value;
                                                  _currentProgress =
                                                      _currentProgress1.toInt();
                                                  // _currentProgress = value;
                                                });
                                              },
                                              cornerStyle: CornerStyle.bothFlat,
                                              width: 15,
                                              enableAnimation: true,
                                              animationType: AnimationType.ease,
                                              color: Color(0xffFFB267),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 0.02 * width,
                                              right: 0.02 * width),
                                          child: Text(
                                            dashno5.toString(),
                                            style: TextStyle(
                                              color: Color(0xffFFB267),
                                              fontSize: 49,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                      Container(
                                        child: Text(
                                          "mins\n Saved",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ]),
                            Container()
                          ])),
                          Container(
                              margin: EdgeInsets.only(
                                  top: 0.01 * height,
                                  right: 0.01 * width,
                                  left: 0.01 * width),
                              width: 0.25 * width,
                              height: 0.15 * height,
                              decoration: BoxDecoration(
                                color: Color(0xff535252),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 0.02 * width,
                                          right: 0.02 * width),
                                      child: Text(
                                        dashno6.toString(),
                                        style: TextStyle(
                                          color: Color(0xffFFB267),
                                          fontSize: 49,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                  Container(
                                    child: Text(
                                      "Permissions\nGranted",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                width: 0.95 * width,
                margin: EdgeInsets.only(top: 0.02 * height),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.02 * height,
                          right: 0.5 * width,
                          left: 0.02 * width),
                      child: Text(
                        'Review Access',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffFFB267),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    //           if(dashno1!=0)return Container(
                    //   margin: EdgeInsets.only(
                    //     top: 0.02 * height,
                    //     right: 0.01 * width,
                    //     left: 0.01 * width,
                    //
                    //   ),
                    //   child: Text(
                    //     'You have used Holocron to log into $dashno1 Services'
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // )

                    //
                    //
                    // if(dashno1!=0){
                    //   return Container(
                    //     margin: EdgeInsets.only(
                    //       top: 0.02 * height,
                    //       right: 0.01 * width,
                    //       left: 0.01 * width,
                    //
                    //     ),
                    //     child: Text(
                    //       'You have used Holocron to log into $dashno1 Services'
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   )
                    // }else{
                    //   return
                    //   Container(
                    //     margin: EdgeInsets.only(
                    //         top: 0.02 * height,
                    //         right: 0.01 * width,
                    //         left: 0.01 * width,
                    //     ),
                    //     child: Text(
                    //       'Set up Holocron to start logging into your services',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400,),
                    //     ),
                    //   ),
                    // }
                    //

                    Container(
                      height: 0.05 * height,
                      width: 0.25 * width,
                      margin: EdgeInsets.only(
                          right: 0.02 * width, left: 0.68 * width),
                      child: TextButton(
                        onPressed: () {
                          // code to execute when the button is pressed
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                width: 0.95 * width,
                height: 0.55 * height,
                margin: EdgeInsets.only(top: 0.02 * height),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.02 * height,
                          right: 0.25 * width,
                          left: 0.02 * width),
                      child: Text(
                        'Security Fitness Report',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffFFB267),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.005 * height,
                            right: 0.01 * width,
                            left: 0.02 * width),
                        child: Text(
                          'Secure is your middle name! Your account is secure more than 96% of  SmartPhone users. Way to make it happen!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Container(
                      height: 0.05 * height,
                      width: 0.25 * width,
                      margin: EdgeInsets.only(
                          right: 0.02 * width, left: 0.68 * width),
                      child: TextButton(
                        onPressed: () {
                          // code to execute when the button is pressed
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                width: 0.95 * width,
                height: 0.55 * height,
                margin:
                    EdgeInsets.only(top: 0.02 * height, bottom: 0.04 * height),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E2E),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.02 * height,
                          right: 0.5 * width,
                          left: 0.02 * width),
                      child: Text(
                        'Security Tips',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffFFB267),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.005 * height,
                            right: 0.1 * width,
                            left: 0.04 * width),
                        child: Text(
                          'Stay up to date with Best Practices',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.01 * height,
                          right: 0.02 * width,
                          left: 0.04 * width),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Manage your permissions - Review the permissions granted to each app on your device. Ensure that the permissions granted are appropriate and necessary for the app to function.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.01 * height,
                          right: 0.02 * width,
                          left: 0.04 * width),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Lock your device - Use a PIN, password, or biometric authentication to secure your device and prevent unauthorized access',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 0.01 * height,
                          right: 0.02 * width,
                          left: 0.04 * width),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Be aware of phishing - Don't share sensitive information or click on suspicious links, even if they appear to be from a legitimate source.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      height: 0.05 * height,
                      width: 0.25 * width,
                      margin: EdgeInsets.only(
                          right: 0.02 * width, left: 0.68 * width),
                      child: TextButton(
                        onPressed: () {
                          // code to execute when the button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tipsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "View More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
