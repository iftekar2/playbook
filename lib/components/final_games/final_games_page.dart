import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_live_games_repository.dart';
import 'package:playbook/components/nfl_data/nfl_final_games/nfl_final_games_horizontal_list.dart';

class FinalGamesPage extends StatefulWidget {
  const FinalGamesPage({super.key});

  @override
  State<FinalGamesPage> createState() => _FinalGamesPageState();
}

class _FinalGamesPageState extends State<FinalGamesPage> {
  // ⭐ Instantiate the repository to access its stream
  final nflDatabase = NflLiveGamesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Final Games"),
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,

      // ⭐ Wrap the body content in a StreamBuilder
      body: StreamBuilder(
        stream: nflDatabase.stream, // Use the stream the child widget uses
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ⭐ Show CircularProgressIndicator while waiting for data
            return const Center(child: CircularProgressIndicator());
          }

          // Once data is loaded (or error/empty), display the content
          return NflFinalGamesHorizontalList(showAll: true);
        },
      ),
    );
  }
}
