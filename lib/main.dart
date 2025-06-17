import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/core/network/network_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter();
    await Supabase.initialize(
      url: NetworkConstants.supabaseUrl,
      anonKey: NetworkConstants.supabaseAnonKey,
    );
    await init();
  } catch (e) {
    print('Error during initialization: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AUVNET E-commerce App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: AppRoutes.splashRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
