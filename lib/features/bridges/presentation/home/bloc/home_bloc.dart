import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taipei_bridge_app/core/resources/data_state.dart';
import 'package:taipei_bridge_app/features/bridges/domain/enities/bridge.dart';

import '../../../domain/usecases/get_bridges.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBridgesUseCase _getBridgesUseCase;
  List<BridgeEntity> initialState = [];

  HomeBloc(
    this._getBridgesUseCase
  ) : super(const LoadingHomeState()) {
    on<GetBridgeHomeEvent>(onGetBridges);
    on<ChangeBridgeGroupSizeEvent>(onChangeGroupSize);
  }

  void onGetBridges(GetBridgeHomeEvent event, Emitter<HomeState> emit) async {
    emit(
      const LoadingHomeState()
    );

    final dataState = await _getBridgesUseCase.groupedBridgeEntity();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      initialState = dataState.data ?? [];
      final grouped = _getBridgesUseCase.groupedByAreaCode(event.groupSize, dataState.data!);
      emit(
        LoadedHomeState(grouped, event.groupSize)
      );
    }

    if (dataState is DataFailed) {
      emit(ErrorHomeState(dataState.error!));
    }
  }

  void onChangeGroupSize(ChangeBridgeGroupSizeEvent event, Emitter<HomeState> emit) {
    emit(
      const LoadingHomeState()
    );

    final grouped = _getBridgesUseCase.groupedByAreaCode(event.groupSize ?? 20, initialState);
    emit(
      LoadedHomeState(grouped, event.groupSize)
    );
  }
}