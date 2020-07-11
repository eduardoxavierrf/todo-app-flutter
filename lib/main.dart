import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: CheckboxList()),
    );
  }
}

class CheckboxList extends StatefulWidget {
  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  final myController = TextEditingController();
  var _checkboxList = [
    {"title": "testando", "value": false},
    {"title": "aa", "value": false},
    {"title": "testando", "value": false}
  ];

  Widget _buildCheckList() {
    return ListView.builder(
        itemCount: _checkboxList.length,
        itemBuilder: (context, i) {
          return CheckboxListTile(
            title: Text(_checkboxList[i]["title"]),
            value: _checkboxList[i]["value"],
            onChanged: (newValue) {
              setState(() {
                _checkboxList[i]["value"] = newValue;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: _buildCheckList()),
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: myController,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _checkboxList
                        .add({"title": myController.text, "value": false});
                    myController.clear();
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  });
                },
                child: Text("Inserir"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
