import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String greeting = 'KopVerse';
    if (args is Map && args['email'] != null) {
      greeting = 'Halo, ${args['email'].toString().split('@').first}';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFAEDED), // warna lembut merah muda
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000), // merah Liverpool
        elevation: 0,
        title: const Text(
          'KopVerse',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Greeting
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              greeting,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
          ),

          // 🔹 Carousel Berita
          SizedBox(
            height: 160,
            child: PageView(
              controller: PageController(viewportFraction: 0.9),
              children: [
                _newsCard('Liverpool Menang 3-0 atas Chelsea'),
                _newsCard('Mohamed Salah Cetak Gol Spektakuler!'),
                _newsCard('The Kop Siap Hadapi Derby Merseyside'),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // 🔹 Menu Navigasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menuItem(context, Icons.sports_soccer, 'Player', '/tambah'), // ✅ benar
                _menuItem(context, Icons.calendar_today, 'Jadwal', '/row'), // ✅ benar
                _menuItem(context, Icons.table_chart, 'Klasemen', null),
                _menuItem(context, Icons.shopping_bag, 'Merchandise', null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔸 Widget Berita
  Widget _newsCard(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFF8B0000).withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8B0000),
            ),
          ),
        ),
      ),
    );
  }

  // 🔸 Widget Menu Navigasi
  Widget _menuItem(BuildContext context, IconData icon, String title, String? route) {
    return GestureDetector(
      onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xFF8B0000),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A0000),
            ),
          ),
        ],
      ),
    );
  }
}
