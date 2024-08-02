import 'package:flutter/material.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/screens/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}