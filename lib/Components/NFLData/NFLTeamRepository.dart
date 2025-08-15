import 'package:flutter/material.dart';
import 'package:playbook/Components/NFLData/NFLTeamInformation.dart';

class Nflteamrepository extends StatefulWidget {
  Nflteamrepository({super.key});

  @override
  State<Nflteamrepository> createState() => _NflteamrepositoryState();
}

class _NflteamrepositoryState extends State<Nflteamrepository> {
  final nflDatabase = Nflteaminformation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
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
                if (!snapshot.hasData ||
                    snapshot.data == null ||
                    (snapshot.data as List).isEmpty) {
                  return const Center(child: Text('No data found'));
                }
                final nflTeams = snapshot.data as List;
                return Expanded(
                  child: ListView.builder(
                    itemCount: nflTeams.length,
                    itemBuilder: (context, index) {
                      final team = nflTeams[index];
                      return ListTile(title: Text(team.team_name));
                    },
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
