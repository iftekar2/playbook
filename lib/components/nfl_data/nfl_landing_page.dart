import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/nfl_final_games/nfl_final_games_vertical_list.dart';
import 'package:playbook/components/nfl_data/nfl_live_games/nfl_live_games_vertical_list.dart';

class NflLandingPage extends StatefulWidget {
  const NflLandingPage({super.key});

  @override
  State<NflLandingPage> createState() => _NflLandingPageState();
}

class _NflLandingPageState extends State<NflLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/873px-National_Football_League_logo.svg.png",
          height: 50,
          width: 50,
        ),

        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: NflLiveGamesVerticalList(),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: NflFinalGamesVerticalList(),
            ),

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
