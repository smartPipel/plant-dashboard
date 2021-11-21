import 'package:flutter/material.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/plant_list_provider.dart';
import 'package:plant_dashboard/app/modules/plant_list/provider/side_detail_preview_provider.dart';
import 'package:plant_dashboard/routes/route_generate.dart';
import 'package:plant_dashboard/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<PlantListProvider>(
            create: (_) => PlantListProvider()),
        ChangeNotifierProvider<SideDetailPreviewProvider>(
            create: (_) => SideDetailPreviewProvider()),
      ],
      child: const MaterialApp(
        onGenerateRoute: RouteGenerate.generate,
        initialRoute: routeInitial,
        debugShowCheckedModeBanner: false,
      ),
    ));
