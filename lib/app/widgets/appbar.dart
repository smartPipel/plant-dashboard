// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/data/constants.dart';
import 'package:plant_dashboard/routes/routes.dart';

PreferredSize customAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            color: Constans.primaryColor,
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width * .4,
        height: 100,
        margin: EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            actionMenu(context, Icons.dashboard, 'Dashboard',
                namedRoute: routeToDashboard),
            SizedBox(width: 40),
            actionMenu(context, Icons.view_agenda, 'Data',
                namedRoute: routeToDataList),
            SizedBox(width: 40),
            actionMenu(context, Icons.create, 'Add Data',
                namedRoute: routeToAddData),
            SizedBox(width: 40),
            actionMenu(context, Icons.settings, 'Settings',
                namedRoute: routeToSettings),
            SizedBox(width: 40),
            actionMenu(context, Icons.logout, 'Log Out', function: logOut),
          ],
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      // bottom: PreferredSize(child: Container(),preferredSize: Size.fromHeight(100),),
    ),
  );
}

void logOut() {
  print('logout');
}

actionMenu(BuildContext context, IconData icon, String title,
    {String? namedRoute, Function? function}) {
  return GestureDetector(
    onTap: () => {
      if (namedRoute != null)
        {Navigator.popAndPushNamed(context, namedRoute)}
      else
        {function!}
    },
    child: Container(
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade200,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(3.0, 3.0),
              spreadRadius: 0.0,
              color: Colors.grey.shade300,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Constans.darkColor,
            ),
            Text(title)
          ],
        ),
      ),
    ),
  );
}
