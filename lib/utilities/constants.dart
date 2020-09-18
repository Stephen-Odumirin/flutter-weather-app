import 'package:flutter/material.dart';

const kText = TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold);
const kTemp = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);
const kMedium = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
const kNormalText2 = TextStyle(fontSize: 20.0, color: Colors.white);
const kNormalText = TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal);

const kTempTextStyle = TextStyle(
  fontSize: 64.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 32.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 32.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 64.0,
);

const kDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.search,
      color: Colors.white,
      size: 32.0,
    ),
    hintText: 'Enter City Name ',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    ));
