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
