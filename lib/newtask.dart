import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Your Finances", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
      ), 
      body: Container(child: 
        Column (children: <Widget>[
        
        ],),
      ),
    );
  }
}