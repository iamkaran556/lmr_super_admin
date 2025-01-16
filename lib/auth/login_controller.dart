import 'package:flutter/cupertino.dart';

import '../api_service/ApiService.dart';
import 'LoginResponse.dart';

class AuthProvider with ChangeNotifier {
  ApiService _apiService = ApiService();
  LoginResponse? _loginResponse;
  bool _isLoading = false;

  LoginResponse? get loginResponse => _loginResponse;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _loginResponse = await _apiService.login(email, password);
      print("object=============${_loginResponse!.email}");
    } catch (error) {
      _loginResponse = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
