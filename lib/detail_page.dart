import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.wisata, super.key});

  final Map<String, String> wisata;

  @override
  Widget build(BuildContext context) {
    final nama = wisata['nama'] ?? 'Destinasi wisata';
    final lokasi = wisata['lokasi'] ?? '';
    final deskripsi = wisata['deskripsi'] ??
        'Jelajahi keindahan $nama dan suasana khas $lokasi.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.amber.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 28),
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              wisata['gambar'] ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.amber.shade100,
                alignment: Alignment.center,
                child: const Icon(Icons.image_not_supported_outlined, size: 48),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.amber),
                    const SizedBox(width: 6),
                    Text(
                      lokasi,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Tentang destinasi',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  deskripsi,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: Colors.black87,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
