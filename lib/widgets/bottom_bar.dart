import 'package:explore/widgets/bottom_bar_column.dart';
import 'package:explore/widgets/info_text.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

String git='https://github.com/Ankit-jailwal';
String lin='https://www.linkedin.com/in/ankit-jailwal-776712173/';
String fb='https://www.facebook.com/ankit.jailwal.52/';
String insta='https://www.instagram.com/ankitjailwal/';
String discord='https://discord.com/channels/Ankitjailwal#4131';
String add='https://www.google.com/maps/place/DIT+University/@30.3983031,78.0751177,15z/data=!4m5!3m4!1s0x0:0x359bb8f9c7797984!8m2!3d30.3983031!4d78.0751177';
String xbox='https://account.xbox.com/en-in/Profile?xr=mebarnav&rtc=1';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child:  Column(
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Follow me on:',
                        style: TextStyle(
                          color: Colors.blueGrey[300],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.facebook),
                            color: Colors.blueGrey[100],
                            iconSize: 30,
                            onPressed: () {
                              launchInBrowser(fb);
                            }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.instagram),
                            color: Colors.blueGrey[100],
                            iconSize: 30,
                            onPressed: () {
                              launchInBrowser(insta);
                            }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.github),
                            iconSize: 30,
                            color: Colors.blueGrey[100],
                            onPressed: () {
                              launchInBrowser(git);
                            }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            color: Colors.blueGrey[100],
                            iconSize: 30,
                            onPressed: () {
                              launchInBrowser(lin);
                            }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.discord),
                            color: Colors.blueGrey[100],
                            iconSize: 30,
                            onPressed: () {
                              launchInBrowser(discord);
                            }),
                        IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.xbox),
                            color: Colors.blueGrey[100],
                            iconSize: 30,
                            onPressed: () {
                              launchInBrowser(xbox);
                            }),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlatButton(
                      onPressed: (){
                        launch("mailto:jailwalankit@gmail.com");
                      },
                      child: InfoText(
                        type: 'Email',
                        text: 'jailwalankit@gmail.com',
                      ),
                    ),
                    SizedBox(height: 5),
                    FlatButton(
                      onPressed: (){
                          launchInBrowser(add);
                      },
                      child: InfoText(
                        type: 'Address',
                        text:
                            'DIT University, Uttrakhand, India 248009',
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2020 | ANKIT JAILWAL',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
