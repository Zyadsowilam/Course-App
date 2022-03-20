import 'package:flutter/material.dart';
import './home.dart';
import 'package:provider/provider.dart';
import 'nav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
