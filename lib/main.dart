import 'package:flutter/material.dart';
import 'package:flutter_banking/provider-factory.dart';
import 'package:flutter_banking/screen/home-screen.dart';
import 'package:flutter_banking/screen/main-screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
final bool mock = false;
final _primaryColor = Colors.brown;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            title: TextStyle(fontSize: 23.0, color: _primaryColor),
            subtitle: TextStyle(fontSize: 15.0, color: _primaryColor),
            body1: TextStyle(
                fontSize: 13.0, fontFamily: 'Hind', color: _primaryColor),
            subhead: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          // fontFamily: 'Montserrat',
          primarySwatch: _primaryColor,
          buttonTheme:
              ButtonThemeData(buttonColor: Theme.of(context).primaryColor),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(fontSize: 13, color: _primaryColor),
          )),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _getRoute,
      home: MultiProvider(
        providers: ProviderFactory.getProviders(mock),
        child: MainScreen(),
      ),
    );
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}

Route _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/home":
      return _buildRoute(settings, new HomeScreen());
      break;
    default:
      return _buildRoute(settings, MainScreen());
  }
}
