import 'package:flutter/material.dart';
import './search.dart';
import 'Nav.dart';
import './data.dart';
import 'CustomCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DummyData dummydata = DummyData();
  var data = FirebaseFirestore.instance.collection('courses').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiCourse'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: const Icon(Icons.search))
      ]),
      drawer: NavBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: data,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator()));
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  return CustomCard(
                      onItemTap: () {
                        Navigator.of(context).pushNamed('details',
                            arguments: snapshot.data!.docs[i].id);
                      },
                      tag: snapshot.data!.docs[i]['image'],
                      productName: snapshot.data!.docs[i]['name'],
                      image: snapshot.data!.docs[i]['image']);
                });
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        tooltip: 'Add Course',
        hoverColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
