import 'package:flutter/material.dart';
import 'Input.dart';
import 'Convert.dart';
import 'Result.dart';
import 'Riwayat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  List<String> listViewItem = List<String>();
  String _newValue = "Kelvin";
  double _result = 0;
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  TextEditingController inputController = new TextEditingController();
  var listItem = ["Kelvin", "Reamur"];

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kelvin")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
      listViewItem.add("$_newValue : $_result");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Input(inputController: inputController),
                DropdownButton<String>(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String changeValue) {
                    setState(() {
                      _newValue = changeValue;
                      perhitunganSuhu();
                    });
                  },
                ),
                Result(result: _result),
                Convert(
                  convertHandler: perhitunganSuhu,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Riwayat Konversi",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Riwayat(listViewItem: listViewItem),
                ),
              ],
            ),
          ),
        ));
  }
}
