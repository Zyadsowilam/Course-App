import 'dart:html';

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
        flexibleSpace: SafeArea(
            child: Container(
          color: Colors.blue,
          child: Row(
            children: [
              CircleAvatar(),
              Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'search',
                        hintText: 'Search Here'),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ],
          ),
        )),
      ),
      drawer: SideNav(),
      body: Container(
        width: screenwidth,
        height: screenheight,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(3),
              height: 30,
              child: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )),
          ListView.builder(
              itemCount: dummydata.product.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                    courseName: dummydata.product[index].productName,
                    enroll: true,
                    image: dummydata.product[index].image);
              })
        ]),
      ),
    );
  }
}
