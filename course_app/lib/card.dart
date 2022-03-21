import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool enroll;
  final courseName;
  final Image image;
  final Function onpre;
  const CustomCard(
      {required this.courseName,
      required this.enroll,
      required this.image,
      required this.onpre});
  //const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      child: Padding(padding: EdgeInsets.all(10)),
    );
  }
}
