// ignore_for_file: prefer_const_constructors

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/data/constants.dart';
// import 'package:plant_dashboard/app/widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Constans.primaryColor,
              selectedColor: Constans.primaryColor,
              selectedTitleTextStyle: TextStyle(color: Colors.black87),
              selectedIconColor: Colors.black87,
              // backgroundColor: Colors.amber
              // openSideMenuWidth: 200
            ),
            items: [
              for (var i = 0; i < menuList.length; i++)
                sideMenuItems(menuList, i),
            ],
            controller: controller,
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Container(
                    height: 100,
                    width: 150,
                    color: Constans.secondaryColor,
                  ),
                ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: PageView(
              controller: controller,
              children: [
                menuList[0][3],
                menuList[1][3],
                menuList[2][3],
                menuList[3][3],
              ],
            ),
          )
        ],
      ),
    );
  }

  SideMenuItem sideMenuItems(List<List<dynamic>> menuList, int index) {
    return SideMenuItem(
      onTap: () {
        controller.jumpToPage(index);
      },
      title: menuList[index][0],
      icon: menuList[index][1],
      priority: index,
    );
  }
}
