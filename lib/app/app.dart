import 'package:flutter/material.dart';
import 'routes.dart';

class PromoWaveApp extends StatelessWidget {
  const PromoWaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PromoWave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
