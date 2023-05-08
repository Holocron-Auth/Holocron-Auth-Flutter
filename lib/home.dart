import 'package:flutter/material.dart';
import '../profile.dart';
import 'dart:io';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../tips.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:local_auth/local_auth.dart';
import '../ProfileUpdationScreens/profile1.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<Map<String, dynamic>> fetchData(String jwt) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };

    var data = '{"json": {"jwt": "${jwt}"}}';
    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.dashboardInfo');
    var res = await http.post(url, headers: headers, body: data);
    var decoded = jsonDecode(res.body);
    print(decoded);

    if (res.statusCode != 200) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Insights couldn't be retrieved"),
      //   duration: Duration(seconds: 2),
      // ));
      return Map<String, dynamic>();
    } else {
      return decoded['result'];
    }
    //
    // print(res.body);
    // var decoded = jsonDecode(res.body);
    // print(decoded);
    // return decoded['result'];
  }

  Future<Map<String, dynamic>> _getData(String jwt) async {
    print("Inside the get data thingi");
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };

    var data = '{"json": {"jwt": "${jwt}"}}';

    var url = Uri.parse(
        'https://holocron-auth.gjd.one/api/trpc/mobile.getAllUserDetails');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details couldn't be retrieved"),
        duration: Duration(seconds: 2),
      ));
    }
    print(res.body);
    print("splitter");
    var decoded = jsonDecode(res.body);
    print(decoded);
    print(decoded['result']['data']['json']['user']['name']);
    print(jsonDecode(res.body)['result']['data']['json']['name']);
    print(decoded['result'].runtimeType);
    return decoded['result'];
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
    int dashno1 = 3;
    int dashno2 = 1;
    double dashno3 = 4.85;
    int dashno4 = 2;
    int dashno5 = 20;
    int dashno6 = 32;
    int dashno10 = 0;
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
                  margin: EdgeInsets.only(
                      top: 0.06 * height,
                      left: 0.01 * width,
                      right: 0.02 * width),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  //make the circle avatar a button to go to the profile page
                  child: GestureDetector(
                    onTap: () async {
                      // Navigate to profile screen
                      // File _image1 = _image ?? File('assets/Change.png');
                      String jwt = widget.jwt;
                      var data1 = await _getData(widget.jwt);
                      print(data1.runtimeType);
                      print(data1);
                      print("going to profile screen");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              profileScreen3(jwt: jwt, data1: data1),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30.0,
                      child: Text(
                        name.isNotEmpty ? name[0] : "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                )
              ],
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchData(widget.jwt),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      width: 0.95 * width,
                      // height: 0.5 * height,
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
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                right: 0.02 * width,
                                                bottom: 0.01 * height),
                                            width: 0.25 * width,
                                            height: 0.15 * height,
                                            decoration: BoxDecoration(
                                              color: Color(0xff535252),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Column(children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 0.02 * height,
                                                    bottom: 0.01 * height),
                                                child: Text(
                                                  // snapshot["data"]["json"]["loginAttempts"].toString(),
                                                  snapshot.data!['data']['json']
                                                          ['loginAttempts']
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 0.01 * width,
                                                      right: 0.01 * width),
                                                  margin: EdgeInsets.only(
                                                      left: 0.01 * width,
                                                      right: 0.01 * width),
                                                  child: Text(
                                                      "     Login\n Attempts",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )))
                                            ])),
                                        Container(
                                            margin: EdgeInsets.only(
                                                right: 0.02 * width,
                                                bottom: 0.01 * height),
                                            width: 0.25 * width,
                                            height: 0.15 * height,
                                            decoration: BoxDecoration(
                                              color: Color(0xff535252),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Column(children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 0.02 * height,
                                                    bottom: 0.01 * height),
                                                padding: EdgeInsets.only(
                                                    left: 0.01 * width,
                                                    right: 0.01 * width),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  snapshot.data!['data']['json']
                                                          ['services']
                                                      .toString(),
                                                  // dashno10.toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  child:
                                                      Text("Services \n   Used",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          )))
                                            ])),
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: 0.02 * width,
                                            bottom: 0.01 * height),
                                        width: 0.53 * width,
                                        height: 0.15 * height,
                                        decoration: BoxDecoration(
                                          color: Color(0xff535252),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Column(children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 0.02 * height),
                                            child: Text(
                                              snapshot.data!['data']['json']
                                                      ['min']
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 50,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 0.01 * width,
                                                  right: 0.01 * width),
                                              padding: EdgeInsets.only(
                                                  left: 0.01 * width,
                                                  right: 0.01 * width),
                                              child: Text("Minutes Saved",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  )))
                                        ]))
                                  ],
                                )),
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 0.02 * width,
                                        bottom: 0.01 * height),
                                    width: 0.33 * width,
                                    height: 0.32 * height,
                                    decoration: BoxDecoration(
                                      color: Color(0xff535252),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 0.05 * height,
                                              left: 0.01 * width,
                                              right: 0.01 * width),
                                          margin: EdgeInsets.only(
                                              top: 0.02 * height,
                                              right: 0.01 * width,
                                              left: 0.01 * width),
                                          child: Text(
                                            snapshot.data!['data']['json']
                                                    ['permissions']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 70,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 0.02 * height,
                                                right: 0.01 * width,
                                                left: 0.01 * width),
                                            child: Text(
                                                "Permissions \n    Granted",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                )))
                                      ],
                                    )),
                              ])),
                          Container(
                              width: 0.95 * width,
                              margin: EdgeInsets.only(top: 0.02 * height),
                              decoration: BoxDecoration(
                                color: Color(0xff2E2E2E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                  Container(

                                    height:0.4*height,
                                    child:ListView.builder(
                                    itemCount: snapshot
                                        .data!['data']['json']['connectedApps']
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var app = snapshot.data!['data']['json']
                                          ['connectedApps'][index]['app'];
                                      return ListTile(
                                        leading: Image.network(app['logo']),
                                        title: Text(app['name']),
                                      );
                                    },
                                  ))
                                ],
                              )),
                        ],
                      ));
                } else if (snapshot.hasError) {
                  return Text(
                      'Failed to load insights data: ${snapshot.error}');
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Container(
                width: 0.95 * width,
                height: 0.4 * height,
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
                            left: 0.06 * width),
                        child: Text(
                          'Secure is your middle name! Your account is secure more than 96% of  SmartPhone users. Way to make it happen!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            top: 0.02 * height,
                            right: 0.02 * width,
                            bottom: 0.01 * height),
                        width: 0.85 * width,
                        height: 0.2 * height,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 0.01 * height,
                                right: 0.01 * width,
                                left: 0.06 * width),
                            padding: EdgeInsets.only(bottom: 0.01 * height),
                            child: Text(
                              dashno10.toString(),
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 100,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 0.01 * height,
                                right: 0.01 * width,
                                left: 0.06 * width),
                            child: Text(
                              'Unauthorised Attempts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ]))
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
