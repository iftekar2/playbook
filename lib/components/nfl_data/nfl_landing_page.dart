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

      // ⭐ Use a SingleChildScrollView as the main body content
      body: SingleChildScrollView(
        // We use Column inside SingleChildScrollView to stack the two sections
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 1. LIVE GAMES SECTION
            // Wrap in Padding for vertical separation and pass the scrolling control
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: NflLiveGamesVerticalList(),
            ),

            // 2. VISUAL SEPARATOR (Optional, but good for distinction)
            const SizedBox(height: 25.0),
            Divider(
              color: const Color.fromARGB(255, 230, 230, 230),
              thickness: 8,
              height: 0,
            ),
            const SizedBox(height: 25.0),

            // 3. FINAL GAMES SECTION
            NflFinalGamesVerticalList(),

            // Add final bottom padding
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
