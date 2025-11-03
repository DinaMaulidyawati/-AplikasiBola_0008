import 'package:flutter/material.dart';
import '../models/player.dart';

class DetailPemainScreen extends StatelessWidget {
  final Player player;
  const DetailPemainScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text('Detail Pemain', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info('Nama Pemain', player.nama),
            _info('Posisi Pemain', player.posisi),
            _info('Nomor Punggung', player.nomor.toString()),
            _info('Kewarganegaraan', player.kewarganegaraan),
            _info('Usia Pemain', '${player.usia} tahun'),
            _info('Tinggi Badan', '${(player.tinggi / 100).toStringAsFixed(2)} m'),
            _info('Jenis Kelamin', player.jenisKelamin),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF8B0000),
                    side: const BorderSide(color: Color(0xFF8B0000)),
                    minimumSize: const Size(140, 45),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(140, 45),
                  ),
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }
}
