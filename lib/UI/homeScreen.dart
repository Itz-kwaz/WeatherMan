import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_man/Core/constants.dart';
import 'package:weather_man/Core/Weather.dart';
import 'package:weather_man/Core/routes.dart';
import 'package:weather_man/Core/state/weatherModel.dart';

import 'dashedArcPainter.dart';
import 'reUsableWidgets/miniWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    WeatherModel model = Provider.of<WeatherModel>(context,listen:true);
    Weather currentWeather = model.currentWeather;
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Visibility(
            visible:  !model.isLoading,
            replacement: Center(
              child: CircularProgressIndicator(
              ),
            ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Placeholder(
                        color: Colors.yellow.shade600,
                        fallbackHeight:MediaQuery.of(context).size.width * 0.25,
                        fallbackWidth: MediaQuery.of(context).size.width * 0.25
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(model.currentWeather.temperature.toString(),
                      style: GoogleFonts.muli(
                        textStyle: Theme.of(context).textTheme.headline4,
                        color: kTextColor,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MiniWidget(textColor: kTextColor,title: 'Humidity', value: currentWeather.humidity.toString(),),
                    MiniWidget(textColor: kTextColor,title: 'Cloudiness',value: currentWeather.cloudiness.toString(),),
                    MiniWidget(textColor: kTextColor, title : 'Wind Speed', value : currentWeather.windSpeed.toString())
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
                        textStyle: Theme.of(context).textTheme.subtitle2,
                          fontWeight: FontWeight.w700
                      ),),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context,Routes.next7DaysScreen);
                        },
                        child: Row(
                          children: [
                            Text('Next 7 Days',
                            style: GoogleFonts.muli(
                              textStyle: Theme.of(context).textTheme.subtitle2,
                              color: kTextColor,
                              fontWeight: FontWeight.w700
                            ),),
                            Icon(Icons.keyboard_arrow_right_rounded,
                            color: kTextColor,)
                          ],
                        ),
                      )
                    ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount : model.hourlyWeatherList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Weather hourlyWeather = model.hourlyWeatherList[index];
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
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
                                hourlyWeather.time.toString(),
                                style: GoogleFonts.muli(
                                  textStyle: Theme.of(context).textTheme.subtitle1,
                                  color: Colors.grey
                                ),
                              ),
                            ),
                            Expanded(
                                child: Center(
                              child: Placeholder(
                                color: Colors.green,
                                fallbackWidth: 40.0,
                              ),
                            )),

                            Expanded(
                                child: Center(
                                  child: Text(
                                    hourlyWeather.temperature.toString(),
                                  style: GoogleFonts.muli(
                                    textStyle: Theme.of(context).textTheme.subtitle1,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold
                                  ),),
                                )
                            )
                          ],
                        ),
                      );
                    },),
                ),
                FittedBox(
                  child: CustomPaint(
                    painter: DashedArc(
                        color: Colors.yellow
                    ),
                    size: Size(MediaQuery.of(context).size.width * 0.95, MediaQuery.of(context).size.height * 0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherModel>(context,listen:false).fetchData();
  }
}





