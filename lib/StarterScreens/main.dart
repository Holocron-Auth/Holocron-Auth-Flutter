//Main Code for Holocron Auth

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
// import  'package:starter.dart';
import 'starter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('JWT', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InBlbmR5YWxhMjAwOTZAaWlpdGQuYWMuaW4iLCJwaG9uZSI6Ijk1MDI1NDY4NjAiLCJpZCI6ImNsZ3pkY2lvZTAwMDZiNGFsYWE4eDM3YTgiLCJuYW1lIjoiUml0dmlrIFBlbmR5YWxhIiwicGhvbmVWZXJpZmllZCI6IjIwMjMtMDQtMjdUMTY6NTg6MTguNjM2WiIsImVtYWlsVmVyaWZpZWQiOm51bGwsImltYWdlIjoiL2RlZmF1bHQuanBnIiwiaWF0IjoxNjgyNjIzODg3LCJleHAiOjE2ODMyMjg2ODd9.RrnkYNlpEliyCVe052qUgad5w5MUpp4MlCEOVc4O2BU");
  String? jwt = prefs.getString('JWT');
  print("Here's the token");
  print(jwt);
  runApp(MyApp(jwt: jwt));
}

class MyApp extends StatelessWidget {
  final String? jwt;

  const MyApp({required this.jwt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(jwt);

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
