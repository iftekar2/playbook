import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:playbook/Components/GooglButton.dart';
import 'package:playbook/Pages/SignupPage.dart';
import 'package:playbook/Pages/forgotPassword.dart';
import 'package:playbook/Pages/homePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _isPasswordVisible = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful", style: TextStyle(fontSize: 20)),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Cold not find user", style: TextStyle(fontSize: 20)),
          ),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Wrong password", style: TextStyle(fontSize: 20)),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orange,
            content: Text(
              "An error occurred: ${e.message}",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffffffff)),
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Please enter sign up details below",
                  style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                ),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("Email", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Email";
                  }
                  return null;
                },

                controller: emailController,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter your email",
                    style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                  ),
                  // Set the default border color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Default border color
                    ),
                  ),
                  // Set the border color when the text field is focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Focused border color
                    ),
                  ),
                  // You can also add enabledBorder for consistency
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Enabled border color
                    ),
                  ),
                ),

                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("Password", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Password";
                  }
                  return null;
                },

                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter your password",
                    style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                  ),

                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  // Set the default border color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Default border color
                    ),
                  ),
                  // Set the border color when the text field is focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Focused border color
                    ),
                  ),
                  // You can also add enabledBorder for consistency
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Enabled border color
                    ),
                  ),
                ),

                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgotpassword()),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: 500,

                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        userLogin();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      thickness: 1,
                      indent: 20,
                    ),
                  ),

                  Text(
                    " Or ",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),

                  Expanded(
                    child: Divider(
                      color: const Color.fromARGB(255, 212, 212, 212),
                      thickness: 1,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              // This is using google button
              Googlbutton(onPressed: () {}),

              SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 18),

                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),

                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to the SignUpPage when the text is tapped
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
