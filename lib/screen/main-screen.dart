import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:flutter_banking/provider/startup-screen-profider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            lowerHalf(screenHeight, context),
            //upperHalf(context),
            // _StartupPageProvider.get( _data.getStartupScreenMode),
            content(_data.getStartupScreenMode, screenHeight),
            pageTitle(context),
          ],
        ),
      ),
    );
  }

  Widget pageTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/logo.png',
              height: 100,
              width: MediaQuery.of(context).size.width * 3 / 4,
            ),
          ),

          // Text(
          //   "BANK",
          //   style: TextStyle(
          //       fontSize: 34, color: Colors.white, fontWeight: FontWeight.w400),
          // )
        ],
      ),
    );
  }

  Widget upperHalf(double screenHeight) {
    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/bank.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget content(StartupScreenMode startupScreenMode, double screenHeight) {
    return Container(
        margin: EdgeInsets.only(top: screenHeight / 4),
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(children: <Widget>[
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: StartupScreenProvider.get(startupScreenMode))),
          StartupScreenProvider.getBottomLink(startupScreenMode)
        ]));
  }

  Widget lowerHalf(double screenHeight, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.brown[600],
              Colors.brown[500],
              Colors.brown[400],
              Colors.brown[300],
            ],
          ),
        ),
        height: screenHeight * 6 / 10,
        // color: Color(Theme.of(context).primaryColor.value),
      ),
    );
  }
}
