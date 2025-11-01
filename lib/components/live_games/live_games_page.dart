import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/nfl_live_games/nfl_live_games_horizontal_list.dart';

class LiveGamesPage extends StatefulWidget {
  const LiveGamesPage({super.key});

  @override
  State<LiveGamesPage> createState() => _LiveGamesPageState();
}

class _LiveGamesPageState extends State<LiveGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),

      backgroundColor: Colors.white,
      body: Column(children: [NflLiveGamesHorizontalList()]),
    );
  }
}
