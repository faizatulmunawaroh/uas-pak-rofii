import 'package:celoe/providers/app_state.dart';
import 'package:celoe/screens/splash_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLOE LMS',
      debugShowCheckedModeBanner: false,
      theme: CeloeTheme.theme,
      home: const SplashScreen(),
    );
  }
}
