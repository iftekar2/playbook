import 'package:flutter/material.dart';

class NbaLandingPage extends StatefulWidget {
  const NbaLandingPage({super.key});

  @override
  State<NbaLandingPage> createState() => _NbaLandingPageState();
}

class _NbaLandingPageState extends State<NbaLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/National_Basketball_Association_logo.svg/210px-National_Basketball_Association_logo.svg.png",
          height: 50,
          width: 50,
        ),
        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        automaticallyImplyLeading: false,
      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Padding(padding: const EdgeInsets.only(top: 10))],
        ),
      ),
    );
  }
}
