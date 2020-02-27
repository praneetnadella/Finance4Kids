import 'package:finance4kids/newtask.dart';

import 'game.dart';
import 'loginscreen.dart';
import 'newuser.dart';
import 'home.dart';


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance4Kids',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Finance4Kids'),
      routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(title: 'Home'),
          '/game': (BuildContext context) => StockGame(),
          '/login': (BuildContext context) => LoginScreen(),
          '/register': (BuildContext context) => RegisterScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RaisedButton(child: Text("Manage Your Finances"), onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Finances()),
            //   );

            // },),
            RaisedButton(child: Text("Play The Game"), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockGame()),
              );
            },),
            RaisedButton(child: Text("Finance input"), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTask()),
              );
            },),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
