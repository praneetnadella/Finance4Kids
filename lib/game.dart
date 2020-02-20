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
        title: Text("Stock Market Game", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
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
                  showAlertDialog(context, "You cannot sell that many shares.")
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
                  showAlertDialog(context, "You cannot sell that many shares.")
                }
                else {
                  _balance = _balance - (_shares*_price),
                  _owned = _owned + _shares,
                  random(),
                }
              },
              color: Colors.orange,),
          ],),
          
          //Balance
          SizedBox(height: 50),
          Text("BALANCE: \$" + _balance.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35, fontFamily: 'Oswald'),),
        ],),
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

  showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(message),
      actions: [
        FlatButton(
          child: Text("Got It!"),
          onPressed: () { },),
      ],
    );

    CupertinoAlertDialog alertIOS = CupertinoAlertDialog(
      title: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(child: Text("Got It!"),),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return alertIOS;
        }
        else {
          return alert;
        }
      },
    );
  }
}