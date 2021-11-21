import 'dart:convert';

PlantData plantDataFromJson(String str) => PlantData.fromJson(json.decode(str));

String plantDataToJson(PlantData data) => json.encode(data.toJson());

class PlantData {
  PlantData({
    this.dataLength,
    this.message,
    this.data,
  });

  int? dataLength;
  String? message;
  List<Plants>? data;

  factory PlantData.fromJson(Map<String, dynamic> json) => PlantData(
        dataLength: json['dataLength'],
        message: json['message'],
        data: List<Plants>.from(json['data'].map((x) => Plants.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'dataLength': dataLength,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Plants {
  Plants({
    this.id,
    this.plantName,
    this.descriptions,
    this.plantType,
    this.image,
    this.latinName,
    this.v,
  });

  String? id;
  String? plantName;
  String? descriptions;
  String? plantType;
  String? image;
  String? latinName;
  int? v;

  factory Plants.fromJson(Map<String, dynamic> json) => Plants(
        id: json['_id'],
        plantName: json['plantName'],
        descriptions: json['descriptions'],
        plantType: json['plantType'],
        image: json['image'],
        latinName: json['latinName'],
        v: json['__v'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'plantName': plantName,
        'descriptions': descriptions,
        'plantType': plantType,
        'image': image,
        'latinName': latinName,
        '__v': v,
      };
}
