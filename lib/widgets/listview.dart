import 'package:flutter/material.dart';

class JenisSampahList extends StatelessWidget {
  const JenisSampahList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jenis-jenis Sampah"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sampah merupakan hasil produksi manusia yang tidak akan pernah luput dari kehidupan sehari-hari. Lalu, jenis-jenis sampah apa yang biasanya kita hasilkan? Yuk, kenali di sini.",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sampah jika dibiarkan saja akan mengganggu kebersihan lingkungan secara umum. Sampah dapat dibedakan menjadi dua macam, yaitu:",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              // Sampah Padat (Anorganik)
              _buildSampahSection(
                title: "1. Sampah Padat (Anorganik)",
                description:
                    "Sampah anorganik adalah sampah yang terdiri atas bahan-bahan anorganik. Contoh bahan-bahan anorganik adalah bahan logam, plastik, kaca, karet, dan kaleng. Sifat sampah anorganik adalah tahan lama dan sukar membusuk.\n\nSampah ini tidak mudah diuraikan oleh mikroorganisme tanah. Apabila dibuang sembarangan, sampah anorganik dapat menimbulkan pencemaran tanah.",
              ),
              const SizedBox(height: 20),
              // Sampah Basah (Organik)
              _buildSampahSection(
                title: "2. Sampah Basah (Organik)",
                description:
                    "Sampah organik adalah sampah yang terdiri atas bahan-bahan organik. Sifat sampah organik tidak tahan lama dan cepat membusuk. Biasanya sampah jenis ini berasal dari makhluk hidup. Contohnya adalah sayur-sayuran, buah-buah yang membusuk, sisa nasi, daun, dan daging hewan.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun setiap bagian jenis sampah
  Widget _buildSampahSection({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ],
    );
  }
}
