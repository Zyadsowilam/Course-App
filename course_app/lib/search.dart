import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    var ctrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {});
                    }),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      name = '';
                    });
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
        ),
      )),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name.isNotEmpty)
            ? FirebaseFirestore.instance
                .collection('courses')
                .where('searchtag', arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection('courses').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    return Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('details',
                                      arguments: snapshot.data!.docs[index].id);
                                },
                                child: Text(data['name'])
                                //Navigator.of(context).pushNamed('details', arguments: snapshot.data!.docs[i].id)
                                )
                          ]),
                    );
                  });
        },
      ),
    );
  }
}
