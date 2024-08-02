import 'package:taipei_bridge_app/features/bridges/data/models/bridge.dart';
import '../../../../core/resources/data_state.dart';

abstract class BridgeRepository {
  Future<DataState<List<BridgeModel>>> getTaipeiBridges();
  Future<DataState<List<BridgeModel>>> getTaipeiFootBridges();
}