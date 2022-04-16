import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mb_base_dt/blocs/decision/decision.bloc.dart';
import 'package:mb_base_dt/blocs/splash/splash.bloc.dart';

class BlocProvider extends StatelessWidget {
  const BlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;

    return MultiProvider(
      providers: [
        Provider<DecisionBloc>.value(value: DecisionBloc()),
        Provider<SplashBloc>.value(value: SplashBloc()),
      ],
      child: child,
    );
  }
}
