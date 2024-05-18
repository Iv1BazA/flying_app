import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoarding2Widget extends StatefulWidget {
  const OnBoarding2Widget({super.key});

  @override
  State<OnBoarding2Widget> createState() => _OnBoarding2WidgetState();
}

class _OnBoarding2WidgetState extends State<OnBoarding2Widget> {
  int currentIndex = -1;
  final txtcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Let’s get \nacquainted',
              style:
                  boldText.copyWith(fontWeight: FontWeight.w400, height: 1.1),
            ),
            SizedBox(height: 10),
            Text(
              'Your name?',
              style: discrstyle,
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextField(
                controller: txtcontroller,
                cursorColor: Colors.white,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Colors.white),
                decoration: textfieldDecoration,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'How many times a year you travel?',
              style: discrstyle,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
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
                        child: Text(
                          '1-2',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
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
                        child: Text(
                          '3-5',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
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
                        child: Text(
                          '>5',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: currentIndex != -1 && txtcontroller.text.isNotEmpty
                  ? () {
                      Navigator.of(context).pushReplacementNamed('/main');
                    }
                  : null,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: currentIndex != -1 && txtcontroller.text.isNotEmpty
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
