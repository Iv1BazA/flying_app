import 'dart:math';

import 'package:country_app/const/app_colors.dart';
import 'package:country_app/const/app_images.dart';
import 'package:country_app/const/app_styles.dart';
import 'package:country_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'info_item_screen.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/news');
                    },
                    child:
                        Container(child: Text('News', style: backbuttntext))),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/settings');
                    },
                    child: Container(
                        child: Text('Settings', style: backbuttntext))),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(height: 25),
            Consumer<ItemProvider>(
              builder: (context, itemProvider, _) {
                if (itemProvider.items.isEmpty) {
                  return Center(child: NoInfoWidget());
                } else {
                  return Expanded(child: ItemWidget());
                }
              },
            ),
            Consumer<ItemProvider>(
              builder: (context, itemProvider, _) {
                if (itemProvider.items.isEmpty) {
                  return Spacer();
                } else {
                  return Container();
                }
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/add');
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: orange, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Add new country',
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

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My travels',
          style: boldText.copyWith(fontSize: 30),
        ),
        Expanded(
          child: Consumer<ItemProvider>(
            builder: (context, itemProvider, _) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: itemProvider.items.length,
                itemBuilder: (context, index) {
                  final item = itemProvider.items[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoWidgetItem(item: item),
                        ),
                      );
                    },
                    child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.budget.toStringAsFixed(0)}\$",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    item.date,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item.place}",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: orange,
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class NoInfoWidget extends StatelessWidget {
  const NoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'My flight',
          style: boldText,
        ),
        SizedBox(height: 15),
        Image.asset(
          mainimage,
          width: 343,
          height: 343,
        ),
        SizedBox(height: 50),
        Text(
          'There\'s no info',
          style: btntext.copyWith(
              fontSize: 20, fontWeight: FontWeight.w400, color: orange),
        ),
        SizedBox(height: 5),
        Text(
          'Add your new travel',
          style: discrstyle,
        )
      ],
    );
  }
}
