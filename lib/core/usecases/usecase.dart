import 'package:taipei_bridge_app/core/resources/data_state.dart';
import 'package:taipei_bridge_app/features/bridges/domain/enities/bridge.dart';

abstract class BridgeUseCase {
  Future<DataState<List<BridgeEntity>>> groupedBridgeEntity();

  Map<int, List<List<BridgeEntity>>> groupedByAreaCode(int maxGroupSize, List<BridgeEntity> data);
}