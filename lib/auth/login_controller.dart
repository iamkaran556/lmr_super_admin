import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmr_super_admin/home/home_page.dart';
import '../api_service/ApiService.dart';
import 'LoginResponse.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  LoginResponse? _loginResponse;
  bool _isLoading = false;
  String? _errorMessage;

  LoginResponse? get loginResponse => _loginResponse;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password,BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _loginResponse = await _apiService.login(email, password);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homepage()),(route)=>false);
    } catch (error) {
      _loginResponse = null;
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}









// import 'package:flutter/cupertino.dart';
//
// import '../api_service/ApiService.dart';
// import 'LoginResponse.dart';
//
// class AuthProvider with ChangeNotifier {
//   ApiService _apiService = ApiService();
//   LoginResponse? _loginResponse;
//   bool _isLoading = false;
//
//   LoginResponse? get loginResponse => _loginResponse;
//   bool get isLoading => _isLoading;
//
//   Future<void> login(String email, String password) async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       _loginResponse = await _apiService.login(email, password);
//       print("object=============${_loginResponse!.email}");
//     } catch (error) {
//       _loginResponse = null;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
