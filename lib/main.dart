import 'package:flutter/material.dart';
import 'package:time_only_app/pages/choose_location.dart';
import 'package:time_only_app/pages/home.dart';
import 'package:time_only_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
