import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_images.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

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
                SizedBox(height: 30),
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
                  'Settings',
                  style: boldText.copyWith(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: darkblue),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Image.asset(
                          settings,
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Your opinion is important!',
                          style: boldText.copyWith(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'We need your feedback to get better',
                          style: discrstyle,
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Rate app',
                                style: btntext,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: orange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          'Terms & Conditions',
                          style: boldText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: orange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          'Privacy Policy',
                          style: boldText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: orange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(width: 5),
                        Text(
                          'Share App',
                          style: boldText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
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
