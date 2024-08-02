import 'package:dio/dio.dart';
import 'package:taipei_bridge_app/features/bridges/data/data_sources/remote/birdge_api_service.dart';
import 'package:taipei_bridge_app/features/bridges/data/models/bridge.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repository/bridge_repository.dart';

class BridgeRepositoryImpl implements BridgeRepository {
  final BirdgeApiService _apiService;

  BridgeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<BridgeModel>>> getTaipeiBridges() async {
    try {
      final response = await _apiService.getTaipeiBridges();
      if (response.data != null) {
        return DataSuccess(response.data!);
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
      final response = await _apiService.getTaipeiFootBridges();
      if (response.data != null) {
        return DataSuccess(response.data!);
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