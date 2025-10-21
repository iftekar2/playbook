import 'package:flutter/material.dart';

class NflInHomeScreen extends StatefulWidget {
  const NflInHomeScreen({super.key});

  @override
  State<NflInHomeScreen> createState() => _NflInHomeScreenState();
}

class _NflInHomeScreenState extends State<NflInHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Live NFL Games",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
