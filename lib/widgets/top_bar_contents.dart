import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:explore/screens/home_page.dart';
import 'package:explore/widgets/auth_dialog.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ANKIT JAILWAL',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    SizedBox(width: screenSize.width / 20),
                  ],
                ),
              ),
              AnimatedCrossFade(
                duration: Duration(milliseconds: 1),
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

              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap:(){
                        showDialog(
                          context: context,
                          builder: (context) => AuthDialog(),
                        );
                      },
                child: Image.asset(
                        'assets/icons/bir2.png',
                   height: 25,
                      )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
