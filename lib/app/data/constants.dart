import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_dashboard/app/modules/create_page/view/create_page.dart';
import 'package:plant_dashboard/app/modules/dashboard/view/dashboard.dart';
import 'package:plant_dashboard/app/modules/plant_list/view/plant_list.dart';
import 'package:plant_dashboard/app/modules/settings/view/settings.dart';

class Constans {
  // Constans._();
  static const String ip = '104';
  static const String baseUrl = 'http://192.168.0.$ip:3000';
  static const String endpoints = '$baseUrl/api/plant';

  static const Color primaryColor = Color(0xFFCAF7E3);
  static const Color secondaryColor = Color(0xFF5AA469);
  static const Color darkColor = Color(0xFF52575D);
  static TextStyle defaultTextStyle = GoogleFonts.poppins();
  static String defaultFontFamily = defaultTextStyle.fontFamily!;
}

List<List<dynamic>> menuList = [
  [
    'Dashboard',
    Icons.dashboard,
    Constans.darkColor,
    const Dashboard(),
  ],
  [
    'List Data',
    Icons.view_agenda,
    Constans.darkColor,
    const PlantListPage(),
  ],
  [
    'Create',
    Icons.create,
    Constans.darkColor,
    const CreatePage(),
  ],
  [
    'Settings',
    Icons.settings,
    Constans.darkColor,
    const SettingsPage(),
  ],
];
