// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/modules/dashboard/view/dashboard.dart';
import 'package:plant_dashboard/app/modules/home/view/home.dart';
import 'package:plant_dashboard/app/modules/initial/view/initial.dart';
import 'package:plant_dashboard/routes/routes.dart';

class RouteGenerate {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case routeToDashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case routeInitial:
        return MaterialPageRoute(builder: (_) => InitialApp());
      case routeHome:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No routes found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
