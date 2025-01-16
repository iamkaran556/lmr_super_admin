import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lmr_super_admin/home/home_page.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _handleLogin() {
    // Clear previous errors
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Validate email
    if (!_isValidEmail(email)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
    }

    // Validate password
    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Password cannot be empty';
      });
    } else if (password.length < 6) {
      setState(() {
        _passwordError = 'Password must be at least 6 characters long';
      });
    }

    // Proceed with login if no errors
    if (_emailError == null && _passwordError == null) {
      Provider.of<AuthProvider>(context, listen: false)
          .login(email, password)
          .then((rr) {
            print("=======}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const homepage()),
        );
      }).catchError((error) {
        // Handle login error
        print('Login failed: $error');
      });
    }
    print("object$_passwordError");
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  filled: true,
                  fillColor: Colors.black,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  errorText: _emailError,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.black,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  errorText: _passwordError,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
