// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'feedbackWidget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Widget> FeedBacks(Size size) {
    List<String> comments = [
      'comment1',
      'comment2',
      'comment3',
      'comment4',
      'comment5',
      'comment6'
    ];
    List<Widget> feedBackList = [];
    for (var i = 0; i < comments.length; i++)
      feedBackList.add(Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          height: 200,
          child: FeedBackWidget(
            comment: comments[i],
            image: 'avatar.png',
            userName: '${i}',
          )));
    return feedBackList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //first child ---------------------------------------------------------------------
                Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    width: size.width,
                    height: 300,
                    child: Image.asset('testimage.png', fit: BoxFit.fill)),
                //second child --------------------------------------------------------------------
                Container(
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //first child ---------------------------------------------------------------------
                          Text('title',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                          //second child ---------------------------------------------------------------------
                          Text('Rating'),
                          //third child ---------------------------------------------------------------------
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
                          Text('description', style: TextStyle(fontSize: 16)),
                          Divider(
                            color: Colors.grey,
                          ),
                          //fifth child ---------------------------------------------------------------------
                          Text('Comments:', style: TextStyle(fontSize: 16)),
                          Column(children: FeedBacks(size))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
