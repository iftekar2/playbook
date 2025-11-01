import 'package:flutter/material.dart';

class NflLandingPage extends StatefulWidget {
  const NflLandingPage({super.key});

  @override
  State<NflLandingPage> createState() => _NflLandingPageState();
}

class _NflLandingPageState extends State<NflLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/873px-National_Football_League_logo.svg.png",
          height: 50,
          width: 50,
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
              "NFL Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(68, 59, 59, 1),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "NFL content will be displayed here",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
