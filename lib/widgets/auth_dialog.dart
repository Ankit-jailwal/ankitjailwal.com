import 'package:flutter/material.dart';

class AuthDialog extends StatefulWidget {
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'ANKIT JAILWAL',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline1.color,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(child: Image.asset("assets/images/gpay.png",width: 220,)),
                SizedBox(height: 7),
                Center(child: Text("jailwalankit@okhdfcbank",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)),
                SizedBox(height: 30),
                Center(child: Text("Ankit Jailwal",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),)),
                SizedBox(height: 10),
                Center(child: Text("jailwalankit@gmail.com",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:Theme.of(context).brightness == Brightness.dark?Colors.white70:Colors.black87),)),
                Center(child: Text("+91 87089 17205",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:Theme.of(context).brightness == Brightness.dark?Colors.white70:Colors.black87),)),
                SizedBox(height: 15),
                Center(child: Text("Scan if you love BIRYANIss",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Theme.of(context).brightness == Brightness.dark?Colors.white70:Colors.black87),)),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40.0,
                    right: 40.0,
                  ),
                  child: Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.blueGrey[200],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset("assets/images/gpaylogo.png"),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
