// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

// this is a custom widget for the comment bubble in feedback tab
class FeedBackWidget extends StatelessWidget {
  final String userName;
  final String comment;
  final String image;
  const FeedBackWidget(
      {required this.comment,
      required this.image,
      required this.userName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(children: [
          Row(children: [
            //this container is for the circle avatar image
            Container(
              margin: EdgeInsets.all(7),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill)),
            ),
            SizedBox(width: 10),
            Text(userName)
          ]),
          Text(comment)
        ]),
      )),
    );
  }
}
