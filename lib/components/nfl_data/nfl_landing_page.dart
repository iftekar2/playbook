import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/nfl_live_games_vertical_list.dart';

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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // mainAxisAlignment.center is fine, but you might want to switch to start
          // if you have other content above the list.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ⭐ WRAP THE VERTICAL LIST IN EXPANDED
            Expanded(child: NflLiveGamesVerticalList()),
          ],
        ),
      ),
    );
  }
}
