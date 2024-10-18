import 'package:flutter/material.dart';
import 'package:manajemen_pariwisata/services/api_service.dart';
import 'package:manajemen_pariwisata/models/RegisterModel.dart';
import 'package:manajemen_pariwisata/pages/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  String nama = '';
  String email = '';
  String password = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      RegisterModel registerModel = RegisterModel(
        nama: nama,
        email: email,
        password: password,
      );

      bool success = await apiService.register(registerModel);

      if (success) {
        _showDialog('Registrasi berhasil!', true);
      } else {
        _showDialog('Registrasi gagal!', false);
      }
    }
  }

  void _showDialog(String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isSuccess ? 'Sukses' : 'Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Registrasi', style: TextStyle(fontFamily: 'Arial'))),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) => nama = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                  style: TextStyle(fontFamily: 'Arial'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onChanged: (value) => email = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Email tidak boleh kosong' : null,
                  style: TextStyle(fontFamily: 'Arial'),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Password tidak boleh kosong' : null,
                  style: TextStyle(fontFamily: 'Arial'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Daftar', style: TextStyle(fontFamily: 'Arial')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
