import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_images.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoarding1Widget extends StatefulWidget {
  const OnBoarding1Widget({super.key});

  @override
  State<OnBoarding1Widget> createState() => _OnBoarding1WidgetState();
}

class _OnBoarding1WidgetState extends State<OnBoarding1Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(onboard),
            SizedBox(height: 30),
            Text(
              'Welcome to \nour app!',
              textAlign: TextAlign.center,
              style:
                  boldText.copyWith(fontWeight: FontWeight.w400, height: 1.1),
            ),
            SizedBox(height: 20),
            Text(
              'Track your flights and read \ninteresting news',
              style: discrstyle,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/onboard2'),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: orange, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Continue',
                    style: boldText.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white),
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
