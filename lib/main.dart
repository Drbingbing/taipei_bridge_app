import 'package:flutter/material.dart';
import 'package:taipei_bridge_app/features/bridges/presentation/home/screens/home_screen.dart';
import 'package:taipei_bridge_app/features/injection_container.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDepencies();
  runApp(const MainApp(
    initialRoute: HomeScreen.routeName,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: initialRoute,
    );
  }
}
