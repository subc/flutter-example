import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

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

class ChatScreenState extends State<ChatScreen> {
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
    print(11111);
    _textController.clear();
//    本来のボタン押したらList追加される処理
//    ChatMessage message = new ChatMessage(
//      text: text,
//    );
//    setState(() {
//      _messages.insert(0, message);
//    });

    // 独自実装 非同期でデータ取得してリスト表示
    print(22222);
    loadData();
  }

  void loadData() async {
    var httpClient = new HttpClient();
    var uri = new Uri.https('api.syosetu.com', '/novelapi/api/', {'out': 'json'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();

    // json parse
    List parsedList = JSON.decode(responseBody);
    print(parsedList);
    for (var novel in parsedList) {
      if(novel.containsKey('title')){
        print(novel['title']);
        ChatMessage message = new ChatMessage(
          lavel: novel['title'],
          text: novel['writer']
        );
        setState(() {
          _messages.insert(0, message);
        });
      }
    }
  }
}
class ChatMessage extends StatelessWidget {
  ChatMessage({this.lavel, this.text});
  final String text;
  final String lavel;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(lavel[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(lavel, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
