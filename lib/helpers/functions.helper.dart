import 'package:flutter/material.dart';

import 'package:mb_base_dt/ui/widgets/loading.dart';

import 'package:mb_base_dt/helpers/constants.helper.dart';

import 'package:mb_base_dt/styles/colors.dart' as colors;

class Functions {
  static Future<bool> sleep(int cant, {String? type}) {
    Duration dur = Duration(seconds: cant);
    String tp = type ?? 'seconds';
    if (tp == 'miliseconds') {
      dur = Duration(milliseconds: cant);
    }
    return Future.delayed(dur).then((val) => true);
  }

  static Future<void> startLoading(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const QLoading(),
    );
  }

  static Future<void> endLoading(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void showSnackBarApp(BuildContext context, String type, String msg) {
    Color colorType = Constants.mapColorType[type] ?? colors.info;

    final snackbar = SnackBar(
      content: Row(
        children: <Widget>[
          Container(
            height: 20,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(width: 2, color: colorType)),
            ),
          ),
          Icon(
            Icons.error,
            color: colorType,
            size: 20,
          ),
          SizedBox(
            width: 150,
            child: Text(
              msg,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorType,
                fontSize: 12,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        side: BorderSide(
          width: 2,
          color: colorType,
        ),
      ),
      action: SnackBarAction(
        label: 'x',
        textColor: Colors.black,
        onPressed: () {
          //Scaffold.of(context)
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
