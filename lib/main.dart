import 'package:e_commerce_app/app/routes.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pnmwhbfqkwiksdqmpzgl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBubXdoYmZxa3dpa3NkcW1wemdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAwOTE3MTMsImV4cCI6MjA2NTY2NzcxM30.At64qFi0SNKOQ2DrSolCC22VrNj1WgTcDszZXGwKNsw',
  );

  await init();

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
