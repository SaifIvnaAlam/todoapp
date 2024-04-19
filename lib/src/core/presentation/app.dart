import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/src/features/home/presentation/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan.shade400,
        ),
      ),
      home: const HomePage(),
    );
  }
}