import 'package:flutter/material.dart';

import 'package:mb_base_dt/blocs/base/base.bloc.dart';

import 'package:mb_base_dt/ui/screens/routes.dart';

import 'package:mb_base_dt/helpers/constants.helper.dart';

import 'package:mb_base_dt/styles/theme.dart' as apptheme;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: Constants.title,
        theme: apptheme.theme,
        routes: Routes.paths,
        initialRoute: Routes.initialPath,
      ),
    );
  }
}
