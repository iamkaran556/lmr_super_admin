import 'dart:convert';
import 'package:http/http.dart' as http;
import '../auth/LoginResponse.dart';
// import 'LoginResponse.dart';

class ApiService {
  Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.12:5000/superadmin/login'),
      headers: <String, String>{
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        'email': email,
        'password': password,
      }
    );
    print("=======statusCode========${response.statusCode}");
    print("===============${response.body}");

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to log in');
    }
  }
}
