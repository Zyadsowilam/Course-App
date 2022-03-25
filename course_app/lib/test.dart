import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void signup(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseFirestore.instance
          .collection('users')
          .add({'email': email, 'role': password})
          .then((value) => print('added user'))
          .catchError((error) => print('therre was an error ${error}'));
    } catch (error) {
      print("${error.toString()}");
    }
  }

  void signin(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        print('signed in');
        Navigator.of(context).pushNamed('home');
      }
    } catch (error) {
      print('${error.toString()}');
    }
  }

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text('This is the data',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Container(
            height: 250,
            width: double.maxFinite,
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        return ListTile(
                          title: Text(snapshot.data!.docs[i]['email']),
                          subtitle: Text(snapshot.data!.docs[i]['role']),
                        );
                      });
                })),
        SizedBox(
          height: 100,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'email'),
          onChanged: (value) {
            if (value.trim().isEmpty) {
              return null;
            } else {
              email = value.trim();
            }
          },
        ),
        TextField(
          decoration: InputDecoration(hintText: 'role'),
          onChanged: (value) {
            if (value.trim().isEmpty) {
              return null;
            } else {
              password = value.trim();
            }
          },
        ),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  if (email.trim().isNotEmpty && password.trim().isNotEmpty) {
                    signin(email, password);
                  }
                },
                child: Text('Submit')))
      ],
    ));
  }
}
