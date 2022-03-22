import 'package:course_app/home.dart';
import 'package:flutter/material.dart';
import 'detailsPage.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

//Add your routes and providers in MaterialApp
//Build your pages in different files

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          ),
        ),
        home: Home());
  }
}
