import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_images.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:country_app/const/news.dart';
import 'package:country_app/screens/news_more_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
            SizedBox(height: 10),
            Text(
              'News',
              style: boldText,
            ),
            SizedBox(height: 10),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InfoNewsWidget(item: newsItems[index]),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: darkblue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              newsItems[index].image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            newsItems[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            newsItems[index].discription,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
