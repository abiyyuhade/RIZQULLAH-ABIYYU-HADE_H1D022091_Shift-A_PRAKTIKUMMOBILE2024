import 'package:flutter/material.dart';
import 'package:manajemen_pariwisata/services/api_service.dart';
import 'package:manajemen_pariwisata/models/UlasanModel.dart';

class CreateUlasanPage extends StatefulWidget {
  final UlasanModel? ulasan;

  CreateUlasanPage({this.ulasan});

  @override
  _CreateUlasanPageState createState() => _CreateUlasanPageState();
}

class _CreateUlasanPageState extends State<CreateUlasanPage> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  String reviewer = '';
  int rating = 0;
  String comments = '';

  @override
  void initState() {
    super.initState();
    if (widget.ulasan != null) {
      reviewer = widget.ulasan!.reviewer;
      rating = widget.ulasan!.rating;
      comments = widget.ulasan!.comments;
    }
  }

  void _saveUlasan() async {
    if (_formKey.currentState!.validate()) {
      UlasanModel ulasanModel = UlasanModel(
        id: widget.ulasan?.id,
        reviewer: reviewer,
        rating: rating,
        comments: comments,
      );

      bool success;
      if (widget.ulasan == null) {
        success = await apiService.createUlasan(ulasanModel);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ulasan berhasil ditambahkan!')),
          );
          Navigator.pop(context, ulasanModel);
        }
      } else {
        success = await apiService.updateUlasan(ulasanModel);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ulasan berhasil diperbarui!')),
          );
          Navigator.pop(context, ulasanModel);
        }
      }

      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan ulasan!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ulasan == null ? 'Buat Ulasan' : 'Edit Ulasan',
            style: TextStyle(fontFamily: 'Arial')),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        color: Colors.red[50],
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Reviewer',
                  border: OutlineInputBorder(),
                ),
                initialValue: reviewer,
                onChanged: (value) => reviewer = value,
                validator: (value) =>
                    value!.isEmpty ? 'Reviewer tidak boleh kosong' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Rating (1-5)',
                  border: OutlineInputBorder(),
                ),
                initialValue: rating.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    rating = int.parse(value);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) return 'Rating tidak boleh kosong';
                  int? ratingValue = int.tryParse(value);
                  if (ratingValue == null ||
                      ratingValue < 1 ||
                      ratingValue > 5) {
                    return 'Rating harus antara 1-5';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Comments',
                  border: OutlineInputBorder(),
                ),
                initialValue: comments,
                onChanged: (value) => comments = value,
                validator: (value) =>
                    value!.isEmpty ? 'Comments tidak boleh kosong' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUlasan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 254, 254, 254),
                ),
                child: Text(
                    widget.ulasan == null ? 'Buat Ulasan' : 'Simpan Ulasan',
                    style: TextStyle(fontFamily: 'Arial')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
