// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/screens/loading.dart';
import 'package:world_clock/screens/locations.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));
