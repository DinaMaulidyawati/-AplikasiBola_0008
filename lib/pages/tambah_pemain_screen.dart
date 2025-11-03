import 'package:flutter/material.dart';
import '../models/player.dart';
import 'detail_pemain_screen.dart';

class TambahPemainScreen extends StatefulWidget {
  const TambahPemainScreen({super.key});

  @override
  State<TambahPemainScreen> createState() => _TambahPemainScreenState();
}

class _TambahPemainScreenState extends State<TambahPemainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _posisiCtrl = TextEditingController();
  final _nomorCtrl = TextEditingController();
  final _negaraCtrl = TextEditingController();
  final _usiaCtrl = TextEditingController();
  final _tinggiCtrl = TextEditingController();
  String? _gender;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final player = Player(
        nama: _namaCtrl.text,
        posisi: _posisiCtrl.text,
        nomor: int.parse(_nomorCtrl.text),
        kewarganegaraan: _negaraCtrl.text,
        usia: int.parse(_usiaCtrl.text),
        tinggi: double.parse(_tinggiCtrl.text),
        jenisKelamin: _gender ?? '',
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPemainScreen(player: player),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text('Tambah Pemain', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildField(_namaCtrl, 'Nama Pemain', 'Nama wajib diisi'),
              _buildField(_posisiCtrl, 'Posisi Pemain', 'Please enter player position'),
              _buildField(_nomorCtrl, 'Nomor Punggung', 'Nomor wajib angka',
                  type: TextInputType.number),
              _buildField(_negaraCtrl, 'Kewarganegaraan', 'Wajib diisi'),
              _buildField(_usiaCtrl, 'Usia Pemain', 'Antara 10–50 tahun',
                  type: TextInputType.number),
              _buildField(_tinggiCtrl, 'Tinggi Pemain (cm)', 'Harus berupa angka',
                  type: TextInputType.number),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: _gender,
                      onChanged: (v) => setState(() => _gender = v),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: _gender,
                      onChanged: (v) => setState(() => _gender = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Tambah Pemain'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController ctrl, String label, String error,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: ctrl,
        keyboardType: type,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        validator: (v) => v == null || v.isEmpty ? error : null,
      ),
    );
  }
}
