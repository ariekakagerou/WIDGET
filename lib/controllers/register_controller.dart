import 'package:flutter/material.dart';

class RegisterController {
  // Method untuk meng-handle registrasi
  void register(
      BuildContext context,
      String name,
      String email,
      String phone,
      String dob,
      String gender,
      String password,
      String confirmPassword,
      bool isSubscribed) {
    // Validasi untuk memastikan semua kolom yang diperlukan diisi
    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        dob.isEmpty ||
        gender.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showMessage(context, 'Semua kolom harus diisi.');
      return;
    }

    // Validasi format email
    if (!_isValidEmail(email)) {
      _showMessage(context, 'Format email tidak valid.');
      return;
    }

    // Validasi nomor telepon (minimal 10 angka)
    if (!_isValidPhone(phone)) {
      _showMessage(context, 'Nomor telepon tidak valid.');
      return;
    }

    // Validasi kata sandi dan konfirmasi kata sandi
    if (password != confirmPassword) {
      _showMessage(context, 'Kata sandi dan konfirmasi tidak cocok.');
      return;
    }

    // Logika untuk pendaftaran di sini
    // Misalnya, simpan data ke database atau panggil API registrasi

    // Jika pendaftaran berhasil
    _showMessage(context, 'Pendaftaran berhasil!');

    // Arahkan ke halaman login setelah berhasil registrasi
    Navigator.pop(context);
  }

  // Method untuk menampilkan pesan error atau sukses
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Method untuk validasi format email
  bool _isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(email);
  }

  // Method untuk validasi nomor telepon (cek apakah nomor memiliki panjang yang cukup)
  bool _isValidPhone(String phone) {
    final RegExp phoneRegex = RegExp(r'^[0-9]{10,}$');
    return phoneRegex.hasMatch(phone);
  }
}
