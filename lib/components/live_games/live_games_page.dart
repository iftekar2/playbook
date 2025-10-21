import 'package:flutter/material.dart';

class LiveGamesPage extends StatefulWidget {
  const LiveGamesPage({super.key});

  @override
  State<LiveGamesPage> createState() => _LiveGamesPageState();
}

class _LiveGamesPageState extends State<LiveGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Live Games Page")));
  }
}
