import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _konfirmasiCtrl = TextEditingController();
  String? _gender;

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registrasi berhasil!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: const Text('Registrasi Pengguna', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaCtrl,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (v) => v!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _alamatCtrl,
                decoration: const InputDecoration(labelText: 'Alamat Lengkap'),
                validator: (v) => v!.isEmpty ? 'Alamat wajib diisi' : null,
              ),
              TextFormField(
                controller: _teleponCtrl,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Nomor telepon wajib diisi';
                  if (v.length < 10 || v.length > 15 || int.tryParse(v) == null) {
                    return 'Nomor telepon tidak valid';
                  }
                  return null;
                },
              ),
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
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email wajib diisi';
                  if (!v.contains('@') || !v.endsWith('@gmail.com')) {
                    return 'Gunakan email @gmail.com';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Kata Sandi'),
                validator: (v) =>
                    v!.length < 6 ? 'Minimal 6 karakter' : null,
              ),
              TextFormField(
                controller: _konfirmasiCtrl,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
                validator: (v) =>
                    v != _passCtrl.text ? 'Kata sandi tidak sama' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B0000),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Daftar', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Sudah punya akun? Masuk di sini'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
