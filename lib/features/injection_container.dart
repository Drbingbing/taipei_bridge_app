import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taipei_bridge_app/core/constant/constants.dart';
// import 'package:taipei_bridge_app/features/bridges/data/data_sources/remote/bridge_api_service.dart';
import 'package:taipei_bridge_app/features/bridges/data/resource/bridge_repository_impl.dart';
import 'package:taipei_bridge_app/features/bridges/domain/usecases/get_bridges.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_bloc.dart';

import 'bridges/domain/repository/bridge_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDepencies() async {
  
  sl.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: bridgeBaseUrl)));

  // sl.registerSingleton<BridgeApiService>(BridgeApiService(sl()));
  sl.registerSingleton<BridgeRepository>(BridgeRepositoryImpl(sl()));

  sl.registerSingleton<GetBridgesUseCase>(GetBridgesUseCase(sl()));

  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
}