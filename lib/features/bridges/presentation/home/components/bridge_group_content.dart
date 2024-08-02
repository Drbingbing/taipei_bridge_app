import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:taipei_bridge_app/features/bridges/domain/enities/bridge.dart';

class BridgeGroupContent extends StatelessWidget {
  final Map<int, List<List<BridgeEntity>>> list;

  const BridgeGroupContent({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final entries = list.entries.toList();

    return Column(
      children: [
        for (int index = 0; index < entries.length; index++)
          Column(
            children: [
              BridgeGroupHeader('------ ${entries[index].key} ------'),
              for (int innerIndex = 0;
                  innerIndex < entries[index].value.length;
                  innerIndex++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BridgeSubGroupHeader('${entries[index].key} ($innerIndex)')
                        .animate()
                        .fade(),
                    const SizedBox(
                      height: 4,
                    ),
                    _BridgeGroupTile(entries[index].value[innerIndex]),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}

class _BridgeGroupTile extends StatelessWidget {
  final List<BridgeEntity> list;

  const _BridgeGroupTile(this.list);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: list
          .map((e) {
            return Material(
              elevation: 0.5,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                child: Text(e.name),
              ),
            );
          })
          .toList()
          .animate()
          .fade(),
    );
  }
}

class BridgeGroupHeader extends StatelessWidget {
  const BridgeGroupHeader(this.header, {super.key});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

class BridgeSubGroupHeader extends StatelessWidget {
  const BridgeSubGroupHeader(this.header, {super.key});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blueAccent,
          ),
        )
      ],
    );
  }
}
