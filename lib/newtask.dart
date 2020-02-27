import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String name = '';
  TextEditingController namectrl = new TextEditingController();
  String price = '';
  TextEditingController pricectrl = new TextEditingController();

  String date;
  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext ctx) async {
    final DateTime picked = await showDatePicker(
        context: ctx,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        date = _date.toString();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Log",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Container(
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
              onSubmitted: (String text) {
                setState(() {
                  namectrl.dispose();
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
              onSubmitted: (String text) {
                setState(() {
                  pricectrl.clear();
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
            )
          ],
        ),
      ),
    );
  }
}
