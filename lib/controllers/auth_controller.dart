import 'package:flutter/material.dart';

class AuthController {
  // Method untuk login
  void login(
      BuildContext context,
      String username,
      String password,
      TextEditingController usernameController,
      TextEditingController passwordController) {
    // Cek apakah username dan password diisi
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan password harus diisi')),
      );
      return; // Hentikan eksekusi jika ada input yang kosong
    }

    // Implementasi logika autentikasi
    if (username == "user" && password == "password") {
      Navigator.pushReplacementNamed(context, '/welcome');
    } else {
      // Jika login gagal, tampilkan peringatan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau kata sandi salah')),
      );

      // Kosongkan input
      usernameController.clear();
      passwordController.clear();
      print('Login gagal');
    }
  }
}
