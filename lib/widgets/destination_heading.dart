import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 22,
              bottom: screenSize.height / 22,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'RECENT PROJECTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'RECENT PROJECTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          );
  }
}
