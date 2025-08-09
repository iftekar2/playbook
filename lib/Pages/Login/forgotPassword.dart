import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playbook/Pages/Login/LoginPage.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Password reset email has been sent",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orange,
            content: Text("Cold not find user", style: TextStyle(fontSize: 20)),
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
        padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),

              SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Please enter email below",
                  style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                ),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Email", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(height: 5),
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
                    "Enter you email",
                    style: TextStyle(color: Color(0xff4d5152), fontSize: 18),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
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
                        resetPassword();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Send Email",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
