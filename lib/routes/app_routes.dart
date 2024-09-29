import 'package:flutter/material.dart';
import 'package:widget/views/auth/login_page.dart'; // Hilangkan spasi setelah '/'
import 'package:widget/home/welcome_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/welcome': (context) => const WelcomePage(),
  };

  // Menggunakan onGenerateRoute untuk menangani rute yang tidak terdaftar
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => const UnknownPage()); // Halaman 404
    }
  }
}

// Halaman untuk menangani rute yang tidak ditemukan
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 Not Found'),
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  }
}
