import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/nfl_final_games/nfl_final_games_horizontal_list.dart';

class FinalGamesPage extends StatefulWidget {
  const FinalGamesPage({super.key});

  @override
  State<FinalGamesPage> createState() => _FinalGamesPageState();
}

class _FinalGamesPageState extends State<FinalGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final Games"), backgroundColor: Colors.white),

      backgroundColor: Colors.white,
      body: NflFinalGamesHorizontalList(showAll: true),
    );
  }
}
