import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add hex code background color
      backgroundColor: Color(0xff211D1D),
      // backgroundColor: Colors.black,
      body: Container(
        // color: Colors.black,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //add a title to the app
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Holocron Auth',
                  style: TextStyle(
                    color: Color(0xFFFFB267),
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Coming Soon!!...',
                  style: TextStyle(
                    color: Color(0xFFFFB267),
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
