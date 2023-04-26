// // // // // // import 'package:flutter/material.dart';
// // // // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:holocron_Auth_Flutter/lib/starter.dart';
// // // //
// // // // void main() {
// // // //   runApp(const Homepage());
// // // // }
// // // // // //
// // // // // // class MyApp extends StatelessWidget {
// // // // // //   const MyApp({super.key});
// // // // // //
// // // // // //   // This widget is the root of your application.
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return MaterialApp(
// // // // // //       title: 'Flutter Demo',
// // // // // //       theme: ThemeData(
// // // // // //         primarySwatch: Colors.blue,
// // // // // //       ),
// // // // // //       debugShowCheckedModeBanner: false,
// // // // // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // //
// // // // // // class MyHomePage extends StatefulWidget {
// // // // // //   const MyHomePage({super.key, required this.title});
// // // // // //
// // // // // //   final String title;
// // // // // //
// // // // // //   @override
// // // // // //   State<MyHomePage> createState() => _MyHomePageState();
// // // // // // }
// // // // // //
// // // // // // class _MyHomePageState extends State<MyHomePage> {
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       //add hex code background color
// // // // // //       backgroundColor: Color(0xff211D1D),
// // // // // //       // backgroundColor: Colors.black,
// // // // // //       body: Container(
// // // // // //         // color: Colors.black,
// // // // // //
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: <Widget>[
// // // // // //             //add a title to the app
// // // // // //             Container(
// // // // // //               padding: const EdgeInsets.only(left: 15),
// // // // // //               child: Text('Holocron Auth',
// // // // // //                   style: TextStyle(
// // // // // //                     color: Color(0xFFFFB267),
// // // // // //                     fontSize: 60,
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                   )),
// // // // // //             ),
// // // // // //             Container(
// // // // // //               padding: const EdgeInsets.only(left: 10),
// // // // // //               child: Text('Coming Soon!!...',
// // // // // //                   style: TextStyle(
// // // // // //                     color: Color(0xFFFFB267),
// // // // // //                     fontSize: 30,
// // // // // //                     fontWeight: FontWeight.normal,
// // // // // //                   )),
// // // // // //             )
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // //
// // // // // /* This is free and unencumbered software released into the public domain. */
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:model_viewer_plus/model_viewer_plus.dart';
// // // // //
// // // // // void main() => runApp(MyApp());
// // // // //
// // // // // class MyApp extends StatelessWidget {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return MaterialApp(
// // // // //       home: Scaffold(
// // // // //         appBar: AppBar(title: Text("Holocron Auth", style: TextStyle(fontSize:30,)), backgroundColor: Colors.black,),
// // // // //         body: ModelViewer(
// // // // //           backgroundColor: Colors.black,
// // // // //           src: 'assets/jedi_holocron.glb', // a bundled asset file
// // // // //           alt: "Holocron",
// // // // //           // ar: true,
// // // // //           // arModes: ['scene-viewer', 'webxr', 'quick-look'],
// // // // //           // autoRotate: true,
// // // // //           cameraControls: true,
// // // // //           // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
// // // // //           disableZoom: true,
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:model_viewer_plus/model_viewer_plus.dart';
// // // // //
// // // // // class MyModelViewer extends StatefulWidget {
// // // // //   @override
// // // // //   _MyModelViewerState createState() => _MyModelViewerState();
// // // // // }
// // // // //
// // // // // class _MyModelViewerState extends State<MyModelViewer> {
// // // // //   ModelViewerPlusController _controller;
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return ModelViewerPlus(
// // // // //       src: 'assets/jedi_holocron.glb',
// // // // //       onModelLoaded: (controller) {
// // // // //         _controller = controller;
// // // // //         _controller.setSurfaceListener(_handleSurfaceClick);
// // // // //       },
// // // // //     );
// // // // //   }
// // // // //
// // // // //   void _handleSurfaceClick(int index) {
// // // // //     // Handle surface click
// // // // //   }
// // // // // }
// // //
// // //
// // // import 'package:flutter/material.dart';
// // //
// // // void main() {
// // //   runApp(Homepage());
// // // }
// // //
// // // class Homepage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         backgroundColor: Colors.black,
// // //         body: Container(
// // //           decoration: BoxDecoration(
// // //             image: DecorationImage(
// // //               image: AssetImage('assets/image 9.png'),
// // //               fit: BoxFit.cover,
// // //             ),
// // //           ),
// // //         );
// // //     );
// // //   }
// // // }
// //
// import 'package:flutter/material.dart';
// // import  'package:starter.dart';
//
//
// import 'starter.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Holocron OAuth',
//       home: StarterScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         inputDecorationTheme: const InputDecorationTheme(),
//         textTheme: TextTheme(subtitle1: TextStyle(color: Colors.orange)),
//         ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
//
//
// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// // ignore_for_file: public_member_api_docs, avoid_print
//
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:local_auth/local_auth.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   final LocalAuthentication auth = LocalAuthentication();
// //   _SupportState _supportState = _SupportState.unknown;
// //   bool? _canCheckBiometrics;
// //   List<BiometricType>? _availableBiometrics;
// //   String _authorized = 'Not Authorized';
// //   bool _isAuthenticating = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     auth.isDeviceSupported().then(
// //           (bool isSupported) => setState(() => _supportState = isSupported
// //           ? _SupportState.supported
// //           : _SupportState.unsupported),
// //     );
// //   }
// //
// //   Future<void> _checkBiometrics() async {
// //     late bool canCheckBiometrics;
// //     try {
// //       canCheckBiometrics = await auth.canCheckBiometrics;
// //     } on PlatformException catch (e) {
// //       canCheckBiometrics = false;
// //       print(e);
// //     }
// //     if (!mounted) {
// //       return;
// //     }
// //
// //     setState(() {
// //       _canCheckBiometrics = canCheckBiometrics;
// //     });
// //   }
// //
// //   Future<void> _getAvailableBiometrics() async {
// //     late List<BiometricType> availableBiometrics;
// //     try {
// //       availableBiometrics = await auth.getAvailableBiometrics();
// //     } on PlatformException catch (e) {
// //       availableBiometrics = <BiometricType>[];
// //       print(e);
// //     }
// //     if (!mounted) {
// //       return;
// //     }
// //
// //     setState(() {
// //       _availableBiometrics = availableBiometrics;
// //     });
// //   }
// //
// //   Future<void> _authenticate() async {
// //     bool authenticated = false;
// //     try {
// //       setState(() {
// //         _isAuthenticating = true;
// //         _authorized = 'Authenticating';
// //       });
// //       authenticated = await auth.authenticate(
// //         localizedReason: 'Let OS determine authentication method',
// //         options: const AuthenticationOptions(
// //           stickyAuth: true,
// //         ),
// //       );
// //       setState(() {
// //         _isAuthenticating = false;
// //       });
// //     } on PlatformException catch (e) {
// //       print(e);
// //       setState(() {
// //         _isAuthenticating = false;
// //         _authorized = 'Error - ${e.message}';
// //       });
// //       return;
// //     }
// //     if (!mounted) {
// //       return;
// //     }
// //
// //     setState(
// //             () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
// //   }
// //
// //   Future<void> _authenticateWithBiometrics() async {
// //     bool authenticated = false;
// //     try {
// //       setState(() {
// //         _isAuthenticating = true;
// //         _authorized = 'Authenticating';
// //       });
// //       authenticated = await auth.authenticate(
// //         localizedReason:
// //         'Scan your fingerprint (or face or whatever) to authenticate',
// //         options: const AuthenticationOptions(
// //           stickyAuth: true,
// //           biometricOnly: true,
// //         ),
// //       );
// //       setState(() {
// //         _isAuthenticating = false;
// //         _authorized = 'Authenticating';
// //       });
// //     } on PlatformException catch (e) {
// //       print(e);
// //       setState(() {
// //         _isAuthenticating = false;
// //         _authorized = 'Error - ${e.message}';
// //       });
// //       return;
// //     }
// //     if (!mounted) {
// //       return;
// //     }
// //
// //     final String message = authenticated ? 'Authorized' : 'Not Authorized';
// //     setState(() {
// //       _authorized = message;
// //     });
// //   }
// //
// //   Future<void> _cancelAuthentication() async {
// //     await auth.stopAuthentication();
// //     setState(() => _isAuthenticating = false);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Plugin example app'),
// //         ),
// //         body: ListView(
// //           padding: const EdgeInsets.only(top: 30),
// //           children: <Widget>[
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 if (_supportState == _SupportState.unknown)
// //                   const CircularProgressIndicator()
// //                 else if (_supportState == _SupportState.supported)
// //                   const Text('This device is supported')
// //                 else
// //                   const Text('This device is not supported'),
// //                 const Divider(height: 100),
// //                 Text('Can check biometrics: $_canCheckBiometrics\n'),
// //                 ElevatedButton(
// //                   onPressed: _checkBiometrics,
// //                   child: const Text('Check biometrics'),
// //                 ),
// //                 const Divider(height: 100),
// //                 Text('Available biometrics: $_availableBiometrics\n'),
// //                 ElevatedButton(
// //                   onPressed: _getAvailableBiometrics,
// //                   child: const Text('Get available biometrics'),
// //                 ),
// //                 const Divider(height: 100),
// //                 Text('Current State: $_authorized\n'),
// //                 if (_isAuthenticating)
// //                   ElevatedButton(
// //                     onPressed: _cancelAuthentication,
// //                     // TODO(goderbauer): Make this const when this package requires Flutter 3.8 or later.
// //                     // ignore: prefer_const_constructors
// //                     child: Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: const <Widget>[
// //                         Text('Cancel Authentication'),
// //                         Icon(Icons.cancel),
// //                       ],
// //                     ),
// //                   )
// //                 else
// //                   Column(
// //                     children: <Widget>[
// //                       ElevatedButton(
// //                         onPressed: _authenticate,
// //                         // TODO(goderbauer): Make this const when this package requires Flutter 3.8 or later.
// //                         // ignore: prefer_const_constructors
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: const <Widget>[
// //                             Text('Authenticate'),
// //                             Icon(Icons.perm_device_information),
// //                           ],
// //                         ),
// //                       ),
// //                       ElevatedButton(
// //                         onPressed: _authenticateWithBiometrics,
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: <Widget>[
// //                             Text(_isAuthenticating
// //                                 ? 'Cancel'
// //                                 : 'Authenticate: biometrics only'),
// //                             const Icon(Icons.fingerprint),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // enum _SupportState {
// //   unknown,
// //   supported,
// //   unsupported,
// // }

// // // // import 'package:flutter/material.dart';
// // // //
// // import 'package:flutter/material.dart';
// // import 'package:holocron_Auth_Flutter/lib/starter.dart';
// //
// // void main() {
// //   runApp(const Homepage());
// // }
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   const MyApp({super.key});
// // // //
// // // //   // This widget is the root of your application.
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Flutter Demo',
// // // //       theme: ThemeData(
// // // //         primarySwatch: Colors.blue,
// // // //       ),
// // // //       debugShowCheckedModeBanner: false,
// // // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class MyHomePage extends StatefulWidget {
// // // //   const MyHomePage({super.key, required this.title});
// // // //
// // // //   final String title;
// // // //
// // // //   @override
// // // //   State<MyHomePage> createState() => _MyHomePageState();
// // // // }
// // // //
// // // // class _MyHomePageState extends State<MyHomePage> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       //add hex code background color
// // // //       backgroundColor: Color(0xff211D1D),
// // // //       // backgroundColor: Colors.black,
// // // //       body: Container(
// // // //         // color: Colors.black,
// // // //
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             //add a title to the app
// // // //             Container(
// // // //               padding: const EdgeInsets.only(left: 15),
// // // //               child: Text('Holocron Auth',
// // // //                   style: TextStyle(
// // // //                     color: Color(0xFFFFB267),
// // // //                     fontSize: 60,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   )),
// // // //             ),
// // // //             Container(
// // // //               padding: const EdgeInsets.only(left: 10),
// // // //               child: Text('Coming Soon!!...',
// // // //                   style: TextStyle(
// // // //                     color: Color(0xFFFFB267),
// // // //                     fontSize: 30,
// // // //                     fontWeight: FontWeight.normal,
// // // //                   )),
// // // //             )
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // // /* This is free and unencumbered software released into the public domain. */
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:model_viewer_plus/model_viewer_plus.dart';
// // //
// // // void main() => runApp(MyApp());
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(title: Text("Holocron Auth", style: TextStyle(fontSize:30,)), backgroundColor: Colors.black,),
// // //         body: ModelViewer(
// // //           backgroundColor: Colors.black,
// // //           src: 'assets/jedi_holocron.glb', // a bundled asset file
// // //           alt: "Holocron",
// // //           // ar: true,
// // //           // arModes: ['scene-viewer', 'webxr', 'quick-look'],
// // //           // autoRotate: true,
// // //           cameraControls: true,
// // //           // iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
// // //           disableZoom: true,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:model_viewer_plus/model_viewer_plus.dart';
// // //
// // // class MyModelViewer extends StatefulWidget {
// // //   @override
// // //   _MyModelViewerState createState() => _MyModelViewerState();
// // // }
// // //
// // // class _MyModelViewerState extends State<MyModelViewer> {
// // //   ModelViewerPlusController _controller;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ModelViewerPlus(
// // //       src: 'assets/jedi_holocron.glb',
// // //       onModelLoaded: (controller) {
// // //         _controller = controller;
// // //         _controller.setSurfaceListener(_handleSurfaceClick);
// // //       },
// // //     );
// // //   }
// // //
// // //   void _handleSurfaceClick(int index) {
// // //     // Handle surface click
// // //   }
// // // }
//
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(Homepage());
// }
//
// class Homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/image 9.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//     );
//   }
// }


//Main Code for Holocron Auth




import 'package:flutter/material.dart';
// import  'package:starter.dart';
import 'starter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holocron OAuth',
      home: StarterScreen(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        inputDecorationTheme: const InputDecorationTheme(),
        textTheme: TextTheme(subtitle1: TextStyle(color: Colors.orange)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}






//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_number/mobile_number.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _mobileNumber = '';
//   List<SimCard> _simCard = <SimCard>[];
//
//   @override
//   void initState() {
//     super.initState();
//     MobileNumber.listenPhonePermission((isPermissionGranted) {
//       if (isPermissionGranted) {
//         initMobileNumberState();
//       } else {}
//     });
//
//     initMobileNumberState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initMobileNumberState() async {
//     if (!await MobileNumber.hasPhonePermission) {
//       await MobileNumber.requestPhonePermission;
//       return;
//     }
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       _mobileNumber = (await MobileNumber.mobileNumber)!;
//       _simCard = (await MobileNumber.getSimCards)!;
//     } on PlatformException catch (e) {
//       debugPrint("Failed to get mobile number because of '${e.message}'");
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {});
//   }
//
//   // Widget fillCards() {
//   //   List<Widget> widgets = _simCard
//   //       .map((SimCard sim) => Text(
//   //       'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
//   //       .toList();
//   //   return Column(children: widgets);
//   // }
//   Future<List<Map<String, String>>> getSimCardData() async {
//     List<SimCard> simCards = await MobileNumber.getSimCards;
//     List<Map<String, String>> simCardData = [];


//
//     for (SimCard sim in simCards) {
//       simCardData.add({
//         'simCardNumber': '${sim.countryPhonePrefix} - ${sim.number}',
//         'carrierName': sim.carrierName,
//         'countryIso': sim.countryIso,
//         'displayName': sim.displayName,
//         'simSlotIndex': sim.slotIndex.toString(),
//       });
//     }
//
//     return simCardData;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Text('Running on: $_mobileNumber\n'),
//
//               // fillCards()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//
// import 'dart:async';
// import '../example.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_number/mobile_number.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _mobileNumber = '';
//   List<SimCard> _simCard = <SimCard>[];
//
//   @override
//   void initState() {
//     super.initState();
//     MobileNumber.listenPhonePermission((isPermissionGranted) {
//       if (isPermissionGranted) {
//         initMobileNumberState();
//       } else {}
//     });
//
//     initMobileNumberState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initMobileNumberState() async {
//     if (!await MobileNumber.hasPhonePermission) {
//       await MobileNumber.requestPhonePermission;
//       return;
//     }
//     String mobileNumber = '';
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       mobileNumber = (await MobileNumber.mobileNumber)!;
//       _simCard = (await MobileNumber.getSimCards)!;
//     } on PlatformException catch (e) {
//       debugPrint("Failed to get mobile number because of '${e.message}'");
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _mobileNumber = mobileNumber;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Text('Running on: $_mobileNumber\n'),
//               ElevatedButton(
//                   onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> Example(number: _mobileNumber,)));
//                   },
//                   child: const Text('Get available biometrics'),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }