import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import 'package:mb_base_dt/blocs/splash/splash.bloc.dart';

import 'package:mb_base_dt/services/logs.service.dart';

import 'package:mb_base_dt/helpers/constants.helper.dart';
import 'package:mb_base_dt/helpers/functions.helper.dart';

import 'package:mb_base_dt/values/strings.dart' as strings;
import 'package:mb_base_dt/styles/colors.dart' as colors;

class SplashScreen extends StatefulWidget {
  static String routeName = strings.routeSplash;

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashBloc bloc = SplashBloc();
  String logctx = 'SPLASH_SCREEN';

  @override
  void initState() {
    super.initState();
    _startTime();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<SplashBloc>(context);
    bloc.init();
  }

  _startTime() {
    Functions.sleep(Constants.timeSplash)
      .then((_) =>
        bloc.redirection()
          .then((String iniScreen) => Navigator.pushNamed(context, iniScreen)))
          .catchError(_handleError)
      .catchError(_handleError);
  }

  _handleError(Object e) => Logs.debug(logctx, 'e', e.toString());

  Widget _body(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset('assets/images/semi_left.png'),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Image.asset('assets/logos/logo.png'),
          ),
        ),
        Lottie.asset(
          'assets/animations/splash_logo.json',
          //width: 500,
          //height: 370,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset('assets/images/semi_right.png'),
        ),
      ],
    );
  }

  // Main:
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: colors.primaryGradient,
          ),
          child: _body(context),
        ),
      ),
    );
  }
}
