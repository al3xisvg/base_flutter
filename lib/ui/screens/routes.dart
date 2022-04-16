import 'package:flutter/material.dart';

import 'package:mb_base_dt/ui/screens/splash/splash.screen.dart';
import 'package:mb_base_dt/ui/screens/onboarding/onboarding.screen.dart';
import 'package:mb_base_dt/ui/screens/decision/decision.screen.dart';

class Routes {
  static String initialPath = SplashScreen.routeName;

  static Map<String, WidgetBuilder> paths = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    OnboardingScreen.routeName: (context) => const OnboardingScreen(),
    DecisionScreen.routeName: (context) => const DecisionScreen(),
  };
}
