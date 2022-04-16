import 'package:flutter/material.dart';

import 'package:mb_base_dt/styles/colors.dart' as colors;

class QLoading extends StatefulWidget {
  const QLoading({Key? key}) : super(key: key);

  @override
  QLoadingState createState() => QLoadingState();
}

class QLoadingState extends State<QLoading> {
  @override
  void initState() {
    super.initState();
  }

  Widget progress = const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(colors.loading),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.disabled,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [progress],
      ),
    );
  }
}
