import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_dashboard/app/data/api/api.dart';
import 'package:plant_dashboard/app/data/models/plant_data.dart';

class ApiClient implements Api {
  static final ApiClient _apiClient = ApiClient._singleTon();
  static final Dio _client = Dio();
  static PlantData? _plantData;

  factory ApiClient() {
    return _apiClient;
  }
  ApiClient._singleTon();

  printError(String judul, String errorMessage) {
    print('$judul: \n' + errorMessage);
  }

  @override
  delete({
    String? url,
    Map<String, String>? headers,
  }) async {
    return await _client
        .delete(url!,
            options: Options(
              headers: headers,
            ))
        .then((res) {
      // callback!(res.statusCode == 200,
      //     res.statusCode == 200 ? 'Sukses' : 'Gagal', res.data);
      _plantData = PlantData.fromJson(res.data);
      debugPrint(res.data + '\n' + 'Status: ' + res.statusCode);

      return _plantData;
    }).catchError((err) {
      printError('Gagal delete', err.toString());
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      printError('Gagal delete', 'Timeout');
    });
  }

  @override
  get({
    String? url,
    Map<String, dynamic>? headers,
  }) async {
    return await _client
        .get(url!,
            options: Options(
              headers: headers,
            ))
        .then((res) {
      _plantData = PlantData.fromJson(res.data);
      print('${res.statusCode}');

      return _plantData;
      // callback!(res.statusCode == 200,
      // res.statusCode == 200 ? 'Sukses' : 'Gagal', res.data);
    }).catchError((err) {
      // callback!(false, err.toString(), err);
      printError('Gagal get data', err.toString());
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      // callback!(false, 'request timeout', {'message': 'timeout'});
      printError('Gagal get data', 'Timeout');
    });
  }

  @override
  post({
    String? url,
    Map<String, String>? headers,
    Map<String, String>? body,
  }) async {
    return await _client
        .post(url!,
            options: Options(
              headers: headers,
            ),
            data: body)
        .then((res) {
      // callback!(res.statusCode == 200,
      //     res.statusCode == 200 ? 'Sukses' : 'Gagal', res.data);
      return res.data;
    }).catchError((err) {
      // callback!(false, err.toString(), err);
      printError('Gagal upload data', err.toString());
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      // callback!(false, 'request timeout', {'message': 'timeout'});
      printError('Gagal upload data', 'Timeout');
    });
  }

  @override
  put({
    String? url,
    Map<String, String>? headers,
    Map<String, String>? body,
  }) async {
    return await _client
        .put(url!,
            options: Options(
              headers: headers,
            ),
            data: body)
        .then((res) {
      // callback!(res.statusCode == 200,
      // res.statusCode == 200 ? 'Sukses' : 'Gagal', res.data);
      return res.data;
    }).catchError((err) {
      // callback!(false, err.toString(), err);
      printError('Gagal update data', err.toString());
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      // callback!(false, 'request timeout', {'message': 'timeout'});
      printError('Gagal update data', 'Timeout');
    });
  }
}
