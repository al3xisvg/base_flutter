import 'package:flutter/material.dart';

const Color background = Colors.white;

const Color primary = Color.fromRGBO(12, 198, 101, 1);
const Color secondary = Color.fromARGB(255, 47, 108, 22);
const Color accent = Color.fromRGBO(12, 198, 101, 1);
const Color loading = Color.fromRGBO(12, 198, 101, 1);

const Color disabled = Color.fromRGBO(255, 255, 255, 0.7);

const Color error = Colors.redAccent;
const Color warning = Colors.yellowAccent;
const Color success = Colors.greenAccent;
const Color info = Colors.blueAccent;

const LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primary,
    background,
    primary,
  ],
);
const LinearGradient secondaryGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.5, 0.6],
  colors: [
    Color.fromRGBO(0, 28, 216, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ],
);
