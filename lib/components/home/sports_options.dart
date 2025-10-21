import 'package:flutter/material.dart';

class SportsOptions extends StatefulWidget {
  const SportsOptions({super.key});

  @override
  State<SportsOptions> createState() => _SportsOptionsState();
}

class _SportsOptionsState extends State<SportsOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(children: [Text('Sports Options')]),
    );
  }
}
