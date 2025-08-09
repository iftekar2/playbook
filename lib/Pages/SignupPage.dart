import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:playbook/Components/GooglButton.dart';
import 'package:playbook/Components/googleAuth.dart';
import 'package:playbook/Pages/LoginPage.dart';
import 'package:playbook/Pages/homePage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordVisible = false;
  String name = "";
  String email = "";
  String password = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "User has been created Successfully",
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orange,
              content: Text(
                "Email already Exists",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffffffff)),
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                  "Please enter login details below",
                  style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                ),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("Name", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Name";
                  }
                  return null;
                },

                controller: nameController,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  // Use hintText and hintStyle
                  hintText: "Enter your name",
                  hintStyle: const TextStyle(
                    color: Color(0xff4d5152),
                    fontSize: 18,
                  ),

                  // Default border for all enabled states
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0, // A consistent border width
                    ),
                  ),

                  // Focused border
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0, // A slightly thicker border when focused
                    ),
                  ),

                  // Error border
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  ),

                  // Focused error border
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
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

              SizedBox(height: 30),
              SizedBox(
                height: 60,
                width: 500,

                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                      });
                      registration();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
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

              SizedBox(height: 20),
              // This is using google button
              Googlbutton(
                onPressed: () {
                  GoogleAuth().signInWithGoogle(context);
                },
              ),

              SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 18),

                  children: <TextSpan>[
                    TextSpan(
                      text: "Log In",
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
                              builder: (context) => const Loginpage(),
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
