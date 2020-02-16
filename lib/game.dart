import 'package:finance4kids/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:math';

  //Public variables
  int _balance = 100;
  int _owned = 0;
  int _price = 0;
  int _shares = 0;
  double shares = 0.0;

class StockGame extends StatefulWidget {
  @override
  _StockGameState createState() => _StockGameState();
}

class _StockGameState extends State<StockGame> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Market Game"),
      ),
      body: Column (children: <Widget>[

          //First Text Outputs
          SizedBox(height: 70),
          Text("PRICE: \$" + _price.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
          SizedBox(height: 35),
          Text("OWNED: " + _owned.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
          SizedBox(height: 35),
          Text("SHARES: " + _shares.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, fontFamily: 'Oswald'),),
          SizedBox(height: 35),
          
          //Slider
          Container (
            width: MediaQuery.of(context).size.width * 0.9,
            child: Slider.adaptive (
            max: 20.0, min: 0.0, activeColor: Colors.orange, value: shares,
            onChanged: (double newValue) {
              setState(() {
                _shares = newValue.round();
                shares = newValue;
              });
            },),
          ),
          SizedBox(height: 20),
          
          //Buttons
          Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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

              SizedBox(width: 25),
              RaisedButton(
              child: Text("Hold", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Oswald'),), 
              onPressed: () => {
                random(),
              },
              color: Colors.orange,),
              SizedBox(width: 25),
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
          
          //
          SizedBox(height: 50),
          Text("BALANCE: \$" + _balance.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35, fontFamily: 'Oswald'),),
        ],),
         // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
  }

  //Sets random price
  void random() {
    var rng = new Random();
    setState(() {
      int rand = rng.nextInt(10);
      if (rand <= 7) {
        _price = rng.nextInt(75);
      }
      else {
        _price = rng.nextInt(100);
      }
    });
  }

  // void check() {
  //   if (_balance >= 1000) {

  //   }
  //   else if (_balance >= 1000000) {
      
  //   }
  // }
}