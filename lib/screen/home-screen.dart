import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StartupScreenData _data = Provider.of<StartupScreenData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            child: Text("Logout", style: TextStyle(color: Colors.white)),
            onPressed: () {
              clearPrefs();
              // _data.setStartupScreenMode(StartupScreenMode.LOGIN);
              // Navigator.of(context).pushNamed("");
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: getUserName(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text("Welcome " + snapshot.data,
                        style: Theme.of(context).textTheme.title));
              } else {
                return Center(
                    child: Text("No User",
                        style: Theme.of(context).textTheme.title));
              }
            },
          ),
          SizedBox(
            height: 100,
          ),
          FutureBuilder(
            future: getApiData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text("Data from API " + snapshot.data,
                        style: Theme.of(context).textTheme.title));
              } else {
                return Center(
                    child: Text("No API Data",
                        style: Theme.of(context).textTheme.title));
              }
            },
          )
        ],
      ),
    );
  }

  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  Future<String> getApiData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String bearer = 'Bearer ' + prefs.getString("access_token");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      'Authorization': bearer
    };

    final response = await http.get(
        "http://10.0.2.2:8080/spring-security-oauth-resource/foos/14",
        headers: requestHeaders);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse['name'];
    } else {
      // If that response was not OK, throw an error.
      return "No Response";
    }
  }

  void clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    prefs.remove("access_token");
    prefs.remove("refresh_token");
  }
}
