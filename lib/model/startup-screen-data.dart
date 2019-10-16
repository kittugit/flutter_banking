import 'package:flutter/material.dart';
import 'package:flutter_banking/model/startup-screen-mode.dart';

class StartupScreenData with ChangeNotifier {
  StartupScreenData();

  StartupScreenMode _startupScreenMode = StartupScreenMode.LOGIN;

  void setStartupScreenMode(StartupScreenMode selction) {
    _startupScreenMode = selction;
    notifyListeners();
  }

  StartupScreenMode get getStartupScreenMode => _startupScreenMode;
}
