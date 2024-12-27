import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            // Placeholder untuk gambar profil
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color.fromARGB(255, 0, 42, 255),
              backgroundImage: const AssetImage('assets/images/profil.jpeg'), // Ganti jalur sesuai dengan lokasi gambar di assets
              onBackgroundImageError: (_, __) => const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kisan Rozin Asrigen',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Universitas Teknologi Yogyakarta',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            // Opsi Pengaturan
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Kelola Akun'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigasi ke ManageAccountScreen
                Navigator.pushNamed(context, '/manageAccount');
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifikasi'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Tambahkan aksi untuk Notifikasi
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Tambahkan aksi untuk Privacy Policy
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Terms of Service'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Tambahkan aksi untuk Terms of Service
              },
            ),
          ],
        ),
      ),
    );
  }
}
