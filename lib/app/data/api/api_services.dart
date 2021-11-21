import 'package:plant_dashboard/app/data/api/api_client.dart';
import 'package:plant_dashboard/app/data/constants.dart';
import 'package:plant_dashboard/app/data/models/plant_data.dart';

class ApiServices {
  final ApiClient _client = ApiClient();
  PlantData? plantData;

  getData() async {
    try {
      // print(plantData);
      return plantData = await _client.get(
        url: Constans.endpoints,
        headers: {
          "Access-Control-Allow-Credentials":
              true, // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
