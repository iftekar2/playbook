import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLCategoryCard.dart';

class Nflhomepage extends StatelessWidget {
  const Nflhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "lib/Images/National_Football_League_logo.svg.webp",
          height: 60,
          width: 60,
        ),
        backgroundColor: const Color(0xffffffff),
      ),

      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(children: [Nflcategorycard()]),
      ),
    );
  }
}
// https://www.espn.com/mlb/game/_/gameId/401696678
// https://www.espn.com/nfl/game?gameId=401773026