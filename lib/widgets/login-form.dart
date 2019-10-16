import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_banking/api/user-auth/user-auth.dart';
import 'package:flutter_banking/model/login-response.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';
import 'package:flutter_banking/model/startup-screen-data.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: loginCard(context),
    );
  }

  Widget loginCard(BuildContext context) {
    StartupScreenData _data = Provider.of<StartupScreenData>(context);
    IUserAuthApi _api = Provider.of<IUserAuthApi>(context);
    LoginResponse _response = LoginResponse(false, false, "", null, null);
    String _userName;
    String _password;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      log(_response.isProgress.toString());
      return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign-in",
                  style: Theme.of(context).textTheme.title,
                ),
              )),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                  // style: TextStyle(fontSize: 10),
                  decoration: InputDecoration(
                      labelText: "Username", hasFloatingPlaceholder: true),
                  onSaved: (val) => {
                        setState(() {
                          _userName = val;
                        }),
                      }),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hasFloatingPlaceholder: true,
                    border: OutlineInputBorder()),
                onSaved: (val) => {
                  setState(() {
                    _password = val;
                  }),
                },
              ),
              SizedBox(
                height: 20,
              ),
              !(_response != null && _response.isProgress)
                  ? FlatButton(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 15),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.only(
                          left: 100, right: 100, top: 13, bottom: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        _formKey.currentState.save();
                        setState(() {
                          _response =
                              LoginResponse(true, false, "", null, null);
                        });

                        _api.login(_userName, _password).then((value) {
                          print(value);
                          if (value.isSuccess) {
                            Navigator.of(context).pushNamed("/home");
                          } else {
                            final snackBar =
                                SnackBar(content: Text(value.toString()));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                          setState(() {
                            _response = value;
                          });
                        });

                        // _data.setStartupScreenMode(StartupScreenMode.LOGIN);
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      _data.setStartupScreenMode(
                          StartupScreenMode.FORGOTUSERNAME);
                    },
                    child: Text("Forgot Username",
                        style: Theme.of(context).textTheme.subtitle),
                  ),
                  Text("|", style: Theme.of(context).textTheme.title),
                  MaterialButton(
                      onPressed: () {
                        _data.setStartupScreenMode(
                            StartupScreenMode.FORGOTPASSWORD);
                      },
                      child: Text("Reset Password",
                          style: Theme.of(context).textTheme.subtitle))
                ],
              ),
            ],
          ));
    });
  }
}

class IUserProfileApi {}
