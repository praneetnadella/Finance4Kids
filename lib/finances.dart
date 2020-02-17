import 'package:flutter/material.dart';
import 'package:finance4kids/newtask.dart';

class Finances extends StatefulWidget {
  @override
  _FinancesState createState() => _FinancesState();
}

class _FinancesState extends State<Finances> {
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTask()),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
      ),
    );
    
  }
}