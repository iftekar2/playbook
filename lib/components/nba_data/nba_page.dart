import 'package:flutter/material.dart';

class NbaPage extends StatefulWidget {
  const NbaPage({super.key});

  @override
  State<NbaPage> createState() => _NbaPageState();
}

class _NbaPageState extends State<NbaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NBA",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Color.fromRGBO(68, 59, 59, 1),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "NBA Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(68, 59, 59, 1),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "NBA content will be displayed here",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
