import 'package:explore/config/constants.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class AboutHeading extends StatelessWidget {
  const AboutHeading({
    Key key,
    this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Full Stack Android and Web Developer',
            textAlign: TextAlign.end,
            style: Theme.of(context).primaryTextTheme.subtitle1,
          ),
          SizedBox(height: 10),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenSize.width/2.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'INTRODUCTION',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CircleAvatar(
                          radius: screenSize.width/20,
                          child: Image.asset("assets/images/person.png",fit: BoxFit.fill,)),
                      Padding(
                        padding: EdgeInsets.only(top: 5,bottom: 10),
                        child: Text(
                          introduction,
                          style: TextStyle(
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Birthday:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" 10th March 2002",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Freelance:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" Available",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Birthday:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" 10th March 2002",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: screenSize.width/2.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'INTRODUCTION',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CircleAvatar(
                          radius: screenSize.width/20,
                          child: Image.asset("assets/images/person.png",fit: BoxFit.fill,)),
                      Padding(
                        padding: EdgeInsets.only(top: 5,bottom: 10),
                        child: Text(
                          introduction,
                          style: TextStyle(
                              fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Birthday:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" 10th March 2002",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Freelance:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" Available",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Birthday:",style: TextStyle(fontWeight: FontWeight.w700),),
                          Text(" 10th March 2002",style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      )
    );
  }
}
