import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_game_model.dart';
import 'package:playbook/components/nfl_data/database/nfl_live_games_repository.dart';
import 'package:playbook/components/nfl_data/nfl_game_detail_modal.dart';

class NflLiveGamesVerticalList extends StatefulWidget {
  const NflLiveGamesVerticalList({super.key});

  @override
  State<NflLiveGamesVerticalList> createState() =>
      _NflLiveGamesVerticalListState();
}

class _NflLiveGamesVerticalListState extends State<NflLiveGamesVerticalList> {
  final nflDatabase = NflLiveGamesRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NflGameModel>>(
      stream: nflDatabase.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final games = snapshot.data ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header (Takes only the space it needs)
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15, top: 20),
              child: Text(
                "Live NFL Games",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      NflGameDetailModalHelper.show(context, game);
                    },
                    child: _GameCard(game: game),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _GameCard extends StatelessWidget {
  final NflGameModel game;

  const _GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 217, 217, 217),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Top Team
            _TeamSection(
              logo: game.team_one_logo,
              name: game.team_one_name,
              record: game.team_one_records,
              score: game.team_one_score,
            ),

            SizedBox(height: 12),

            // VS Separator
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'VS',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
              ],
            ),

            SizedBox(height: 12),

            // Bottom Team
            _TeamSection(
              logo: game.team_two_logo,
              name: game.team_two_name,
              record: game.team_two_records,
              score: game.team_two_score,
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamSection extends StatelessWidget {
  final String logo;
  final String name;
  final String record;
  final String score;

  const _TeamSection({
    required this.logo,
    required this.name,
    required this.record,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Team Logo
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),

          child: ClipOval(
            child: Image.network(
              logo,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.sports_football, color: Colors.grey[600]);
              },
            ),
          ),
        ),

        SizedBox(width: 12),

        // Team Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                record,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        // Score
        Text(
          score,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
