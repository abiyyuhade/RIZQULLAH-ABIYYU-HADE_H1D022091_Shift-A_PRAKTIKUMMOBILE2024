import 'package:flutter/material.dart';
import 'package:manajemen_pariwisata/models/UlasanModel.dart';
import 'package:manajemen_pariwisata/pages/CreateUlasanPage.dart';

class DetailUlasanPage extends StatelessWidget {
  final UlasanModel ulasan;

  DetailUlasanPage({required this.ulasan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Ulasan', style: TextStyle(fontFamily: 'Arial')),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateUlasanPage(ulasan: ulasan),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.red[50],
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ulasan.reviewer,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      '${ulasan.rating}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Komentar:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  ulasan.comments,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Arial',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
