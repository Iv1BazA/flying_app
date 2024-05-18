import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_images.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class InfoNewsWidget extends StatefulWidget {
  NewsItem item;
  InfoNewsWidget({super.key, required this.item});

  @override
  State<InfoNewsWidget> createState() => _InfoNewsWidgetState();
}

class _InfoNewsWidgetState extends State<InfoNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
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
            SizedBox(height: 40),
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(widget.item.image)),
            SizedBox(height: 25),
            Text(
              widget.item.title,
              style:
                  boldText.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Text(
                widget.item.fullDiscritp,
                textAlign: TextAlign.justify,
                style: discrstyle.copyWith(fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
