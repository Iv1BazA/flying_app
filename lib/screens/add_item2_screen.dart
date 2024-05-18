import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add2Widget extends StatefulWidget {
  Item item;
  Add2Widget({super.key, required this.item});

  @override
  State<Add2Widget> createState() => _Add2WidgetState();
}

class _Add2WidgetState extends State<Add2Widget> {
  int currentIndex = -1;
  final comment = TextEditingController();
  final whoisPicker = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    comment.addListener(updateButtonState);
    whoisPicker.addListener(updateButtonState);
  }

  @override
  void dispose() {
    comment.removeListener(updateButtonState);
    whoisPicker.removeListener(updateButtonState);
    super.dispose();
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = comment.text.isNotEmpty && whoisPicker.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 15),
            Text(
              'New travel',
              style: boldText,
            ),
            SizedBox(height: 7),
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
                        currentIndex = 0;
                        whoisPicker.text = 'Vacation';
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
                        currentIndex = 1;
                        whoisPicker.text = 'Work';
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
                        currentIndex = 2;
                        whoisPicker.text = 'Other';
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
            TextField(
                minLines: 4,
                maxLines: 5,
                controller: comment,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white),
                decoration: textfieldDecoration.copyWith(
                    hintText: 'Comment about the trip')),
            SizedBox(height: 25),
            GestureDetector(
              onTap: isButtonEnabled
                  ? () {
                      Item newItem = Item(
                          place: widget.item.place,
                          date: widget.item.date,
                          budget: widget.item.budget,
                          comment: comment.text,
                          type: whoisPicker.text,
                          currentIndex: currentIndex);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Add2Widget(
                                  item: newItem,
                                )),
                      );
                      final itemProvider =
                          Provider.of<ItemProvider>(context, listen: false);
                      itemProvider.addItem(newItem);

                      Navigator.of(context).pushReplacementNamed('/main');
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: isButtonEnabled ? orange : orange.withOpacity(0.3),
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
