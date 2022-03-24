import 'package:flutter/material.dart';
import './search.dart';
import 'Nav.dart';
import './data.dart';
import 'CustomCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DummyData dummydata = DummyData();

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Coursera'), actions: [
        IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: const Icon(Icons.search))
      ]),
      drawer: NavBar(),
      body: ListView.builder(
          itemCount: dummydata.product.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomCard(
              tag: 'courseiamge$index',
              productName: dummydata.product[index].productName,
              image: 'testimage.png',
              onItemTap: () {
                Navigator.of(context).pushNamed('details', arguments: index);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        tooltip: 'Add Course',
        hoverColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
