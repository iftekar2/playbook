import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLUpcomingGamesModel.dart';

class Upcomingmatchupdetails extends StatelessWidget {
  final Nflupcominggamesmodel game;

  Upcomingmatchupdetails({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    String fullDate = game.gameDate;
    List<String> parts = fullDate.split(' ');
    String formattedDate = '${parts[2]} ${parts[3]}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${game.teamOneName} Vs ${game.teamTwoName}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(game.teamOneLogo, height: 90, width: 90),
                      const SizedBox(height: 10),
                      Text(
                        game.teamOneRecord,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),
                    Text(
                      'VS',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 5),
                    Text(
                      '${game.gameStartTime}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        game.teamTwoLogo,
                        height: 90,
                        width: 90,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        game.teamTwoRecord,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
