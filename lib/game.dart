import 'package:finance4kids/main.dart';
import 'package:flutter/material.dart';



class StockGame extends StatefulWidget {
  @override
  _StockGameState createState() => _StockGameState();
}

class _StockGameState extends State<StockGame> {
  int _price = 0;
  int _owned = 0;
  int _shares = 0;
  int _balance = 100;
  double shares = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Stock Market Game"),
      ),
      body: Column (children: <Widget>[
        Text("PRICE: \$" + _price.toString(),
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 35, fontFamily: 'Oswald'),),
        Text("OWNED: " + _owned.toString()),
        Text("SHARES: " + _shares.toString()),
        Slider.adaptive (
          max: 20.0, min: 0.0, activeColor: Colors.orange, value: shares,
          onChanged: (double newValue) {
            setState(() {
              _shares = newValue.round();
              shares = newValue;
            });
          },),
        Row (children: <Widget>[
          RaisedButton(
            child: Text("Sell", style: TextStyle(color: Colors.white),), 
            onPressed: () => {
            },
            color: Colors.orange,)
        ],),
        Text("BALANCE: \$" + _price.toString()),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.pop(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}