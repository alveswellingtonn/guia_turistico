import 'package:flutter/material.dart';

import 'screens/Home.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xFF0D47A1),
  accentColor:  Color(0xFF64B5F6),
);

void main() {
  runApp(MaterialApp(
    title: "Guia Turistico",
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: temaPadrao,
  ));
}
