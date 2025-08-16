import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLNextWeekInfo.dart';

class Nflteamrepository extends StatefulWidget {
  Nflteamrepository({super.key});

  @override
  State<Nflteamrepository> createState() => _NflteamrepositoryState();
}

class _NflteamrepositoryState extends State<Nflteamrepository> {
  final nflNextWeeksData = Nflnextweekinfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 15),
      child: StreamBuilder(
        stream: nflNextWeeksData.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No upcoming games found'));
          }
          final upcomingGames = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Next Week's Games",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 5),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingGames.length,
                  itemBuilder: (context, index) {
                    final game = upcomingGames[index];
                    return Card(
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 370,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 5),
                              child: Text(
                                '${game.gameDate}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.network(
                                      game.teamOneLogo,
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.contain,
                                    ),

                                    SizedBox(height: 10),
                                    Text(
                                      '${game.teamOneName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    SizedBox(height: 5),
                                    Text(
                                      '${game.teamOneRecord}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),

                                SizedBox(width: 30),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "VS",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${game.gameStartTime}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),

                                SizedBox(width: 30),
                                Column(
                                  children: [
                                    Image.network(
                                      game.teamTwoLogo,
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.contain,
                                    ),

                                    SizedBox(height: 10),
                                    Text(
                                      '${game.teamTwoName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),

                                    SizedBox(height: 5),
                                    Text(
                                      '${game.teamTwoRecord}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
