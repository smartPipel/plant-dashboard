import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_dashboard/app/modules/create_page/view/create_page.dart';
import 'package:plant_dashboard/app/modules/dashboard/view/dashboard.dart';
import 'package:plant_dashboard/app/modules/plant_list/view/plant_list.dart';
import 'package:plant_dashboard/app/modules/settings/view/settings.dart';
import 'package:responsive_table/DatatableHeader.dart';

class Constans {
  // Constans._();
  static const String baseUrl = 'https://plant-api.smartpipel.repl.co';
  static const String endpoints = '$baseUrl/api/plant';

  static const Color primaryColor = Color(0xFFCAF7E3);
  static const Color secondaryColor = Color(0xFF5AA469);
  static const Color darkColor = Color(0xFF52575D);
  static TextStyle defaultTextStyle = GoogleFonts.poppins();
  static String defaultFontFamily = defaultTextStyle.fontFamily!;

  static width(BuildContext _) => MediaQuery.of(_).size.width;
  static height(BuildContext _) => MediaQuery.of(_).size.height;
  static defaultWidth(BuildContext context) => width(context);
  static defaultHeight(BuildContext context) => height(context);
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

List<DataColumn> dataTableHeader = [
  const DataColumn(
    label: Text('ID'),
    tooltip: 'id',
  ),
  const DataColumn(
    label: Text('PLANT NAME'),
    tooltip: 'plant_name',
  ),
  const DataColumn(
    label: Text('DESCRIPTIONS'),
    tooltip: 'descriptions',
  ),
  const DataColumn(
    label: Text('PLANT TYPE'),
    tooltip: 'plant_type',
  ),
  const DataColumn(
    label: Text('LATIN NAME'),
    tooltip: 'latin_name',
  ),
  const DataColumn(
    label: Text('IMAGE'),
    tooltip: 'image',
  ),
];
