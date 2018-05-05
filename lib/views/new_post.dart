import 'package:flutter/material.dart';

// class NewPost extends StatefulWidget {
//   NewPost({Key key}) : super(key: key);
//   @override
//   createState() => new NewPostState();
// }

// class NewPostState extends State<NewPost> {
  class NewPost extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Post"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.done),
            onPressed: () {
              print("Nothing for now");
            },
          )
        ],
      ),
      body: new Center(child: new Text("Hello There")),
    );
  }
}
