import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String email = '';
  String role = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              role = value.trim();
            }
          },
        ),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  if (email.trim().isNotEmpty && role.trim().isNotEmpty) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .add({'email': email, 'role': role})
                        .then((value) => print('added user'))
                        .catchError(
                            (error) => print('therre was an error ${error}'));
                  }
                },
                child: Text('Submit')))
      ],
    ));
  }
}
