import 'package:flutter/material.dart';
import 'package:plant_dashboard/routes/routes.dart';

class InitialApp extends StatefulWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  _InitialAppState createState() => _InitialAppState();
}

class _InitialAppState extends State<InitialApp> {
  bool isUser = false;

  initialize() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    // if (isUser == false) {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, routeToLogin, (route) => false);
    // } else if (isUser == true) {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, routeToDashboard, (route) => false);
    // }
    Navigator.pushNamedAndRemoveUntil(context, routeHome, (_) => false);
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
