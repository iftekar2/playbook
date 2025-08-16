import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLTeamCategoryCard.dart';
import 'package:playbook/Components/NFLData/NFLUpComingGames.dart';

class Nflmainpage extends StatelessWidget {
  const Nflmainpage({super.key});

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
        padding: EdgeInsets.only(top: 15),
        child: Column(children: [Nflcategorycard(), Nflteamrepository()]),
      ),
    );
  }
}
