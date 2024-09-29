import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header Menu Utama dengan background orange
          Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Menu utama',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // Warna teks putih agar kontras dengan background
              ),
            ),
          ),
          const Divider(),
          // List untuk TENTANG
          const ExpansionTile(
            title: Text('TENTANG'),
            children: [],
          ),
          // List untuk ANGGOTA
          const ExpansionTile(
            title: Text('ANGGOTA'),
            children: [],
          ),
          // List untuk BERITA
          const ExpansionTile(
            title: Text('BERITA'),
            children: [],
          ),
          // List untuk MUSIK
          const ExpansionTile(
            title: Text('MUSIK'),
            children: [],
          ),
          // List untuk JADWAL
          const ExpansionTile(
            title: Text('JADWAL'),
            children: [],
          ),
          // List untuk TOKO
          ExpansionTile(
            title: const Text('TOKO'),
            children: [
              ListTile(
                title: const Text('Semua produk'),
                onTap: () {
                  // Navigasi ke halaman produk
                },
              ),
              ListTile(
                title: const Text('Foto kehidupan'),
                onTap: () {
                  // Navigasi ke halaman foto kehidupan
                },
              ),
              ListTile(
                title: const Text('Barang perifer'),
                onTap: () {
                  // Navigasi ke halaman barang perifer
                },
              ),
              ListTile(
                title: const Text('Lingkungan peringatan acara'),
                onTap: () {
                  // Navigasi ke halaman peringatan acara
                },
              ),
              ListTile(
                title: const Text('Merchandise peringatan perilisan tunggal'),
                onTap: () {
                  // Navigasi ke halaman merchandise tunggal
                },
              ),
              ListTile(
                title: const Text('Area pre-order/spot ulang tahun anggota'),
                onTap: () {
                  // Navigasi ke halaman pre-order ulang tahun
                },
              ),
            ],
          ),
          // List untuk FANCLUB
          const ExpansionTile(
            title: Text('FANCLUB'),
            children: [],
          ),
          // List untuk KONTAK
          ExpansionTile(
            title: const Text('KONTAK'),
            children: [
              ListTile(
                title: const Text('Pertanyaan Umum'),
                onTap: () {
                  // Navigasi ke halaman pertanyaan umum
                },
              ),
            ],
          ),
          const Divider(),

          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, '/login'); // Navigasi ke Login
            },
          ),
        ],
      ),
    );
  }
}
