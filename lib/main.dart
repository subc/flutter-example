import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(new FriendlychatApp());
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "novels",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Novels")
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 10.0),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: "synchronize"),
              )
            ),
            new Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
            )
          ],
        )
      ),
    );
  }
  void _handleSubmitted(String text) {
    _textController.clear();
    // 独自実装 非同期でデータ取得してリスト表示
    loadData();
  }

  void loadData() async {
    HttpClient httpClient = new HttpClient();
    Uri uri = new Uri.https('api.syosetu.com', '/novelapi/api/', {'out': 'json'});
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(UTF8.decoder).join();

    // json parse
    List parsedList = JSON.decode(responseBody);
    print(parsedList);

    for (Map novel in parsedList) {
      if(novel.containsKey('title')){
        print(novel['title']);
        ChatMessage message = new ChatMessage(
          novel: novel,
          animationController: new AnimationController(
            duration: new Duration(milliseconds: 100),
            vsync: this,
          ),
        );
        setState(() {
          _messages.insert(0, message);
        });
        message.animationController.forward();
      }
    }
  }
  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
class ChatMessage extends StatelessWidget {
  ChatMessage({this.novel, this.animationController});
  final Map novel;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(novel['general_all_no'].toString())),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(novel['title'], style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(novel['writer']),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
