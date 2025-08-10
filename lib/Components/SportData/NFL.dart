import 'package:flutter/material.dart';

class Nfl extends StatelessWidget {
  const Nfl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(children: [Text("NFL")]),
      ),
    );
  }
}
