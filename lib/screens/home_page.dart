import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:explore/widgets/about_heading.dart';
import 'package:explore/widgets/auth_dialog.dart';
import 'package:explore/widgets/web_scrollbar.dart';
import 'package:explore/widgets/bottom_bar.dart';
import 'package:explore/widgets/carousel.dart';
import 'package:explore/widgets/destination_heading.dart';
import 'package:explore/widgets/featured_heading.dart';
import 'package:explore/widgets/featured_tiles.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:explore/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  int _currentIndex = 0;
  PageController _pageController;
  bool backgroundState = true;
  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _pageController = PageController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.7
        ? _scrollPosition / (screenSize.height * 0.7)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AuthDialog(),
                  );
                },
                icon: Image.asset(
                  'assets/icons/bir2.png',
                  width: 25,
                ),
              ),
              actions: [
                Center(
                  child: AnimatedCrossFade(
                    duration: Duration(seconds: 1),
                    crossFadeState: DynamicTheme.of(context)
                                .brightness == // light and dark theme
                            Brightness.light
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: IconButton(
                      onPressed: () => DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.white,
                      icon: Icon(
                        Icons.nights_stay,
                      ),
                    ),
                    secondChild: IconButton(
                      onPressed: () => DynamicTheme.of(context).setBrightness(
                          Theme.of(context).brightness == Brightness.dark
                              ? Brightness.light
                              : Brightness.dark),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.white,
                      icon: Icon(
                        Icons.wb_sunny,
                      ),
                    ),
                  ),
                ),
              ],
              title: Text(
                'ANKIT JAILWAL',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  ResponsiveWidget.isSmallScreen(context)?Stack(
                    children: [
                      Container(
                        child: SizedBox(
                          height: screenSize.height,
                          width: screenSize.width,
                          child: Opacity(
                            opacity: 1-_opacity,
                            child: Image.asset(
                              'assets/images/backDarkSmall.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: Theme.of(context).brightness != Brightness.dark
                            ? 1.0
                            : 0.0,
                        duration: Duration(seconds: 1),
                        child: Container(
                          child: SizedBox(
                            height: screenSize.height,
                            width: screenSize.width,
                            child: Opacity(
                              opacity: 1-_opacity,
                              child: Image.asset(
                                'assets/images/backLightSmall.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ):Stack(
                    children: [
                      Container(
                        child: SizedBox(
                          height: screenSize.height,
                          width: screenSize.width,
                          child: Opacity(
                            opacity: 1-_opacity,
                            child: Image.asset(
                              'assets/images/backDark.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: Theme.of(context).brightness != Brightness.dark
                            ? 1.0
                            : 0.0,
                        duration: Duration(seconds: 1),
                        child: Container(
                          child: SizedBox(
                            height: screenSize.height,
                            width: screenSize.width,
                            child: Opacity(
                              opacity: 1-_opacity,
                              child: Image.asset(
                                'assets/images/backLight.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenSize.height + 5,
                      ),
                      Container(
                        child: Column(
                          children: [
                            AboutHeading(
                              screenSize: screenSize,
                            ),
                            FeaturedHeading(
                              screenSize: screenSize,
                            ),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // SizedBox(height: screenSize.height / 8),
              DestinationHeading(screenSize: screenSize),
              DestinationCarousel(),
              SizedBox(height: screenSize.height / 16),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
