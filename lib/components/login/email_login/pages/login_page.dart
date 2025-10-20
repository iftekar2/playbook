import 'package:flutter/material.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';
import 'package:playbook/components/login/email_login/pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Get auth service
  final authService = AuthService();

  bool _isPasswordVisible = false;

  // Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _emailController.text;

    // Attempt to login
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: {e}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),

      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Log in",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 5),

            Text(
              "Please enter log in details below",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 132, 132, 132),
              ),
            ),

            SizedBox(height: 30),

            Text("Email", style: TextStyle(fontSize: 20)),

            SizedBox(height: 5),

            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(fontSize: 18, color: Colors.grey),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1.0,
                  ),
                ),
              ),

              style: TextStyle(fontSize: 18, color: Colors.black),
            ),

            SizedBox(height: 20),

            Text("Password", style: TextStyle(fontSize: 20)),

            SizedBox(height: 5),

            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,

              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(fontSize: 18, color: Colors.grey),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 177, 177, 177),
                    width: 1.0,
                  ),
                ),

                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                ),
              ),

              style: TextStyle(fontSize: 18, color: Colors.black),
            ),

            SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 124, 124, 124),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 60),
                  backgroundColor: Color.fromRGBO(48, 40, 40, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Log in",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
