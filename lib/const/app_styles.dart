import 'package:country_app/const/app_colors.dart';
import 'package:flutter/material.dart';

final boldText =
    TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400);
final discrstyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontSize: 16,
    fontWeight: FontWeight.w400);

final btntext =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
final backbuttntext =
    TextStyle(color: orange, fontSize: 16, fontWeight: FontWeight.w400);

final itemstyle =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: orange);

final textfieldDecoration = InputDecoration(
    hintStyle:
        TextStyle(fontSize: 16, color: Color(0xffF8FAFE).withOpacity(0.4)),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
    fillColor: darkblue,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15));
