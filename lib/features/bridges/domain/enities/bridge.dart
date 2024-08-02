import 'package:equatable/equatable.dart';

class BridgeEntity extends Equatable {
  final int id;
  final String name;
  final int areaCode;

  const BridgeEntity({
    required this.id,
    required this.name,
    required this.areaCode,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      areaCode,
    ];
  }
}