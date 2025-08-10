import 'package:flutter/material.dart';

class Nba extends StatelessWidget {
  const Nba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(children: [Text("NBA")]),
      ),
    );
  }
}
