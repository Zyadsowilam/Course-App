import 'package:flutter/material.dart';

class FeedBackWidget extends StatelessWidget {
  final String userName;
  final String comment;
  final String image;
  FeedBackWidget(
      {required this.comment,
      required this.image,
      required this.userName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Row(children: [
          Container(
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
    ));
  }
}
