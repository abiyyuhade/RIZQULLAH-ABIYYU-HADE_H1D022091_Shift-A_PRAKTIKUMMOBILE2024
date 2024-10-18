class RegisterModel {
  String nama;
  String email;
  String password;

  RegisterModel({
    required this.nama,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'email': email,
      'password': password,
    };
  }
}
