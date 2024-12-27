import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class JemputSampahPage extends StatefulWidget {
  const JemputSampahPage({super.key});

  @override
  State<JemputSampahPage> createState() => _JemputSampahPageState();
}

class _JemputSampahPageState extends State<JemputSampahPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _catatanController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  String _selectedItem = 'Organik Basah';
  String _selectedLokasi = 'TPS Bantul';
  final List<String> _kategoriSampah = ['Organik Kering', 'Organik Basah', 'Anorganik'];
  final List<String> _lokasiList = ['TPS Bantul', 'TPS Parangtritis', 'TPS Demangan', 'TPS Sleman', 'TPS Sinduadi'];

  final Map<String, int> hargaPerKg = {
    'Organik Kering': 1500,
    'Organik Basah': 2000,
    'Anorganik': 2500,
  };

  int _saldo = 0;

  Future<void> _fetchSaldoDanRiwayat() async {
    try {
      final saldoDoc = await FirebaseFirestore.instance.collection('saldo').doc('user_saldo').get();
      if (saldoDoc.exists) {
        setState(() {
          _saldo = saldoDoc['saldo'] ?? 0;
        });
      }
    } catch (e) {
      print("Error fetching saldo: $e");
    }
  }

  Future<void> _saveToFirestore() async {
    try {
      final berat = int.tryParse(_beratController.text) ?? 0;
      if (berat <= 0) {
        throw Exception("Berat harus berupa angka positif.");
      }

      final int hargaTotal = berat * hargaPerKg[_selectedItem]!;

      final saldoRef = FirebaseFirestore.instance.collection('saldo').doc('user_saldo');
      final saldoDoc = await saldoRef.get();

      if (!saldoDoc.exists) {
        throw Exception("Data saldo tidak ditemukan.");
      }

      final currentSaldo = saldoDoc.data()?['saldo'] ?? 0;

      if (currentSaldo < hargaTotal) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Saldo Anda tidak mencukupi untuk transaksi ini.")),
        );
        return;
      }

      await saldoRef.update({
        'saldo': currentSaldo - hargaTotal,
      });

      await FirebaseFirestore.instance.collection('riwayat_transaksi').add({
        'nama': _namaController.text,
        'kategori': _selectedItem,
        'lokasi': _selectedLokasi,
        'berat': berat,
        'tanggal': _tanggalController.text,
        'alamat': _alamatController.text,
        'catatan': _catatanController.text,
        'saldo_terpakai': hargaTotal,
        'waktu_submit': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data berhasil disimpan, saldo telah dikurangi.")),
      );

      await _fetchSaldoDanRiwayat();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menyimpan data: ${e.toString()}")),
      );
    }
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _tanggalController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label tidak boleh kosong";
        }
        if (label == "Berat (Kg)" && (int.tryParse(value) == null || int.parse(value) <= 0)) {
          return "Masukkan berat yang valid (positif)";
        }
        return null;
      },
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      items: _kategoriSampah.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
      decoration: InputDecoration(
        labelText: "Kategori Sampah",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildDropdownLokasiField() {
    return DropdownButtonFormField<String>(
      value: _selectedLokasi,
      items: _lokasiList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedLokasi = newValue!;
        });
      },
      decoration: InputDecoration(
        labelText: "Lokasi",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jemput Sampah"),
        backgroundColor: const Color(0xFF00BFA5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mohon isi data di bawah ini dengan benar",
                  style: TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTextField("Nama Pengguna", "Masukan nama lengkap", _namaController),
                const SizedBox(height: 10),
                _buildDropdownField(),
                const SizedBox(height: 10),
                _buildDropdownLokasiField(),
                const SizedBox(height: 10),
                _buildTextField("Berat (Kg)", "Masukan berat sampah", _beratController, keyboardType: TextInputType.number),
                const SizedBox(height: 10),
                _buildTextField(
                  "Tanggal Penjemputan",
                  "Masukan tanggal",
                  _tanggalController,
                  keyboardType: TextInputType.datetime,
                  onTap: _pickDate,
                  readOnly: true,
                ),
                const SizedBox(height: 10),
                _buildTextField("Alamat", "Masukan alamat", _alamatController),
                const SizedBox(height: 10),
                _buildTextField("Catatan Tambahan (Opsional)", "Masukan catatan tambahan anda", _catatanController),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await _saveToFirestore();
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00BFA5),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text("Jemput Sekarang", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
