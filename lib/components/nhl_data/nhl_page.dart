import 'package:flutter/material.dart';

class NhlPage extends StatefulWidget {
  const NhlPage({super.key});

  @override
  State<NhlPage> createState() => _NhlPageState();
}

class _NhlPageState extends State<NhlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NHL",
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
              "NHL Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(68, 59, 59, 1),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "NHL content will be displayed here",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
