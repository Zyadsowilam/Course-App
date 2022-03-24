import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String productName;
  final String image;
  final String tag;
  final VoidCallback onItemTap;
  const CustomCard(
      {required this.onItemTap,
      required this.tag,
      required this.productName,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 1 / 3,
      child: InkWell(
        onTap: onItemTap,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: Hero(
                      tag: tag, child: Image.asset(image, fit: BoxFit.fill))),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Enroll',
                            style: TextStyle(fontSize: 11, color: Colors.blue),
                          )),
                    ],
                  ),
                ),
              )
            ])),
      ),
    );
  }
}
