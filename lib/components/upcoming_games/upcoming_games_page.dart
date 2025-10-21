import 'package:flutter/material.dart';

class UpcomingGamesPage extends StatefulWidget {
  const UpcomingGamesPage({super.key});

  @override
  State<UpcomingGamesPage> createState() => _UpcomingGamesPageState();
}

class _UpcomingGamesPageState extends State<UpcomingGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Upcoming Games Page")));
  }
}
