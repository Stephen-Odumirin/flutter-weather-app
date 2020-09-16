import 'package:flutter/material.dart';

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
    icon: Icon(Icons.location_city,color: Colors.white,),
    hintText: 'Enter City Name ',
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0),),borderSide: BorderSide.none,
    )
);
