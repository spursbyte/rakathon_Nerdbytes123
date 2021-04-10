
import 'package:flutter/material.dart';

class DoubtPage extends StatefulWidget {
  final String img;
  DoubtPage({@required this.img});
  @override
  _DoubtPageState createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Doubt Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Image.network(widget.img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
