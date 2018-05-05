import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget{

  final test;

  DetailsView({Key key, this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Details Page"),
        ),
        body: new Text(this.test["name"])
    );
  }
}
