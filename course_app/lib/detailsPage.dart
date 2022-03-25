// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'feedbackWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //this is a function for adding the comments in a list to be shown in the page

  String comment = '';
  TextEditingController commentctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String docid = ModalRoute.of(context)!.settings.arguments as String;
    var coursedata =
        FirebaseFirestore.instance.collection('courses').doc(docid).snapshots();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: [
            StreamBuilder(
                stream: coursedata,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  return Column(
                    children: [
                      //the image ---------------------------------------------------------------------
                      Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          width: size.width,
                          height: size.height * 2 / 5,
                          child: Hero(
                              tag: snapshot.data['image'].toString(),
                              child: Image.network(
                                  snapshot.data['image'].toString(),
                                  fit: BoxFit.fill))),
                      //the page content --------------------------------------------------------------------
                      Container(
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //first child ---------------------------------------------------------------------
                                Text(snapshot.data['name'].toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                //second child ---------------------------------------------------------------------
                                Text('999.99\$'),
                                Text(snapshot.data['description'].toString(),
                                    style: TextStyle(fontSize: 16)),

                                //third child(buttons) ---------------------------------------------------------------------
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.download_sharp),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.thumb_up_alt_outlined),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.thumb_down_alt_outlined),
                                    )
                                  ],
                                ),
                                //forth child ---------------------------------------------------------------------
                                Container(
                                  child: TabBar(
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey,
                                      indicatorColor: Colors.black,
                                      tabs: const [
                                        Tab(
                                          text: 'OverView',
                                        ),
                                        Tab(
                                          text: 'FeedBack',
                                        ),
                                      ]),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ))
                    ],
                  );
                }),
            //fifth child (the tab bar view)---------------------------------------------------------------------
            Container(
              height: size.height * 0.8,
              width: double.maxFinite,
              child: TabBarView(children: [
                Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('courses/$docid/comments')
                        .snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot<QuerySnapshot> s) {
                      if (s.hasData) {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: s.data!.docs.length,
                                  itemBuilder: (BuildContext context, i) {
                                    return FeedBackWidget(
                                        comment: s.data!.docs[i]['comment'],
                                        image: 'avatar.png',
                                        userName: 'user ${i + 1}');
                                  }),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                icon: IconButton(
                                    icon: Icon(Icons.send_rounded),
                                    onPressed: () {
                                      if (comment.trim().isNotEmpty) {
                                        FirebaseFirestore.instance
                                            .collection(
                                                'courses/$docid/comments')
                                            .add({'comment': comment})
                                            .then((value) =>
                                                print('added comment'))
                                            .catchError((error) => print(
                                                'therre was an error $error'));
                                        setState(() {
                                          commentctrl.clear();
                                          comment = '';
                                        });
                                      }
                                    }),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'Comment...',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  comment = value;
                                });
                              },
                              controller: commentctrl,
                            )
                          ],
                        );
                      } else {
                        return Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator()));
                      }
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
