// ignore_for_file: prefer_const_constructors

import 'package:course_app/home.dart';
import 'package:flutter/material.dart';
import 'detailsPage.dart';
import 'home.dart';
import 'login.dart';
import 'test.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//Add your routes and providers in MaterialApp
//Build your pages in different files

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'login': (context) => Login(),
          'home': (conext) => Home(),
          'details': (context) => DetailsPage()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ),
        ),
        home: Login());
  }
}
