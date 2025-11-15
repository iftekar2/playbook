import 'package:flutter/material.dart';
import 'package:playbook/components/nba_data/database/nba_game_model.dart';
import 'package:playbook/components/nba_data/database/nba_live_games_repository.dart';
import 'package:playbook/components/nba_data/nba_game_detail_modal.dart';

class NbaLiveGamesHorizontalList extends StatefulWidget {
  final VoidCallback? onSeeAllPressed;
  final bool showAll;

  const NbaLiveGamesHorizontalList({
    super.key,
    this.onSeeAllPressed,
    this.showAll = false,
  });

  @override
  State<NbaLiveGamesHorizontalList> createState() =>
      _NbaLiveGamesHorizontalListState();
}

class _NbaLiveGamesHorizontalListState
    extends State<NbaLiveGamesHorizontalList> {
  final _nbaDatabase = NbaLiveGamesRepository();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NbaGameModel>>(
      stream: _nbaDatabase.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final games = snapshot.data ?? [];
        if (games.isEmpty) {
          return const Center(child: Text('No live NBA games available'));
        }

        final limitedGames = widget.showAll
            ? games
            : games.take(3).toList(growable: false);

        return Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: limitedGames.length,
                itemBuilder: (context, index) {
                  final game = limitedGames[index];
                  return Container(
                    width: 320,
                    margin: EdgeInsets.only(
                      right: index == limitedGames.length - 1 ? 0 : 16,
                    ),
                    child: GestureDetector(
                      onTap: () => NbaGameDetailModalHelper.show(context, game),
                      child: _GameCard(game: game),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GameCard extends StatelessWidget {
  final NbaGameModel game;

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
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _GameStatusSection(status: game.game_time),
            _TeamSection(
              logo: game.team_one_logo,
              name: game.team_one_name,
              record: game.team_one_record,
              score: game.team_one_score,
            ),
            const SizedBox(height: 12),
            const _VsSeparator(),
            const SizedBox(height: 12),
            _TeamSection(
              logo: game.team_two_logo,
              name: game.team_two_name,
              record: game.team_two_record,
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
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: ClipOval(
            child: logo.isNotEmpty
                ? Image.network(
                    logo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.sports_basketball,
                        color: Colors.grey[600],
                      );
                    },
                  )
                : Icon(Icons.sports_basketball, color: Colors.grey[600]),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                record,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Text(
          score,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _VsSeparator extends StatelessWidget {
  const _VsSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
    );
  }
}

class _GameStatusSection extends StatelessWidget {
  final String status;

  const _GameStatusSection({required this.status});

  @override
  Widget build(BuildContext context) {
    // Use the status directly (same as modal does)
    // Only hide if truly empty after trimming
    final displayStatus = status.trim();

    if (displayStatus.isEmpty) {
      return const SizedBox.shrink();
    }

    // Determine color based on game state (live/final logic)
    final statusLower = displayStatus.toLowerCase();
    final bool isLive =
        statusLower.contains('q') ||
        statusLower.contains('halftime') ||
        statusLower.contains('quarter') ||
        statusLower.contains('1st') ||
        statusLower.contains('2nd') ||
        statusLower.contains('3rd') ||
        statusLower.contains('4th');

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          displayStatus.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            // Use red for live games for emphasis
            color: isLive ? Colors.red[700] : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
