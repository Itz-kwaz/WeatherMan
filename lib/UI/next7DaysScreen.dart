import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_man/Core/constants.dart';

import 'reUsableWidgets/miniWidget.dart';

class Next7DaysScreen extends StatefulWidget {
  @override
  _Next7DaysScreenState createState() => _Next7DaysScreenState();
}

class _Next7DaysScreenState extends State<Next7DaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhite,
        title: Text(
          'Next 7 Days',
          style:
              GoogleFonts.muli(color: kTextColor, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: kTextColor,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tomorrow',
                              style: GoogleFonts.muli(
                                  color: kWhite,
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Sun,7 Aug',
                              style: GoogleFonts.muli(
                                  color: kWhite,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Placeholder(
                                  color: Colors.yellow,
                                  fallbackHeight:
                                      MediaQuery.of(context).size.height * 0.15,
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text('20',
                                      style: GoogleFonts.muli(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                          color: kWhite,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Sunny',
                                    style: GoogleFonts.muli(
                                        color: kWhite,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  child: Text(
                                    '/ 17',
                                    style: GoogleFonts.muli(
                                      textStyle:
                                          Theme.of(context).textTheme.headline6,
                                      color: kWhite,
                                    ),
                                  ),
                                  alignment: Alignment(0.9, 0.0),
                                ),
                                Text(
                                  '/ 17',
                                  style: GoogleFonts.muli(
                                    textStyle:
                                        Theme.of(context).textTheme.headline5,
                                    color: kWhite,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MiniWidget(
                              textColor: kWhite,
                            ),
                            MiniWidget(
                              textColor: kWhite,
                            ),
                            MiniWidget(
                              textColor: kWhite,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 2.0,
              ),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Mon",
                    style: GoogleFonts.muli(
                      fontWeight: FontWeight.w700,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),),
                    Expanded(
                      child: Center(
                        child: Text("Mon",
                          style: GoogleFonts.muli(
                            fontWeight: FontWeight.w700,
                            textStyle: Theme.of(context).textTheme.bodyText1,
                          ),),
                      ),
                    ),
                    Text("Mon",
                      style: GoogleFonts.muli(
                        fontWeight: FontWeight.w700,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),)
                  ],
                )
              );
            }))
          ],
        ),
      ),
    );
  }
}
