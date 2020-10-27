import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_man/Core/constants.dart';

class MiniWidget extends StatelessWidget {
  final Color textColor;
  MiniWidget({@required this.textColor}) : assert(textColor != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Placeholder(
          fallbackWidth: MediaQuery.of(context).size.width * 0.06,
          fallbackHeight: MediaQuery.of(context).size.height * 0.06,
          color: Colors.red,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '9 km/h',
          style: GoogleFonts.muli(
              textStyle: Theme.of(context).textTheme.subtitle2,
              fontWeight: FontWeight.bold,
              color: textColor),
        )
      ],
    );
  }
}
