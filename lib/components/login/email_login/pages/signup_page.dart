import 'package:flutter/material.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Get auth service
  final authService = AuthService();

  // Password visibility
  bool _isPasswordVisible = false;

  // Field validation states
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordLengthValid = false;
  bool _isPasswordContainsUpperLowerNum = false;
  bool _isPasswordValid = false;
  bool _areAllFieldsValid = false;

  // Text Controller
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Field validation functions
  void _validateFirstName(String firstName) {
    setState(() {
      _isFirstNameValid = firstName.trim().isNotEmpty;
      _checkAllFieldsValid();
    });
  }

  void _validateLastName(String lastName) {
    setState(() {
      _isLastNameValid = lastName.trim().isNotEmpty;
      _checkAllFieldsValid();
    });
  }

  void _validateEmail(String email) {
    setState(() {
      // Basic email validation
      bool emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      ).hasMatch(email.trim());
      _isEmailValid = email.trim().isNotEmpty && emailRegex;
      _checkAllFieldsValid();
    });
  }

  void _validatePassword(String password) {
    setState(() {
      // Check minimum length (8 characters)
      _isPasswordLengthValid = password.length >= 8;

      // Check for uppercase, lowercase, and number
      bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      bool hasNumber = password.contains(RegExp(r'[0-9]'));

      _isPasswordContainsUpperLowerNum =
          hasUppercase && hasLowercase && hasNumber;

      // Overall password validity
      _isPasswordValid =
          _isPasswordLengthValid && _isPasswordContainsUpperLowerNum;

      _checkAllFieldsValid();
    });
  }

  void _checkAllFieldsValid() {
    _areAllFieldsValid =
        _isFirstNameValid &&
        _isLastNameValid &&
        _isEmailValid &&
        _isPasswordValid;
  }

  void signup() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Validate all fields are valid
    if (!_areAllFieldsValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all required fields correctly")),
      );
      return;
    }

    try {
      await authService.signUpWithEmailPassword(
        email,
        password,
        firstName: firstName,
        lastName: lastName,
      );

      // AuthGate will automatically handle navigation based on auth state
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
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
              "Sign up",
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

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "First Name *",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 5),

                      TextFormField(
                        controller: _firstNameController,
                        onChanged: _validateFirstName,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),

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
                    ],
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Last Name *",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),

                      SizedBox(height: 5),

                      TextFormField(
                        controller: _lastNameController,
                        onChanged: _validateLastName,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),

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
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text("Email *", style: TextStyle(fontSize: 20)),

            SizedBox(height: 5),

            TextFormField(
              controller: _emailController,
              onChanged: _validateEmail,
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

            Text("Password *", style: TextStyle(fontSize: 20)),

            SizedBox(height: 5),

            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              onChanged: _validatePassword,

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

            SizedBox(height: 5),

            // Password validation feedback
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _isPasswordLengthValid
                            ? Icons.check_circle
                            : Icons.cancel,
                        size: 16,
                        color: _isPasswordLengthValid
                            ? Colors.green
                            : Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Minimum of 8 characters",
                        style: TextStyle(
                          fontSize: 14,
                          color: _isPasswordLengthValid
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        _isPasswordContainsUpperLowerNum
                            ? Icons.check_circle
                            : Icons.cancel,
                        size: 16,
                        color: _isPasswordContainsUpperLowerNum
                            ? Colors.green
                            : Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Contains uppercase, lowercase, and number",
                        style: TextStyle(
                          fontSize: 14,
                          color: _isPasswordContainsUpperLowerNum
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 60),
                  backgroundColor: _areAllFieldsValid
                      ? Color.fromRGBO(48, 40, 40, 1)
                      : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: _areAllFieldsValid ? signup : null,
                child: Text(
                  "Sign up",
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
