import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/hyd.jpg',
    'assets/images/hb.png',
    'assets/images/hacsac.jpg',
  ];
  final List<String> position = ['Winner', 'Runner up', 'Third Place'];
  final List<String> title = [
    'SS2020 Mobile \nDevelopment Contest',
    'HackBattle2020\n',
    'HAC SAC 1.0\n'
  ];

  final List<String> assets0 = [
    'assets/images/hyd.jpg',
    'assets/images/hb.png',
    'assets/images/hacsac.jpg',
    'assets/images/avoid.jpg',
    'assets/images/cadmics.jpg',
    'assets/images/sumo.jpg',
  ];
  final List<String> position0 = [
    'Winner',
    'Runner up',
    'Third Place',
    'Third Place',
    'Runner up',
    'Third Place'
  ];
  final List<String> title0 = [
    'SS2020 Mobile \nDevelopment Contest',
    'HackBattle2020\n',
    'HAC SAC 1.0\n',
    'Avoid It',
    'Cadmics\n',
    'Robo Sumo\n'
  ];

  final List<String> assets1 = [
    'assets/images/avoid.jpg',
    'assets/images/cadmics.jpg',
    'assets/images/sumo.jpg',
  ];
  final List<String> position1 = ['Third Place', 'Runner up', 'Third Place'];
  final List<String> title1 = ['Avoid It', 'Cadmics\n', 'Robo Sumo\n'];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(assets0.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets0[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    position0[pageIndex],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1
                                          .color,
                                    ),
                                  ),
                                  Text(
                                    title0[pageIndex],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .subtitle1
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                  left: screenSize.width / 15,
                  right: screenSize.width / 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...Iterable<int>.generate(assets.length).map(
                      (int pageIndex) => Column(
                        children: [
                          SizedBox(
                            height: screenSize.width / 6,
                            width: screenSize.width / 3.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                assets[pageIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 70,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  position[pageIndex],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .color,
                                  ),
                                ),
                                Text(
                                  title[pageIndex],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenSize.height * 0.06,
                  left: screenSize.width / 15,
                  right: screenSize.width / 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...Iterable<int>.generate(assets.length).map(
                      (int pageIndex) => Column(
                        children: [
                          SizedBox(
                            height: screenSize.width / 6,
                            width: screenSize.width / 3.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                assets1[pageIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 70,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  position1[pageIndex],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .color,
                                  ),
                                ),
                                Text(
                                  title1[pageIndex],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle1
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
