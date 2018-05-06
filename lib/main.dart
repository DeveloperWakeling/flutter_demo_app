import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './views/video_cell.dart';
import './views/details.dart';
import './views/new_post.dart';

void main() => runApp(
  new MaterialApp(
    title: "Navigation Please Fucking Work",
    home: new RealWorldApp(),
  )
);

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  //Private Variable
  var _isLoading = true;
  var videos;

  _fetchData() async {
    final url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);

      final map = json.decode(response.body);
      final videosJson = map["videos"];

      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Real World App Bar"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _fetchData();
            },
          )
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.videos != null ? this.videos.length : 0,
                itemBuilder: (context, i) {
                  final video = this.videos[i];
                  return new FlatButton(
                      padding: new EdgeInsets.all(0.0),
                      child: new VideoCell(video),
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new DetailsView(test: video)),
                        );
                      });
                },
              ),
      ),
      floatingActionButton: new RaisedButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new NewPost()));
          }),
    );
  }
}
