import 'package:flutter_banking/api/user-auth/fake-user-auth.dart';
import 'package:flutter_banking/api/user-auth/user-auth.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, Provider, SingleChildCloneableWidget;

import 'api/user-auth/rest-user-auth.dart';
import 'model/startup-screen-data.dart';

class ProviderFactory {
  static final List<SingleChildCloneableWidget> independentServices = [
    Provider<IUserAuthApi>.value(value: FakeUserAuthApi())
  ];
  static final List<SingleChildCloneableWidget> dependentServices = [];
  static final List<SingleChildCloneableWidget> uiConsumableProviders = [
    ChangeNotifierProvider<StartupScreenData>(
        builder: (_) => StartupScreenData())
  ];

  static List<SingleChildCloneableWidget> getProviders(bool mock) {
    List<SingleChildCloneableWidget> providers = [];
    providers.addAll(getIndependentServices(mock));
    providers.addAll(getDependentServices(mock));
    providers.addAll(uiConsumableProviders);
    return providers;
  }

  static List<SingleChildCloneableWidget> getIndependentServices(
      final bool mock) {
    return [
      Provider<IUserAuthApi>.value(
          value: mock ? FakeUserAuthApi() : RestUserAuthApi())
    ];
  }

  static List<SingleChildCloneableWidget> getDependentServices(
      final bool mock) {
    return [];
  }

  static List<SingleChildCloneableWidget> getUIConsumableProviders(
      final bool mock) {
    return [
      ChangeNotifierProvider<StartupScreenData>(
          builder: (_) => StartupScreenData())
    ];
  }
}
