import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_man/Core/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LONDON,',
              style: GoogleFonts.muli(
                textStyle: Theme.of(context).textTheme.headline6,
                color: kTextColor
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('United Kingdom,',
              style: GoogleFonts.muli(
                  textStyle: Theme.of(context).textTheme.headline6,
                color: kTextColor
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Sat,6,Aug',
              style: GoogleFonts.muli(
                textStyle: Theme.of(context).textTheme.caption,
                color: kTextColor
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text('Today',
              style: GoogleFonts.muli(
                textStyle: Theme.of(context).textTheme.headline4,
                color: kTextColor
              ),),
            ),
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Placeholder(
                    color: Colors.yellow.shade600,
                    fallbackHeight:MediaQuery.of(context).size.width * 0.3,
                    fallbackWidth: MediaQuery.of(context).size.width * 0.3
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MiniWidget(),
                MiniWidget(),
                MiniWidget()
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today',
                  style: GoogleFonts.muli(
                    color: kTextColor,
                    textStyle: Theme.of(context).textTheme.subtitle2
                  ),),
                  Text('Next 7 Days',
                  style: GoogleFonts.muli(
                    textStyle: Theme.of(context).textTheme.subtitle2,
                    color: kTextColor
                  ),)
                ],
            ),
            SizedBox(
              height: 8.0,
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.0
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          '10:00',
                          style: GoogleFonts.muli(
                            textStyle: Theme.of(context).textTheme.subtitle1,
                            color: Colors.grey
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Expanded(child: Placeholder(
                        color: Colors.green,
                      )),
                      SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                          child: Text('20',
                          style: GoogleFonts.muli(
                            textStyle: Theme.of(context).textTheme.subtitle1,
                            color: kTextColor,
                            fontWeight: FontWeight.bold
                          ),)
                      )
                    ],
                  ),
                );
              },),


          ],
        ),
      ),

    );
  }
}

class MiniWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Placeholder(
          fallbackWidth: MediaQuery.of(context).size.width  * 0.2,
          fallbackHeight: MediaQuery.of(context).size.height * 0.2,
          color: Colors.red,
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}



