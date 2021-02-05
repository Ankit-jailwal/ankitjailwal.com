import 'package:carousel_slider/carousel_slider.dart';
import 'package:ankitjailwal/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ankitjailwal/widgets/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  TextEditingController textControllerEmail;
  TextEditingController textControllerName;
  TextEditingController textControllerDesc;
  FocusNode textFocusNodeEmail;

  TextEditingController textControllerPassword;
  FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;


  String loginStatus;
  Color loginStringColor = Colors.green;

  String _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Length of password should be greater than 6';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = null;
    textControllerPassword.text = null;
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/maati.jpg',
    'assets/images/tradegood.jpg',
    'assets/images/blogx.jpg',
    'assets/images/wsim.jpg',
    'assets/images/emp.jpg',
    'assets/images/radar.jpg',
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
    'https://github.com/Ankit-jailwal/FTX-Razorpay_APP',
    null,
    'https://github.com/Ankit-jailwal/Blogx',
    'https://github.com/Ankit-jailwal/Wireless_gaming_simulator',
    null,
    null,
  ];

  List<Widget> generateImageTiles(screenSize) {
    var screenSize = MediaQuery.of(context).size;
    return images.map(
          (element) => Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  element,
                  height:580,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  project_link[_current]==null?Container(height: 32,
                    width: 140,):FlatButton(
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
                  ),
                  SizedBox(height:screenSize.height*0.02 ,),
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

    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      scrollPhysics: PageScrollPhysics(),
                      enlargeCenterPage: true,
                      aspectRatio: ResponsiveWidget.isSmallScreen(context)?18/10:18 / 6,
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
                    ?Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Center(
                        child: Text(
                          places[_current],
                          style: TextStyle(
                            letterSpacing: 8,
                            fontFamily: 'Montserrat',
                            fontSize: screenSize.width / 25,
                            color: Theme.of(context).brightness == Brightness.dark?Colors.white:Colors.black,
                          ),
                        ),
                      ),
                    ):Container()
              ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            duration:
                                                Duration(milliseconds: 400),
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
        ),
        SizedBox(height: screenSize.height / 16),
        FlatButton(
          hoverColor: Colors.transparent,
          onPressed: (){
            launch("mailto:jailwalankit@gmail.com");
          },
          child: Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color:Colors.black45,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Center(
              child: Text(
                'TELL ME YOU WERE HERE!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
//AuthDialog