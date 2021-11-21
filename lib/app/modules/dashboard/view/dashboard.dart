// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/plant_list_provider.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlantListProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Dashboard'),
        ),
      ),
    );
  }
}
