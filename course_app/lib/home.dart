import 'package:flutter/material.dart';
import './home.dart';
import 'package:provider/provider.dart';
import 'nav.dart';
import 'card.dart';
import 'testdata.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DummyData dummydata = DummyData();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 120.10,
      title: Text('help'),
    ));
  }
}
