import 'package:flutter/cupertino.dart';
import 'package:plant_dashboard/app/data/api/api_services.dart';
import 'package:plant_dashboard/app/data/models/plant_data.dart';

class PlantListProvider with ChangeNotifier {
  PlantData? plantData;
  bool loading = false;

  getPlantData() async {
    setLoading(true);
    notifyListeners();
    plantData = await ApiServices().getData();
    setLoading(false);
    notifyListeners();
  }

  _getMapData(data, int i) => plantData!.data!.map(data).toList()[i].toString();

  getDescription(int i) => _getMapData((e) => e.descriptions, i);
  getPlantName(int i) => _getMapData((e) => e.plantName, i);
  getPlantType(int i) => _getMapData((e) => e.plantType, i);
  getLatinName(int i) => _getMapData((e) => e.latinName, i);
  getImage(int i) => _getMapData((e) => e.image, i);
  getId(int i) => _getMapData((e) => e.id, i);

  getDataLength() => plantData!.dataLength;

  bool isLoading() => loading;

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
