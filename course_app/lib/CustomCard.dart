import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
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
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool enrolled = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 1 / 3,
      child: InkWell(
        onTap: widget.onItemTap,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: Hero(
                      tag: widget.tag,
                      child: Image.network(widget.image, fit: BoxFit.fill))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              enrolled = !enrolled;
                            });
                          },
                          child: Text(
                            enrolled ? "Leave" : 'Enroll',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
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
