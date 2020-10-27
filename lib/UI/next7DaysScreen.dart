import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_man/Core/constants.dart';

class Next7DaysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Material(
              child: Container(
                decoration: BoxDecoration(

                ),
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tomorrow',
                          style: GoogleFonts.muli(
                            color: kWhite,
                            textStyle: Theme.of(context).textTheme.subtitle2
                          ),),
                          Text('Sun,7 Aug',
                            style: GoogleFonts.muli(
                                color: kWhite,
                                textStyle: Theme.of(context).textTheme.caption
                            ),)
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Placeholder(
                            color: Colors.yellow,
                          ),
                          flex: 2,),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text('20',
                                style: GoogleFonts.muli(
                                  textStyle: Theme.of(context).textTheme.headline4,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold
                                )),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text('Sunny',
                                style: GoogleFonts.muli(
                                  color: kWhite,
                                  textStyle: Theme.of(context).textTheme.caption
                                ),)
                              ],
                            ),
                          ),
                          Expanded(child: Column(
                            children: [
                              Text('/ 17',
                              style: GoogleFonts.muli(
                                textStyle: Theme.of(context).textTheme.subtitle1,
                                color: kWhite,

                              ),),
                            ],
                          ))

                        ],
                      )

                    ],
                ),
              ),
              elevation: 2.0,
            ),
          Expanded(child: ListView.builder(itemBuilder: (context,index){
            return Container();
          }))

        ],
      ),
          )),
    );
  }
}
