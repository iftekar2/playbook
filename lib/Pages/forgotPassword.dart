import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffffffff)),

      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 50),
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
            TextField(
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
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
    );
  }
}
