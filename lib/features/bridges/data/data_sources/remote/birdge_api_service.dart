import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taipei_bridge_app/features/bridges/data/models/bridge.dart';

class BirdgeApiService {

  final Dio _dio;

  BirdgeApiService(this._dio);

  Future<Response<List<BridgeModel>>> getTaipeiBridges() async {
    final response = await _dio.get('/blobfs/Bridges.json');
    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> rawData = json.decode(response.data);
      return Response(
        requestOptions: response.requestOptions,
        data: rawData.map((f) => BridgeModel.fromJson(f)).toList()
      );
    } else {
      return Response(requestOptions: response.requestOptions);
    }
  }

  Future<Response<List<BridgeModel>>> getTaipeiFootBridges() async {
    final response = await _dio.get('/blobfs/Footbridges.json');
    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> rawData = json.decode(response.data);
      return Response(
        requestOptions: response.requestOptions,
        data: rawData.map((f) => BridgeModel.fromJson(f)).toList()
      );
    } else {
      return Response(requestOptions: response.requestOptions);
    }
  }
}