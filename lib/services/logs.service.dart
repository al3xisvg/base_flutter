import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:logger/logger.dart';

import 'package:mb_base_dt/helpers/constants.helper.dart';

class Logs {
  static void init(var fnApp) async {
    await SentryFlutter.init(
      (options) {
        options.dsn = Constants.sentryDSN;
      },
      appRunner: () => fnApp(),
    );
  }

  static void debug(String ctx, String type, String msg) {
    var logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );
    Logger.level = Constants.isDebug ? Level.debug : Level.error;
    switch (type) {
      case 'd':
        logger.d('[$ctx]:::$msg');
        break;
      case 'i':
        logger.i('[$ctx]:::$msg');
        break;
      case 'w':
        logger.w('[$ctx]:::$msg');
        break;
      case 'e':
        logger.e('[$ctx]:::$msg');
        break;
      case 'c':
        logger.wtf('[$ctx]:::$msg');
        break;
      default:
        logger.i(msg);
        break;
    }
  }

  static void sendError(String exception, String stackTrace) async {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }

  static void sendInfo(String msg) async {
    await Sentry.captureMessage(msg);
  }
}
