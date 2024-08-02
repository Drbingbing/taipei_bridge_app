import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_bloc.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_event.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/bloc/home_state.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/components/bridge_groups.dart';
import 'package:taipei_bridge_app/features/injection_container.dart';

import '../../../../../core/components/shimmer/shimmer_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(const GetBridgeHomeEvent()),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('台北市陸橋資訊'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, state) {
          return AnimatedSwitcher(
            duration: const Duration(microseconds: 350),
            child: (state is LoadingHomeState)
                ? ShimmerScreen(
                    enabled: true,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        BridgeGroups(),
                      ],
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    children: const [
                      BridgeGroups(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
