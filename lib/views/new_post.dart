import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Dialog(
      child: new Column(
        children: <Widget>[
          new SimpleDialogOption(
            child: new Text("Testing"),
            onPressed: () {
              print("Pressed");
            }
          )
        ],
      ),
    );
  }
}
