import 'package:taipei_bridge_app/core/resources/data_state.dart';
import 'package:taipei_bridge_app/core/usecases/usecase.dart';
import 'package:taipei_bridge_app/features/bridges/domain/enities/bridge.dart';
import 'package:taipei_bridge_app/features/bridges/domain/repository/bridge_repository.dart';

class GetBridgesUseCase implements BridgeUseCase {
  final BridgeRepository _bridgeRepository;

  GetBridgesUseCase(this._bridgeRepository);

  @override
  Future<DataState<List<BridgeEntity>>> groupedBridgeEntity() async {
    final bridgesState = await _bridgeRepository.getTaipeiBridges();
    final footBridgesState = await _bridgeRepository.getTaipeiFootBridges();
    
    List<BridgeEntity> result = [];
    if (bridgesState is DataSuccess && bridgesState.data!.isNotEmpty) {
      result.addAll(bridgesState.data!);
    }
    if (footBridgesState is DataSuccess && footBridgesState.data!.isNotEmpty) {
      result.addAll(footBridgesState.data!);
    }
    return DataSuccess(result);
  }
  
  @override
  Map<int, List<List<BridgeEntity>>> groupedByAreaCode(int maxGroupSize, List<BridgeEntity> data) {
    return _separateBridgesIntoGroups(data, maxGroupSize);
  }

  Map<int, List<List<BridgeEntity>>> _separateBridgesIntoGroups(List<BridgeEntity> array, int groupSize) {
    Map<int, List<BridgeEntity>> bridgeGroups = {};

    for (var bridge in array) {
      if (!bridgeGroups.containsKey(bridge.areaCode)) {
        bridgeGroups[bridge.areaCode] = [];
      }
      bridgeGroups[bridge.areaCode]!.add(bridge);
    }

    Map<int, List<List<BridgeEntity>>> result = {};

    bridgeGroups.forEach((key, group) {
      List<List<BridgeEntity>> subgroups = [];
      List<BridgeEntity> currentGroup = [];

      for (var bridge in group) {
        if (currentGroup.length >= groupSize) {
          subgroups.add(currentGroup);
          currentGroup = [];
        }
        currentGroup.add(bridge);
      }

      if (currentGroup.isNotEmpty) {
        subgroups.add(currentGroup);
      }

      result[key] = subgroups;
    }); 

    return result;
  }
}