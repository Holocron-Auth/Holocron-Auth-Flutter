//Main Code for Holocron Auth

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
// import  'package:starter.dart';
import 'starter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../home.dart';
// void main() => runApp(
//
//     MyApp()
// );

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   print("Heres the token");
//   print(prefs.getString('jwt'));
//   runApp(MyApp(jwt:prefs.getString('jwt') ?? ''));
// }
// class MyApp extends StatelessWidget {
//   final String jwt;
//   const MyApp({
//     required this.jwt,
//     Key? key,
//
// }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Holocron OAuth',
//       // home: StarterScreen(),
//       home: (JwtDecoder.isExpired(jwt))? homeScreen1(jwt:jwt):StarterScreen(),
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         inputDecorationTheme: const InputDecorationTheme(),
//         textTheme: TextTheme(subtitle1: TextStyle(color: Colors.orange)),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwt = prefs.getString('jwt');
  print("Here's the token");
  print(jwt);
  runApp(MyApp(jwt: jwt));
}

class MyApp extends StatelessWidget {
  final String? jwt;

  const MyApp({required this.jwt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (jwt == null || JwtDecoder.isExpired(jwt!)) {
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
    } else {
      return MaterialApp(
        title: 'Holocron OAuth',
        home: homeScreen1(jwt: jwt!),
        theme: ThemeData(
          primarySwatch: Colors.orange,
          inputDecorationTheme: const InputDecorationTheme(),
          textTheme: TextTheme(subtitle1: TextStyle(color: Colors.orange)),
        ),
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
