import 'package:flutter/material.dart';
const kBackgroundColorStyle=Color(0xFF00337C);
const kIconColor=Colors.white70;
const kCategoryColor=Colors.white24;
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 150.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Alkatra-VariableFont_wght',
  fontSize: 20.0,
  fontWeight: FontWeight.bold

);
const kMessageDescStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
);
const kTitleDesc=TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 23.0,
);
const kSubCategoryStyle=TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 18.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.white70,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldStyle=InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
      color:Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    )
);