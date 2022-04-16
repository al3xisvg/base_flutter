import 'package:shared_preferences/shared_preferences.dart';

import 'package:mb_base_dt/values/strings.dart' as strings;

class SplashBloc {
  init() {
  }

  Future<String> redirection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool(strings.isLogged) ?? false;
    bool isFirstTime = prefs.getBool(strings.isFirstTime) ?? true;
    String iniScreen = '';
    if (isLogged) {
      iniScreen = strings.routeNavigator;
    } else {
      if (isFirstTime) {
        iniScreen = strings.routeOnboarding;
      } else {
        iniScreen = strings.routeDecision;
      }
    }
    return iniScreen;
  }

  dispose() {
  }
}
