import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class SignupLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text("First time log-in?",
              style: Theme.of(context).textTheme.subtitle),
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: InkWell(
                onTap: () {
                  _data.setStartupScreenMode(StartupScreenMode.SINGUP1OF3);
                },
                // textColor: Theme.of(context).primaryColor,
                child:
                    Text("Sign up", style: Theme.of(context).textTheme.title),
              ))
        ],
      ),
    );
  }
}
