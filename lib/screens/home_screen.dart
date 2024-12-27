import 'package:flutter/material.dart';
import 'package:buangin/widgets/listview.dart';
import 'package:buangin/widgets/jemputsampah.dart';
import 'package:buangin/widgets/saldoriwayat.dart';
import 'package:buangin/widgets/tentangkami.dart';

class WasteManagementApp extends StatelessWidget {
  const WasteManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 191, 165), // Warna hijau tosca
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selamat Datang",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Kisan RA",
                      style: TextStyle(
                          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Lokasi Anda",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Promo Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/recycle1.png', height: 200, width: 200), 
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tukarkan sampah plastikmu sekarang!",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Aplikasi Bank Sampah adalah solusi untuk menyelesaikan masalah kebersihan lingkungan.",
                              style: TextStyle(color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Menu Kategori
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Menu Kategori",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              // Grid Menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMenuCard(
                      context,
                      Icons.local_shipping,
                      "Jemput Sampah",
                      () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const JemputSampahPage()),
                        );
                      },
                    ),
                    _buildMenuCard(
                      context,
                      Icons.delete_outline,
                      "Jenis Sampah",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JenisSampahList()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMenuCard(
                      context,
                      Icons.account_balance_wallet,
                      "Saldo & Riwayat",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const SaldoRiwayatPage()),
                        );
                      },
                    ),
                    _buildMenuCard(
                      context,
                      Icons.info_outline,
                      "Tentang Kami",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TentangKami()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Menu Card Builder
  Widget _buildMenuCard(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 70, color: Colors.green),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: WasteManagementApp(),
      debugShowCheckedModeBanner: false,
    ));
