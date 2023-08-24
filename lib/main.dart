import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo APP"),
      ),
      body: Window(),
    );
  }
}

class Window extends StatefulWidget {
  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  TextEditingController tD =
      TextEditingController(); //text field den gelen metni alması için
  List newList = []; //boş liste

  addFunc() {
    setState(() {
      newList.add(tD.text);
      tD.clear();
    });
  }

  removeFunc() {
    setState(() {
      newList.remove(tD.text);
      tD.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: newList.length, //liste nin uzunluğu
              itemBuilder: (context, Num) => ListTile(
                title: Text(newList[Num]),
              ),
            ),
          ), // liste görünümünü oluşturmayı sağlayacak
          Textfield(
            controller: tD,
          ),
          RaisedButton(
            onPressed: addFunc,
            child: Text("ADD"),
          ),
          RaisedButton(
            onPressed: removeFunc,
            clild: Text("DELETE"),
          ),
        ],
      ),
    );
  }
}
