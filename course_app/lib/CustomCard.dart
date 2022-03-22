import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String productName;
  final String image;
  CustomCard({
    required this.productName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    double en = screenwidth * (1 / 8);
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Image.asset(image, fit: BoxFit.contain),
                ],
              )),
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () {},
                child: Container(
                  width: screenwidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Enroll',
                            style: TextStyle(fontSize: 11, color: Colors.blue),
                          )),
                    ],
                  ),
                )),
          )
        ]));
  }
}