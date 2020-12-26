import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:explore/widgets/bottom_bar.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'MAATI',
    'TRADEGOOD',
    'BLOGX',
    'W-GSIM',
    'EMP',
    'RADAR',
  ];

  final List<String> project_link = [
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  element,
                  height: 580,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      places[_current],
                      style: TextStyle(
                        letterSpacing: 8,
                        fontFamily: 'Electrolize',
                        fontSize: screenSize.width / 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      launchInBrowser(project_link[_current]);
                    },
                    child: Container(
                      height: 32,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).bottomAppBarColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.blueGrey[100],
                          ),
                          Text(
                            "View Project",
                            style: TextStyle(color: Colors.blueGrey[100]),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              aspectRatio: 18 / 6,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),

        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 6.4,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 6,
                        right: screenSize.width / 6,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .decorationColor
                                                : Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
