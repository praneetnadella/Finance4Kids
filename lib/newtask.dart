import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  List<String> entries = [];

  String entry;

  String name = '';
  TextEditingController namectrl = TextEditingController();

  String price = '';
  TextEditingController pricectrl = TextEditingController();

  DateTime _date = DateTime.now();
  String  date;

  Future<Null> selectDate(BuildContext ctx) async {
    final DateTime picked = await showDatePicker(
        context: ctx,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        date = _date.toString().substring(0,10);
      });
    }
  }

  String category;
  List<String> _categories = [
    'Food',
    'Groceries',
    'Clothes',
    'Toys',
    'Gifts',
    'Other'
  ];
  List<DropdownMenuItem<String>> _dropDownItems;

  @override
  void initState() {
    _dropDownItems = buildDropdownMenuItems(_categories);
    category = _dropDownItems[0].value;
    date = _date.toString().substring(0,10);
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List categories) {
    List<DropdownMenuItem<String>> items = List();
    for (String category in categories) {
      items.add(DropdownMenuItem(value: category, child: Text(category)));
    }

    return items;
  }

  onChangeDropdown(String cat) {
    setState(() {
      category = cat;
    });
  }

  addExpense() {
    setState(() {
      entry = name + "," + price + "," + date + "," + category;
      print(entry);
      entries.add(entry);
      Toast.show("Expense Added", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      namectrl.clear();
      pricectrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log Expenses",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: 
          MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            TextField(
              controller: namectrl,
              decoration: new InputDecoration.collapsed(hintText: "Name"),
              onChanged: (String text) {
                setState(() {
                  name = text;
                });
              },
            ),
            Text(
              "Price",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            TextField(
              controller: pricectrl,
              decoration: new InputDecoration.collapsed(hintText: "Price(\$)"),
              onChanged: (String text) {
                setState(() {
                  price = text;
                });
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                "Select Date",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                selectDate(context);
              },
            ),
            Text("Selected date: " + date, style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Select a category",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 20.0),
            DropdownButton(
              value: category,
              items: _dropDownItems,
              onChanged: onChangeDropdown,
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                "Add Expense",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                addExpense();
              },
            ),
          ],
        ),
      ),
    );
  }
}
