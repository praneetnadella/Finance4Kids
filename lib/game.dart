import 'package:finance4kids/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:math';

  int _balance = 100;
  int _owned = 0;

class StockGame extends StatefulWidget {
  @override
  _StockGameState createState() => _StockGameState();
}

class _StockGameState extends State<StockGame> {
  int _price = 0;
  int _shares = 0;
  double shares = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Stock Market Game"),
      ),
      body: Container (child: 
        Column (children: <Widget>[
          Text("PRICE: \$" + _price.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
          Text("OWNED: " + _owned.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
          Text("SHARES: " + _shares.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
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
              child: Text("Sell", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Oswald'),), 
              onPressed: () => {
                if (_shares > _owned) {
                  if(Platform.isIOS) {
                    CupertinoAlertDialog (actions: <Widget>[
                      CupertinoDialogAction(child: Text("Ok"),),
                      ], 
                      title: Text("You cannot sell that many shares."),),
                  }
                  else {
                    AlertDialog (actions: <Widget>[
                      FlatButton(child: Text("Ok"),),
                      ], 
                      title: Text("You cannot sell that many shares."), elevation: 24.0,),
                  }
                }
                else {
                  _balance = _balance + (_shares*_price),
                  _owned = _owned - _shares,
                  random(),
                }
              },
              color: Colors.orange,),
              RaisedButton(
              child: Text("Hold", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Oswald'),), 
              onPressed: () => {
                random(),
              },
              color: Colors.orange,),
              RaisedButton(
              child: Text("Buy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Oswald'),), 
              onPressed: () => {
                if (_shares * _price > _balance) {
                  if(Platform.isIOS) {
                    CupertinoAlertDialog (actions: <Widget>[
                      CupertinoDialogAction(child: Text("Ok"),),
                      ], 
                      title: Text("You cannot buy that many shares."),),
                  }
                  else {
                    AlertDialog (actions: <Widget>[
                      FlatButton(child: Text("Ok"),),
                      ], 
                      title: Text("You cannot buy that many shares."), elevation: 24.0,),
                  }
                }
                else {
                  _balance = _balance - (_shares*_price),
                  _owned = _owned + _shares,
                  random(),
                }
              },
              color: Colors.orange,),
          ],),
          Text("BALANCE: \$" + _balance.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35, fontFamily: 'Oswald'),),
        ],),
         // This trailing comma makes auto-formatting nicer for build methods.
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }

  void random() {
    var rng = new Random();
    setState(() {
      int rand = rng.nextInt(10);
      if (rand <= 10) {
        _price = rng.nextInt(750000000);
      }
      else {
        _price = rng.nextInt(1000);
      }
    });
  }

  void check() {
    if (_balance >= 1000) {

    }
    else if (_balance >= 1000000) {
      
    }
  }
}