import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mb_base_dt/app.dart';

import 'package:mb_base_dt/services/logs.service.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Logs.init(
    () => runApp(
      const App(),
    ),
  );
}
