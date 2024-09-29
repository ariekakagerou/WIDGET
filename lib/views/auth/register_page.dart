import 'package:flutter/material.dart';
import 'package:widget/controllers/register_controller.dart'; // Hapus spasi yang tidak perlu

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RegisterController registerController = RegisterController();

  bool isSubscribed = true;
  String gender = ''; // Variable to hold the selected gender

  @override
  void dispose() {
    // Dispose the controllers to avoid memory leaks
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Daftar Anggota Baru',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Nama Lengkap
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan alamat email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Nomor Telepon
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  hintText: 'Masukkan nomor telepon',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Tanggal Lahir
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  hintText: 'Masukkan tanggal lahir (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Jenis Kelamin
              const Text('Jenis Kelamin'),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Pria'),
                      leading: Radio<String>(
                        value: 'Pria',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Perempuan'),
                      leading: Radio<String>(
                        value: 'Perempuan',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Kata Sandi
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Kata Sandi',
                  hintText: 'Masukkan kata sandi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Konfirmasi Kata Sandi
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi',
                  hintText: 'Masukkan kembali kata sandi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Checkbox for Offers Subscription
              Row(
                children: [
                  Checkbox(
                    value: isSubscribed,
                    onChanged: (value) {
                      setState(() {
                        isSubscribed = value!;
                      });
                    },
                  ),
                  const Text("Berlangganan penawaran toko"),
                ],
              ),
              const SizedBox(height: 10),
              // Submit Button
              ElevatedButton(
                onPressed: () {
                  registerController.register(
                    context,
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                    dobController.text,
                    gender,
                    passwordController.text,
                    confirmPasswordController.text,
                    isSubscribed,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text('Menjadi Anggota',
                    style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 10),
              // Back to Login
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigasi kembali ke halaman login
                },
                child: const Text('Kembali ke halaman login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
