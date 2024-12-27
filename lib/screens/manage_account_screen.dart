import 'package:flutter/material.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 42, 255),
        title: const Text('Kelola Akun', style: TextStyle(color: Colors.white)),
        elevation: 4,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // Gambar profil pengguna
              CircleAvatar(
                radius: 60,
                backgroundColor: const Color.fromARGB(255, 54, 133, 229),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 42, 255),
                ),
              ),
              Text(
                'Asal Universitas',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              // Form Input untuk Email, Nama, Nomor Telepon, dan Alamat
              _buildTextField(labelText: 'Email'),
              const SizedBox(height: 15),
              _buildTextField(labelText: 'Nama'),
              const SizedBox(height: 15),
              _buildTextField(labelText: 'Nomor Telepon'),
              const SizedBox(height: 15),
              _buildTextField(labelText: 'Alamat'),
              const SizedBox(height: 30),
              // Tombol Ubah Profil
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk menyimpan perubahan profil
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  const Color.fromARGB(255, 0, 42, 255),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Ubah Profil',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk form input
  Widget _buildTextField({required String labelText}) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color:  Color.fromARGB(255, 59, 88, 230),),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: Colors.deepPurple[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 42, 255),),
        ),
      ),
    );
  }
}
