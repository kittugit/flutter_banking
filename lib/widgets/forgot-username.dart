import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class ForgotUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child:
              Text("Forgot Username", style: Theme.of(context).textTheme.title),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Enter your registered email",
          style: Theme.of(context).textTheme.subtitle,
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          decoration:
              InputDecoration(labelText: "Email", hasFloatingPlaceholder: true),
        ),
        SizedBox(
          height: 100,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _data.setStartupScreenMode(StartupScreenMode.LOGIN);
                },
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                child: Text("Next"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _data.setStartupScreenMode(
                      StartupScreenMode.FORGOTUSERNAMECONFIRMATION);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
