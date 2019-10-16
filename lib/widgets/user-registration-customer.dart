import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class RegistrationCustomerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Container(
      child: singUpCard(_data, context),
    );
  }

  Widget spacer() {
    return SizedBox(height: 10);
  }

  Widget singUpCard(StartupScreenData _data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text("Sign-up - (2 of 3)",
              style: Theme.of(context).textTheme.title),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Enter customer details",
          style: Theme.of(context).textTheme.subtitle,
        ),
        spacer(),
        TextFormField(
          decoration:
              InputDecoration(labelText: "Email", hasFloatingPlaceholder: true),
        ),
        spacer(),
        TextFormField(
          decoration:
              InputDecoration(labelText: "SSN", hasFloatingPlaceholder: true),
        ),
        spacer(),
        TextFormField(
          decoration: InputDecoration(
              labelText: "User name", hasFloatingPlaceholder: true),
        ),
        spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
              color: Color(Theme.of(context).primaryColor.value),
            ),
            SizedBox(
              width: 20,
            ),
            FlatButton(
              child: Text("Next"),
              color: Color(Theme.of(context).primaryColor.value),
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                _data.setStartupScreenMode(StartupScreenMode.SINGUP3OF3);
              },
            ),
          ],
        ),
      ],
    );
  }
}
