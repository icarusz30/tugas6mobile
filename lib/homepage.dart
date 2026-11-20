import 'package:flutter/material.dart';
import 'package:p6_katalogwisata/data_wisata.dart';
import 'package:p6_katalogwisata/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('explore wisata'),
          leading: const Icon(Icons.explore),
          backgroundColor: Colors.white,
          foregroundColor: Colors.amber,
          bottom: const TabBar(
            labelColor: Colors.amber,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.grid_on), text: 'Grid View'),
              Tab(icon: Icon(Icons.list), text: 'List View'),
            ],
          ),
        ),
        body: TabBarView(children: [gridView(), listView()]),
      ),
    );
  }
}

Widget gridView() {
  return GridView.builder(
    padding: const EdgeInsets.all(20),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
    ),
    itemCount: dataWisata.length,
    itemBuilder: (context, index) => _wisataCard(context, dataWisata[index]),
  );
}

Widget listView() {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: dataWisata.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        height: 240,
        child: _wisataCard(context, dataWisata[index]),
      ),
    ),
  );
}

Widget _wisataCard(BuildContext context, Map<String, String> item) {
  return Card(
    elevation: 3,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => DetailPage(wisata: item),
          ),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            item['gambar']!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.amber.shade100,
              alignment: Alignment.center,
              child: const Icon(Icons.image_not_supported_outlined, size: 40),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
                stops: [0.45, 1],
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item['lokasi']!,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 12,
            right: 12,
            child: Icon(Icons.open_in_new, color: Colors.white, size: 20),
          ),
        ],
      ),
    ),
  );
}
