import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key, @required this.convertHandler,
  }) : super(key: key);

  final Function convertHandler; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: convertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}