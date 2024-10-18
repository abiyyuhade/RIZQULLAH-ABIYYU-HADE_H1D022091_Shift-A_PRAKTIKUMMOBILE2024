import 'package:flutter/material.dart';
import 'package:manajemen_pariwisata/services/api_service.dart';
import 'package:manajemen_pariwisata/models/UlasanModel.dart';
import 'package:manajemen_pariwisata/pages/LoginPage.dart';
import 'package:manajemen_pariwisata/pages/CreateUlasanPage.dart';
import 'package:manajemen_pariwisata/pages/DetailUlasanPage.dart';

class UlasanPage extends StatefulWidget {
  @override
  _UlasanPageState createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  final ApiService apiService = ApiService();
  List<UlasanModel> ulasanList = [];

  @override
  void initState() {
    super.initState();
    _getAllUlasan();
  }

  void _getAllUlasan() async {
    ulasanList = await apiService.getAllUlasan();
    setState(() {});
  }

  void _createUlasan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateUlasanPage()),
    );
    if (result == true) {
      _getAllUlasan();
    }
  }

  void _editUlasan(UlasanModel ulasan) async {
    final updatedUlasan = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateUlasanPage(ulasan: ulasan),
      ),
    );
    if (updatedUlasan != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DetailUlasanPage(ulasan: updatedUlasan),
        ),
      );
    }
  }

  void _deleteUlasan(int id) async {
    bool success = await apiService.deleteUlasan(id);
    String message =
        success ? 'Ulasan berhasil dihapus!' : 'Gagal menghapus ulasan!';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontFamily: 'Arial'),
        ),
        backgroundColor: success ? Colors.green : Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );

    if (success) {
      _getAllUlasan();
    }
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulasan', style: TextStyle(fontFamily: 'Arial')),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _createUlasan,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
            ),
            ListTile(
              title: Text('Logout', style: TextStyle(fontFamily: 'Arial')),
              onTap: () {
                Navigator.pop(context);
                _logout();
              },
            ),
          ],
        ),
      ),
      body: ulasanList.isEmpty
          ? Center(
              child: Text(
                'Belum ada ulasan.',
                style: TextStyle(fontFamily: 'Arial', fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: ulasanList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  child: ListTile(
                    title: Text(ulasanList[index].reviewer,
                        style: TextStyle(fontFamily: 'Arial')),
                    subtitle: Text(ulasanList[index].comments,
                        style: TextStyle(fontFamily: 'Arial')),
                    trailing: Text(
                      ulasanList[index].rating.toString(),
                      style: TextStyle(
                          fontFamily: 'Arial', fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailUlasanPage(
                            ulasan: ulasanList[index],
                          ),
                        ),
                      );
                    },
                    onLongPress: () => _deleteUlasan(ulasanList[index].id!),
                  ),
                );
              },
            ),
    );
  }
}
