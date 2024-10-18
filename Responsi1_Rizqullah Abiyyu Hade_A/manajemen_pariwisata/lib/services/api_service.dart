import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/UlasanModel.dart';
import '../models/RegisterModel.dart';
import '../models/LoginModel.dart';

class ApiService {
  final String baseUrl = 'http://responsi.webwizards.my.id/api';

  Future<bool> register(RegisterModel registerModel) async {
    try {
      final url = Uri.parse('$baseUrl/registrasi');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerModel.toJson()),
      );

      if (response.statusCode == 200) {
        print('Response Body: ${response.body}');
        final data = jsonDecode(response.body);
        return data['status'] == true;
      } else {
        final data = jsonDecode(response.body);
        print(
            'Error: ${response.statusCode}, ${data['message'] ?? 'Unknown error'}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginModel.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == true) {
        return;
      } else {
        throw Exception('Login gagal: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<List<UlasanModel>> getAllUlasan() async {
    final url = Uri.parse('$baseUrl/pariwisata/ulasan');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => UlasanModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load ulasan');
    }
  }

  Future<bool> createUlasan(UlasanModel ulasanModel) async {
    final url = Uri.parse('$baseUrl/pariwisata/ulasan');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ulasanModel.toJson()),
    );

    return response.statusCode == 200;
  }

  Future<bool> updateUlasan(UlasanModel ulasanModel) async {
    final url =
        Uri.parse('$baseUrl/pariwisata/ulasan/${ulasanModel.id}/update');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(ulasanModel.toJson()),
    );

    print('Update Ulasan Response: ${response.statusCode}, ${response.body}');

    return response.statusCode == 200;
  }

  Future<bool> deleteUlasan(int id) async {
    final url = Uri.parse('$baseUrl/pariwisata/ulasan/$id/delete');
    print('Delete URL: $url');
    final response = await http.delete(url);

    print('Delete Ulasan Response: ${response.statusCode}, ${response.body}');

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['code'] == 200 && responseData['status'] == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
