import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mb_base_dt/styles/colors.dart' as colors;

class Constants {
  static String title = 'Zinout Culture';
  static String weburl = dotenv.env['WEB_DOMAIN']!;
  static String apiurl = '${dotenv.env['API_URL']}${dotenv.env['API_CTX']}';
  static bool isDebug = dotenv.env['DART_ENV'] != 'production';
  static int timeSplash = int.parse(dotenv.env['TIME_SPLASH'] ?? '1');
  static String sentryDSN = dotenv.env['SENTRY_DSN']!;
  static Map<String, Color> mapColorType = {
    'error': colors.error,
    'warning': colors.warning,
    'success': colors.success,
    'info': colors.info,
  };
  static List<Map<String, dynamic>> countries = [
    {
      'name': 'argentina',
      'title': 'Argentina',
      'iconUrl': 'assets/icons/argentina.png',
      'prefix': '+54',
      'tam': 9
    },
    {
      'name': 'brazil',
      'title': 'Brasil',
      'iconUrl': 'assets/icons/brasil.png',
      'prefix': '+55',
      'tam': 9
    },
    {
      'name': 'chile',
      'title': 'Chile',
      'iconUrl': 'assets/icons/chile.png',
      'prefix': '+56',
      'tam': 9
    },
    {
      'name': 'colombia',
      'title': 'Colombia',
      'iconUrl': 'assets/icons/colombia.png',
      'prefix': '+57',
      'tam': 9
    },
    {
      'name': 'costarica',
      'title': 'Costa Rica',
      'iconUrl': 'assets/icons/costarica.png',
      'prefix': '+506',
      'tam': 9
    },
    {
      'name': 'ecuador',
      'title': 'Ecuador',
      'iconUrl': 'assets/icons/ecuador.png',
      'prefix': '+593',
      'tam': 9
    },
    {
      'name': 'mexico',
      'title': 'México',
      'iconUrl': 'assets/icons/mexico.png',
      'prefix': '+52',
      'tam': 9
    },
    {
      'name': 'peru',
      'title': 'Perú',
      'iconUrl': 'assets/icons/peru.png',
      'prefix': '+51',
      'tam': 9
    },
    {
      'name': 'uruguay',
      'title': 'Uruguay',
      'iconUrl': 'assets/icons/uruguay.png',
      'prefix': '+598',
      'tam': 9
    },
    {
      'name': 'spain',
      'title': 'España',
      'iconUrl': 'assets/icons/espana.png',
      'prefix': '+34',
      'tam': 9
    },
    {
      'name': 'eeuu',
      'title': 'USA',
      'iconUrl': 'assets/icons/eeuu.png',
      'prefix': '+1',
      'tam': 9
    }
  ];
}
