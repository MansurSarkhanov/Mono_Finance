import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mono/Config/Hive/hive_boxs_manager.dart';
import 'package:mono/app_routes.dart';
import 'package:mono/injection.dart';

import 'Config/App/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await AppConfig.config.init();
  await HiveConfigManager.config.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Mono',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        useMaterial3: true,
      ),
     
    );
  }
}
