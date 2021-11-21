import 'package:flutter/foundation.dart';
import 'package:plant_dashboard/app/data/models/side_detail_preview_item.dart';

class SideDetailPreviewProvider extends ChangeNotifier {
  List<SideDetailPreviewItem> items = [];

  List<SideDetailPreviewItem> get getItemsList => items;

  addPreviewItems(
    String id,
    String plantName,
    String description,
    String image,
    String latinName,
    String plantType,
  ) {
    SideDetailPreviewItem _item = SideDetailPreviewItem(
      id,
      plantName,
      description,
      image,
      latinName,
      plantType,
    );
    if (items.length >= 1) {
      removePreviewItems();
    }
    items.add(_item);
    notifyListeners();
  }

  // SideDetailPreviewProvider() {
  //   SideDetailPreviewItem _item = SideDetailPreviewItem(
  //     'Pilih data',
  //     'Pilih data',
  //     'Pilih data',
  //     'https://media.istockphoto.com/vectors/error-with-glitch-effect-on-screen-error-404-page-not-found-flat-vector-id1142986365',
  //     'Pilih data',
  //     'Pilih data',
  //   );
  //   items.add(_item);
  //   print(items[0]);
  // }

  removePreviewItems() {
    items.removeAt(0);
    notifyListeners();
  }

  getId(int i) => getItemsList[i].id;
  getDescription(int i) => getItemsList[i].description;
  getLatinName(int i) => getItemsList[i].latinName;
  getPlantName(int i) => getItemsList[i].plantName;
  getPlantType(int i) => getItemsList[i].plantType;
  getImage(int i) => getItemsList[i].image;

  getItemLenght() => items.length;
}
