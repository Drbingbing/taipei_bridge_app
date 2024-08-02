import '../../domain/enities/bridge.dart';

class BridgeModel extends BridgeEntity {
  
  const BridgeModel({
    required super.id,
    required super.name,
    required super.areaCode,
  });

  factory BridgeModel.fromJson(Map<String, dynamic> map) {
    return BridgeModel(
      id: map['ID'],
      name: map['bridge_name'] ?? map['Footbridge_name'],
      areaCode: map['AreaCode'],
    );
  }
}
