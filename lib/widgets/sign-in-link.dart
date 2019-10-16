import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class SigninLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text(
            "Already have an account?",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, bottom: 5),
              child: InkWell(
                onTap: () {
                  _data.setStartupScreenMode(StartupScreenMode.LOGIN);
                },
                // textColor: Theme.of(context).primaryColor,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
