import 'dart:math';

import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InfoWidgetItem extends StatefulWidget {
  Item item;
  InfoWidgetItem({super.key, required this.item});

  @override
  State<InfoWidgetItem> createState() => _InfoWidgetItemState();
}

class _InfoWidgetItemState extends State<InfoWidgetItem> {
  late TextEditingController place;
  late TextEditingController date;
  late TextEditingController budget;
  late TextEditingController comment;
  late TextEditingController type;
  bool isEditing = false;
  late int currentIndex;

  @override
  void initState() {
    place = TextEditingController(text: widget.item.place);
    type = TextEditingController(text: widget.item.type);

    budget =
        TextEditingController(text: (widget.item.budget).toStringAsFixed(0));
    date = TextEditingController(text: widget.item.date);
    comment = TextEditingController(text: widget.item.comment);
    currentIndex = widget.item.currentIndex;
    super.initState();
  }

  @override
  void dispose() {
    place.dispose();
    type.dispose();
    date.dispose();
    budget.dispose();
    comment.dispose();
    super.dispose();
  }

  void _saveChanges() {
    String newDate = date.text;
    String newPlace = place.text;
    int newBudget = int.parse(budget.text);
    String newComment = comment.text;
    String newType = type.text;
    int newIndex = currentIndex;
    setState(() {
      widget.item.date = newDate;
      widget.item.place = newPlace;
      widget.item.budget = newBudget;
      widget.item.comment = newComment;
      widget.item.type = newType;
      widget.item.currentIndex = newIndex;
    });
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);
    itemProvider.updateItemInCache(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
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
                SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: darkblue,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BUDGET',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                              Text(
                                'DATE',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.5)),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: budget,
                                  style: discrstyle.copyWith(
                                      color: Colors.white, fontSize: 14),
                                  enabled: isEditing,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: date,
                                  style: discrstyle.copyWith(
                                      color: Colors.white, fontSize: 14),
                                  enabled: isEditing,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 5),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: orange.withOpacity(0.08),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'COUNTRY',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          TextField(
                            controller: place,
                            style: discrstyle.copyWith(
                                color: Colors.white, fontSize: 24),
                            enabled: isEditing,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(height: 15),
                Text(
                  'What type of travel?',
                  style: discrstyle,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isEditing == true) {
                              currentIndex = 0;
                              type.text = 'Vacation';
                            }
                          });
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == 0 ? orange : darkblue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Center(
                              child: Text(
                                'Vacation',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isEditing == true) {
                              currentIndex = 1;
                              type.text = 'Work';
                            }
                          });
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == 1 ? orange : darkblue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Center(
                              child: Text(
                                'Work',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isEditing == true) {
                              currentIndex = 2;
                              type.text = 'Other';
                            }
                          });
                        },
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == 2 ? orange : darkblue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Center(
                              child: Text(
                                'Other',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Comment',
                  style: discrstyle,
                ),
                SizedBox(height: 5),
                TextField(
                    minLines: 4,
                    maxLines: 5,
                    controller: comment,
                    cursorColor: Colors.white,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: textfieldDecoration),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    if (isEditing == false) {
                      setState(() {
                        isEditing = true;
                      });
                    } else {
                      _saveChanges();
                      isEditing = false;
                      Navigator.of(context).pushNamed('/main');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: orange),
                    child: Center(
                      child: isEditing == false
                          ? Text(
                              'Edit',
                              style: btntext.copyWith(color: Colors.white),
                            )
                          : Text(
                              'Save',
                              style: btntext.copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    final itemProvider =
                        Provider.of<ItemProvider>(context, listen: false);
                    itemProvider.removeItem(widget.item);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: orange)),
                    child: Center(
                      child: Text(
                        'Delete',
                        style: btntext.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
