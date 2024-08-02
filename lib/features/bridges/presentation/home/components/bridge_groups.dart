import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_bloc.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_event.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_state.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/components/bridge_group_content.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/components/bridge_numbers_menu.dart';

class BridgeGroups extends StatelessWidget {
  const BridgeGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if (state is LoadingHomeState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '陸橋、橋樑群組',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '陸橋、橋樑群組',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      '每筆最大數量:',
                      style: TextStyle(fontSize: 13, color: Colors.black26),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    BirdgeNumbersMenu(
                      initialValue: state.groupSize,
                      numbers: List.generate(20, (index) => index + 1),
                      onTap: (groupSize) {
                        _onChangeGroupSizeButtonTapped(context, groupSize);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BridgeGroupContent(list: state.grouped ?? {})
              ],
            ),
          );
        }
      },
    );
  }

  void _onChangeGroupSizeButtonTapped(BuildContext context, int groupSize) {
    BlocProvider.of<HomeBloc>(context)
        .add(ChangeBridgeGroupSizeEvent(groupSize));
  }
}
