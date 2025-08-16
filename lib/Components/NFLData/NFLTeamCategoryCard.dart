import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLTeamInformation.dart';

class Nflcategorycard extends StatefulWidget {
  Nflcategorycard({super.key});

  @override
  State<Nflcategorycard> createState() => _NflcategorycardState();
}

class _NflcategorycardState extends State<Nflcategorycard> {
  final nflDatabase = Nflteaminformation();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Container(
        height: 190,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "NFL Teams",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            StreamBuilder(
              stream: nflDatabase.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                  return const Center(child: Text('No data found'));
                }

                final teams = snapshot.data as List;
                return Padding(
                  padding: EdgeInsets.only(left: 15, right: 8),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: teams.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final team = teams[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                  team.team_logo_url,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
