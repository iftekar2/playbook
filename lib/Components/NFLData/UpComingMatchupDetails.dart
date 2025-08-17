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
                        fontWeight: FontWeight.w700,
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

            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Season Leaders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 5),
                  Divider(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    thickness: 1,
                  ),

                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        '${game.passingYard}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                game.passingYardPlayerOneImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.passingYardPlayerOneName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.passingYardPlayerOneStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Image.network(
                                game.passingYardPlayerTwoImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.passingYardPlayerTwoName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.passingYardPlayerTwoStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Divider(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    thickness: 1,
                  ),

                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        '${game.rushingYard}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                game.rushingYardPlayerOneImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.rushingYardPlayerOneName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.rushingYardPlayerOneStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Image.network(
                                game.rushingYardPlayerTwoImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.rushingYardPlayerTwoName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.rushingYardPlayerTwoStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Divider(
                    color: const Color.fromARGB(255, 212, 212, 212),
                    thickness: 1,
                  ),

                  SizedBox(height: 15),
                  Column(
                    children: [
                      Text(
                        '${game.receivingYard}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.network(
                                game.receivingYardPlayerOneImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.receivingYardPlayerOneName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.receivingYardPlayerOneStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Image.network(
                                game.receivingYardPlayerTwoImage,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                '${game.receivingYardPlayerTwoName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),

                              SizedBox(height: 5),
                              Text(
                                '${game.receivingYardPlayerTwoStates}',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
