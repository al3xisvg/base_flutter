import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:mb_base_dt/values/strings.dart' as strings;
import 'package:mb_base_dt/styles/colors.dart' as colors;

class OnboardingScreen extends StatefulWidget {
  static String routeName = strings.routeOnboarding;

  const OnboardingScreen({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ScreenState();
}

class ScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  _onDone() {
    Navigator.pushNamed(context, strings.routeDecision);
  }

  List<PageViewModel> pages = [
    PageViewModel(
      title: 'Titulo',
      body: 'Escribir el contenido...',
      image: Center(
        child: Image.asset('assets/images/semi_left.png'),
      ),
      footer: ElevatedButton(
        child: const Text('Call to action!!'),
        onPressed: () {
          // print("--asdasdas--");
        },
        style: ElevatedButton.styleFrom(
          primary: colors.primary,
        ),
      ),
    ),

    PageViewModel(
      title: 'Titulo',
      body: 'Escribir el contenido...',
      image: Center(
        child: Image.asset('assets/images/semi_right.png'),
      ),
      footer: ElevatedButton(
        child: const Text('Call to action!!'),
        onPressed: () {
          // print("--asdasdas--");
        },
        style: ElevatedButton.styleFrom(
          primary: colors.primary,
        ),
      ),
    ),

    PageViewModel(
      title: 'Titulo',
      body: 'Escribir el contenido...',
      image: Center(
        child: Image.asset('assets/images/semi_right.png'),
      ),
      footer: ElevatedButton(
        child: const Text('Call to action!!'),
        onPressed: () {
          // print("--asdasdas--");
        },
        style: ElevatedButton.styleFrom(
          primary: colors.primary,
        ),
      ),
    )
  ];

  Widget _body() {
    return IntroductionScreen(
      pages: pages,
      showBackButton: true,
      showNextButton: true,
      // showSkipButton: true,
      showDoneButton: true,
      back: const Icon(
        Icons.arrow_back_ios,
        color: colors.primary,
      ),
      next: const Icon(
        Icons.arrow_forward_ios,
        color: colors.primary,
      ),
      // skip: const Text("Skip"),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: colors.primary,
        ),
      ),
      onDone: _onDone,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: colors.background,
          child: _body(),
        ),
      ),
    );
  }
}