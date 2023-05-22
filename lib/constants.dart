import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFF4B4B);
const kTextColor = Color(0xFFFFCA26);
const kGameScreenBackgroundColor = Color.fromRGBO(96, 22, 186, 1);
const kGameScreenContainerColor = Color(0XFF6649C4);
const kLetterOColor = Color(0XFFEB1751);
const kLetterXColor = Color(0XFFFFD032);
const kSettingsBoxColor = Color(0xFF9b70e5);
const kProfileContainerColor = Color(0XFF27175D);
const kActiveCardColor = Color(0xFF9b70e5);
const kYourTurnText = TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);
const kResultText = TextStyle(color: Colors.white,fontFamily: 'Carter');
const kScoreTextStyle = TextStyle(fontSize: 28.0,color: Colors.white, fontFamily: 'Paytone');
const kSpace = Divider(height: 10.0,);
const kReusableButton = "";
const kMaxSeconds = 15;
const kG = "";
const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
  fillColor: kProfileContainerColor,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0),),
    borderSide: BorderSide.none,
  ),
  hintStyle: TextStyle(color: Colors.white),
);
const kSettingsBoxLetterStyle = TextStyle(color: Colors.white, fontFamily: 'Carter',);
const kDivider = Divider(height: 6.0, color: Colors.white, thickness: 0.5,);