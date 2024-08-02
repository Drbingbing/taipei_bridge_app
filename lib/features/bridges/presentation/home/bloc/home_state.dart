import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:taipei_bridge_app/features/bridges/domain/enities/bridge.dart';

abstract class HomeState extends Equatable {
  final Map<int, List<List<BridgeEntity>>>? grouped;
  final int groupSize;
  final DioException? dioException;

  const HomeState({this.grouped, this.dioException, this.groupSize = 20});

  @override
  List<Object> get props => [grouped!, dioException!];
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState();
}

class LoadedHomeState extends HomeState {
  const LoadedHomeState(Map<int, List<List<BridgeEntity>>> grouped, int groupSize) : super(grouped: grouped, groupSize: groupSize);
}

class ErrorHomeState extends HomeState {
  const ErrorHomeState(DioException dioException) : super(dioException: dioException); 
}