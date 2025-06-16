import 'package:e_commerce_app/app/routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
