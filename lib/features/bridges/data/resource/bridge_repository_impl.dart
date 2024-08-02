import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taipei_bridge_app/features/bridges/data/models/bridge.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/bridge_repository.dart';

class BridgeRepositoryImpl implements BridgeRepository {
  final Dio _dio;

  BridgeRepositoryImpl(this._dio);

  @override
  Future<DataState<List<BridgeModel>>> getTaipeiBridges() async {
    try {
      final response = await _dio.get('/blobfs/Bridges.json');
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> rawData = json.decode(response.data);
        List<BridgeModel> res = rawData.map((f) => BridgeModel.fromJson(f)).toList();
        return DataSuccess(res);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.requestOptions,
            error: response.statusMessage,
            type: DioExceptionType.badResponse,
            response: response,
          )
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<BridgeModel>>> getTaipeiFootBridges() async {
    try {
      final response = await _dio.get('/blobfs/Footbridges.json');
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> rawData = json.decode(response.data);
        List<BridgeModel> res = rawData.map((f) => BridgeModel.fromJson(f)).toList();
        return DataSuccess(res);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.requestOptions,
            error: response.statusMessage,
            type: DioExceptionType.badResponse,
            response: response,
          )
        );
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}