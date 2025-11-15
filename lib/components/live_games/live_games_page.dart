import 'package:flutter/material.dart';
import 'package:playbook/components/nba_data/nba_live_games/nba_live_games_horizontal_list.dart';
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
      appBar: AppBar(title: Text("Live Games"), backgroundColor: Colors.white),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          NflLiveGamesHorizontalList(showAll: true),
          NbaLiveGamesHorizontalList(showAll: true),
        ],
      ),
    );
  }
}
