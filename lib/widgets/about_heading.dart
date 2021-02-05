import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore/config/constants.dart';
import 'package:explore/widgets/auth_dialog.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class AboutHeading extends StatefulWidget {
  const AboutHeading({
    Key key,
    this.screenSize,
  }) : super(key: key);
  final Size screenSize;

  @override
  _AboutHeadingState createState() => _AboutHeadingState();
}

class _AboutHeadingState extends State<AboutHeading> {
  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];

  List _isSelected = [true, false, false, false, false, false, false];
  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => Column(
        children: [
          Center(
            child: Text(
              ResponsiveWidget.isSmallScreen(context)?skills_small[_current]:skills[_current],
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 6,
                //fontFamily: 'Electrolize',
                fontSize: screenSize.width / 40,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              width: screenSize.width/2.8,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    )
        .toList();
  }

  int _current = 0;

  final List<String> images = [
    'assets/skills/smartphone.png',
    'assets/skills/programming.png',
    'assets/skills/motherboard.png',
    'assets/skills/modeling.png',
    'assets/skills/deep-learning.png',
  ];

  final List<String> skills = [
    'APP DEVELOPMENT',
    'WEB DEVELOPMENT',
    'EMBEDDED SYSTEMS',
    '3D-MODELING',
    'MACHINE LEARNING',
  ];
  final List<String> skills_small = [
    'APP\nDEVELOPMENT',
    'WEB\nDEVELOPMENT',
    'EMBEDDED\nSYSTEMS',
    '3D\nMODELING',
    'MACHINE\nLEARNING',
  ];
  final List<String> project_link = [
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
    'https://github.com/Ankit-jailwal/ankitjailwal.com',
  ];

  final List<String> framework = [
    'assets/framework/flutter.png',
    'assets/framework/django.png',
    'assets/framework/firebase.png',
    'assets/framework/azure.png',
    'assets/framework/html.png',
    'assets/framework/css.png',
    'assets/framework/ae.png',
    'assets/framework/ai.png',
    'assets/framework/arduino.png',
    'assets/framework/rasp.png',
    'assets/framework/node.png',
    'assets/framework/ps.png',
    'assets/framework/pyc.png',
    'assets/framework/vs.png',
    'assets/framework/linux.png',
    'assets/framework/fusion.png',
    'assets/framework/filmora.png',
    'assets/framework/eagle.png',
    'assets/framework/blender.png',
    'assets/framework/android.png',
  ];

  Widget build(BuildContext context) {
    var imageSliders = generateImageTiles(widget.screenSize);
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.06,
        left: widget.screenSize.width / 15,
        right: widget.screenSize.width / 15,
      ),
      child:Column(
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

          Column(
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        ResponsiveWidget.isSmallScreen(context)?Container():Container(height: 350,
                          width: 600,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: FlareActor("assets/rive/Human.flr",antialias: false, alignment:Alignment.center, fit:BoxFit.cover, animation:"Build and Fade Out",sizeFromArtboard: true,),
                            ),
                          ),),
                      ],
                    ),
                  ),
                  Align(
                    alignment: ResponsiveWidget.isSmallScreen(context)?Alignment.center:Alignment.centerRight,
                    child: Container(
                      width: widget.screenSize.width*0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        //color: Theme.of(context).scaffoldBackgroundColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color:Colors.black45,
                      //     blurRadius: 10.0,
                      //     offset: Offset(0, 2),
                      //   ),
                      // ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top:15,bottom: 15,left: 40,right: 15),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ResponsiveWidget.isSmallScreen(context)?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                    radius: widget.screenSize.width/10,
                                    child: Image.asset("assets/images/cir.png",fit: BoxFit.fill,)),
                                Column(
                                  //mainAxisSize: MainAxisSize.min,
                                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5,bottom: 10),
                                      child: Container(
                                        width: widget.screenSize.width*0.5,
                                        child: Text(
                                          introduction,
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      //mainAxisSize: MainAxisSize.max,
                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Birthday:",style: TextStyle(fontWeight: FontWeight.w700),),
                                            Text(" 10th March 2002",style: TextStyle(fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Freelance:",style: TextStyle(fontWeight: FontWeight.w700),),
                                            Text(" Available",style: TextStyle(fontWeight: FontWeight.w400),),
                                            Icon(Icons.check_circle,color: Colors.green,size: 18,)
                                          ],
                                        ),
                                        SizedBox(height: 15,),
                                       // Padding(
                                       //   padding: EdgeInsets.only(right: 20),
                                       //   child: FlatButton(
                                       //     onPressed: () {
                                       //      //launchInBrowser('https://drive.google.com/u/0/uc?id=1nluFMNV3yAn-esroZ7e9Ayyf-3Jq1rXO&export=download');
                                       //     },
                                       //     child: Container(
                                       //       height: 35,
                                       //       width: 130,
                                       //       decoration: BoxDecoration(
                                       //         borderRadius: BorderRadius.circular(5),
                                       //         boxShadow: [
                                       //           BoxShadow(
                                       //             color:Colors.black45,
                                       //             blurRadius: 10.0,
                                       //             offset: Offset(0, 2),
                                       //           ),
                                       //         ],
                                       //         color: Theme.of(context).scaffoldBackgroundColor,
                                       //       ),
                                       //       child: Row(
                                       //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       //         children: [
                                       //           FaIcon(FontAwesomeIcons.download,size: 20,),
                                       //           Text(
                                       //               "Download CV"
                                       //           ),
                                       //         ],
                                       //       ),
                                       //     ),
                                       //   ),
                                       // )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5,bottom: 10),
                                        child: Container(
                                          width: widget.screenSize.width*0.5,
                                          child: Text(
                                            introduction,
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        //mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                                  Icon(Icons.check_circle,color: Colors.green,size: 18,)
                                                ],
                                              ),
                                            ],
                                          ),
                                          //Padding(
                                          //  padding: EdgeInsets.only(right: 20),
                                          //  child: FlatButton(
                                          //    onPressed: (){
                                          //      launchInBrowser('https://drive.google.com/u/0/uc?id=1nluFMNV3yAn-esroZ7e9Ayyf-3Jq1rXO&export=download');
                                          //    },
                                          //    child: Container(
                                          //      height: 35,
                                          //      width: 130,
                                          //      decoration: BoxDecoration(
                                          //        borderRadius: BorderRadius.circular(5),
                                          //        boxShadow: [
                                          //          BoxShadow(
                                          //            color:Colors.black45,
                                          //            blurRadius: 10.0,
                                          //            offset: Offset(0, 2),
                                          //          ),
                                          //        ],
                                          //        color: Theme.of(context).scaffoldBackgroundColor,
                                          //      ),
                                          //      child: Row(
                                          //        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          //        children: [
                                          //          FaIcon(FontAwesomeIcons.download,size: 20,),
                                          //          Text(
                                          //              "Download CV"
                                          //          ),
                                          //        ],
                                          //      ),
                                          //    ),
                                          //  ),
                                          //)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                    radius: widget.screenSize.width/14,
                                    child: Image.asset("assets/images/cir.png",fit: BoxFit.fill,)),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: widget.screenSize.height / 20),
              Text(
                'SKILLS',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: widget.screenSize.height / 20),
              Container(
                width: widget.screenSize.width*0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                 // boxShadow: [
                 //   BoxShadow(
                 //    // color:Colors.black45,
                 //     blurRadius: 10.0,
                 //     offset: Offset(0, 2),
                 //   ),
                 // ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     // Text(
                     //   'SKILLS',
                     //   style: TextStyle(
                     //     fontSize: 24,
                     //     fontFamily: 'Montserrat',
                     //     fontWeight: FontWeight.w600,
                     //   ),
                     // ),
                    SizedBox(height: 20,),
                    CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          height: 235,
                          scrollPhysics: PageScrollPhysics(),
                         //aspectRatio: 16/9,
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
                      SizedBox(height: 20,),
                      Text(
                        'LANGUAGES',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/language/C.png',height: 100,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/language/cpp.png',height: 100,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/language/python.png',height: 100,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/language/dart.png',height: 100,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/language/java.png',height: 100,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'FRAMEWORKS & OTHER SKILLS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset('assets/framework/flutter.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/django.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/firebase.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/azure.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/html.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/css.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/ae.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/ai.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/arduino2.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/rasp.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/node.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/ps.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/pyc.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/vs.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/linux.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/fusion.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/filmora.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/eagle.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/blender.png',height: 80,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15,top: 15,bottom: 15),
                              child: Image.asset('assets/framework/android.png',height: 80,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      FlatButton(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) => AuthDialog(),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 180,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:5.0,bottom: 5,left: 5),
                                child: Image.asset("assets/icons/biryani.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:5.0),
                                child: Text(
                                  'BUY ME BIRYANI',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      )
    );
  }
}
