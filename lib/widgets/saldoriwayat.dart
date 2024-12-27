import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaldoRiwayatPage extends StatefulWidget {
  const SaldoRiwayatPage({super.key});

  @override
  State<SaldoRiwayatPage> createState() => _SaldoRiwayatPageState();
}

class _SaldoRiwayatPageState extends State<SaldoRiwayatPage> {
  final List<Map<String, dynamic>> _riwayatTransaksi = [];
  int _saldo = 0;
  late Stream<QuerySnapshot> _riwayatStream;

  @override
  void initState() {
    super.initState();
    _fetchSaldoDanRiwayat();
    _riwayatStream = FirebaseFirestore.instance
        .collection('riwayat_transaksi')
        .orderBy('waktu_submit', descending: true)
        .snapshots();
  }

  // Mengambil saldo dan riwayat transaksi dari Firestore
  Future<void> _fetchSaldoDanRiwayat() async {
    final saldoRef =
        FirebaseFirestore.instance.collection('saldo').doc('user_saldo');
    final riwayatRef =
        FirebaseFirestore.instance.collection('riwayat_transaksi');

    // Fetch saldo
    try {
      final saldoDoc = await saldoRef.get();
      if (saldoDoc.exists) {
        setState(() {
          _saldo = saldoDoc.data()?['saldo'] ?? 0;
        });
      }
    } catch (e) {
      print("Error fetching saldo: $e");
    }

    // Fetch riwayat transaksi
    try {
      final riwayatSnapshot =
          await riwayatRef.orderBy('waktu_submit', descending: true).get();
      setState(() {
        _riwayatTransaksi.clear();
        _riwayatTransaksi.addAll(
          riwayatSnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>),
        );
      });
    } catch (e) {
      print("Error fetching riwayat: $e");
    }
  }

  Future<void> _tambahSaldo(int jumlah) async {
    final saldoRef =
        FirebaseFirestore.instance.collection('saldo').doc('user_saldo');
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {

        final saldoDoc = await saldoRef.get();
        if (saldoDoc.exists) {
          await saldoRef.update({'saldo': FieldValue.increment(jumlah)});
        } else {
          await saldoRef.set({'saldo': jumlah});
        }

        await FirebaseFirestore.instance.collection('riwayat_transaksi').add({
          'nama': 'Top-up Saldo',
          'kategori': 'Top-up',
          'lokasi': '-',
          'tanggal': DateTime.now().toIso8601String(),
          'catatan': 'Penambahan saldo sebesar Rp. $jumlah',
          'saldo_tambahan': jumlah,
          'harga_total': jumlah,
          'waktu_submit': FieldValue.serverTimestamp(),
          'user_id': user.uid,
        });

        _fetchSaldoDanRiwayat();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Saldo berhasil ditambahkan!")),
        );
      } catch (e) {
        print("Error adding saldo: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal menambahkan saldo.")),
        );
      }
    } else {
      print("User tidak terautentikasi!");
    }
  }

  // Dialog tambah saldo
  void _showTambahSaldoDialog() {
    final TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tambah Saldo"),
        content: TextField(
          controller: jumlahController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Jumlah Saldo",
            hintText: "Masukkan jumlah saldo",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              final jumlah = int.tryParse(jumlahController.text) ?? 0;
              if (jumlah > 0) {
                _tambahSaldo(jumlah);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Jumlah saldo tidak valid.")),
                );
              }
            },
            child: const Text("Tambah"),
          ),
        ],
      ),
    );
  }

  // Bagian Saldo
  Widget _buildSaldoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: const Icon(Icons.account_balance_wallet,
              size: 40, color: Colors.green),
          title: const Text(
            "Saldo Anda :",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            "Rp. $_saldo",
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),
          trailing: ElevatedButton(
            onPressed: _showTambahSaldoDialog,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Tambah Saldo"),
          ),
        ),
      ),
    );
  }

  // Bagian Riwayat Transaksi
  Widget _buildRiwayatSection() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _riwayatStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Terjadi kesalahan"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Riwayat transaksi kosong"));
          }

          final documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index].data() as Map<String, dynamic>;
              final kategori = data['kategori'] ?? 'Tidak ada';
              final nama = data['nama'] ?? 'Tidak ada';
              final hargaTotal = data['harga_total'] ?? 0;

              if (kategori == 'Top-up') {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text("$nama - $kategori"),
                    subtitle: Text("Harga : Rp $hargaTotal"),
                  ),
                );
              }

              final berat = data['berat'] ?? 0;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text("$nama - $kategori"),
                  subtitle:
                      Text("Berat: $berat kg\nHarga Total: Rp $hargaTotal"),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saldo & Riwayat Anda",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF00BFA5),
      ),
      body: Column(
        children: [
          _buildSaldoSection(),
          const Divider(thickness: 2),
          _buildRiwayatSection(),
        ],
      ),
    );
  }
}
