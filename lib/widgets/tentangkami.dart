import 'package:flutter/material.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Informasi Aplikasi"),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tentang Kami"),
              Tab(text: "Ketentuan Layanan"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Halaman Tentang Kami
            TentangKamiTab(),
            // Halaman Ketentuan Layanan
            KetentuanLayananTab(),
          ],
        ),
      ),
    );
  }
}

class TentangKamiTab extends StatelessWidget {
  const TentangKamiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Tentang Kami",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "BuangIn adalah aplikasi yang dirancang untuk membantu masyarakat mengelola sampah dengan lebih baik. Kami percaya bahwa kebersihan lingkungan dimulai dari kesadaran individu dan komunitas. Aplikasi ini hadir untuk memberikan informasi, edukasi, serta solusi pengelolaan sampah yang praktis dan efektif.",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 20),
            Text(
              "Visi Kami",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Menciptakan lingkungan yang bersih, sehat, dan bebas dari sampah untuk generasi sekarang dan masa depan.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Text(
              "Misi Kami",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "1. Memberikan edukasi kepada masyarakat tentang pentingnya pengelolaan sampah.\n"
              "2. Menyediakan solusi digital untuk mempermudah proses pengelolaan sampah.\n"
              "3. Berkolaborasi dengan komunitas dan pemerintah untuk menciptakan perubahan nyata.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Text(
              "Tim Kami",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Kami adalah sekelompok individu yang bersemangat untuk membuat perubahan positif di dunia melalui teknologi dan inovasi. Tim kami terdiri dari pengembang, desainer, dan ahli lingkungan yang berdedikasi.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    "Hubungi Kami",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Email: support@buangin.com",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Telepon: +62 812 3456 7890",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KetentuanLayananTab extends StatelessWidget {
  const KetentuanLayananTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Ketentuan Layanan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Dengan menggunakan aplikasi BuangIn, Anda setuju untuk mematuhi ketentuan layanan berikut:",
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              "1. Anda bertanggung jawab atas informasi yang Anda bagikan melalui aplikasi.\n"
              "2. Dilarang menggunakan aplikasi untuk tujuan yang melanggar hukum.\n"
              "3. Kami berhak mengubah atau menghentikan layanan tanpa pemberitahuan sebelumnya.\n"
              "4. Penggunaan aplikasi menunjukkan persetujuan terhadap kebijakan privasi kami.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Text(
              "Hak Kekayaan Intelektual",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Semua konten dalam aplikasi ini adalah milik BuangIn dan dilindungi oleh undang-undang hak cipta. Dilarang menyalin, mendistribusikan, atau memodifikasi konten tanpa izin tertulis dari kami.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Text(
              "Penyelesaian Sengketa",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Jika terjadi sengketa yang timbul dari penggunaan aplikasi ini, kami akan menyelesaikannya secara damai melalui diskusi dan mediasi.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
