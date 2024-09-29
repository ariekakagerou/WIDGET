import 'package:flutter/material.dart';
import 'package:widget/home/side_menu.dart'; // Sesuaikan nama folder dengan benar
import 'package:widget/home/tab_menu.dart'; // Ganti dengan path yang benar, sesuaikan file yang ingin kamu impor

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Sesuaikan dengan class State yang generic
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      drawer: const SideMenu(), // Side Menu
      body: const TabMenu(), // Pastikan TabMenu diimpor dari file yang benar
    );
  }
}
