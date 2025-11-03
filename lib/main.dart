import 'package:flutter/material.dart';
import 'pages/login_screen.dart';
import 'pages/register_screen.dart';
import 'pages/home_screen.dart';
import 'pages/row_page.dart';
import 'pages/tambah_pemain_screen.dart';
import 'pages/detail_pemain_screen.dart';

void main() {
  runApp(const KopVerseApp());
}

class KopVerseApp extends StatelessWidget {
  const KopVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KopVerse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B0000)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/row': (context) => const RowPage(),
        '/tambah': (context) => const TambahPemainScreen(),
      },
    );
  }
}
