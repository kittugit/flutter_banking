import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:provider/provider.dart';

class ForgotPasswordConfirmationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Container(
      child: singUpCard(_data, context),
    );
  }

  Widget singUpCard(StartupScreenData _data, BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("Confirmation (4 of 4)",
                style: Theme.of(context).textTheme.title),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Your have successfully updated your password",
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              FlatButton(
                child: Text("Done"),
                color: Color(Theme.of(context).primaryColor.value),
                textColor: Colors.white,
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  _data.setStartupScreenMode(StartupScreenMode.LOGIN);
                },
              ),
            ],
          ),
        ]);
  }
}
