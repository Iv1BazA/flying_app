import 'dart:math';

import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:country_app/screens/add_item2_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Add1Widget extends StatefulWidget {
  const Add1Widget({super.key});

  @override
  State<Add1Widget> createState() => _Add1WidgetState();
}

class _Add1WidgetState extends State<Add1Widget> {
  int currentIndex = -1;
  String mainTitle = '';

  final where = TextEditingController();
  final when = TextEditingController();
  final budget = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: orange,
                        ),
                        Text('Back', style: backbuttntext),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'New travel',
              style: boldText,
            ),
            SizedBox(height: 7),
            Text(
              'When',
              style: discrstyle,
            ),
            SizedBox(height: 7),
            Container(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: when,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white),
                decoration: textfieldDecoration,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Where',
              style: discrstyle,
            ),
            SizedBox(height: 7),
            Container(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: where,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white),
                decoration: textfieldDecoration,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Budget',
              style: discrstyle,
            ),
            SizedBox(height: 7),
            Container(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                controller: budget,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white),
                decoration: textfieldDecoration,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: when.text.isNotEmpty && budget.text.isNotEmpty
                  ? () {
                      Item newItem = Item(
                          place: where.text,
                          date: when.text,
                          budget: int.parse(budget.text),
                          comment: '',
                          type: '',
                          currentIndex: -1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Add2Widget(
                                  item: newItem,
                                )),
                      );
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: when.text.isNotEmpty && budget.text.isNotEmpty
                        ? orange
                        : orange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Continue',
                    style: btntext,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
