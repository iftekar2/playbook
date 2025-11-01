import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_live_games_repository.dart';
import 'package:playbook/components/home/sports_options.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';
import 'package:playbook/components/nfl_data/database/nfl_final_games_repository.dart';
import 'package:playbook/components/nfl_data/nfl_final_games_horizontal_list.dart';
import 'package:playbook/components/nfl_data/nfl_live_games_horizontal_list.dart';
import 'package:playbook/components/welcome_page.dart';

class ConditionalNflSection extends StatelessWidget {
  final NflLiveGamesRepository nflDatabase;
  final VoidCallback? onSeeAllPressed;
  final bool includeTopSpace;

  const ConditionalNflSection({
    super.key,
    required this.nflDatabase,
    this.onSeeAllPressed,
    this.includeTopSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: nflDatabase.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }

        final games = snapshot.data ?? [];

        if (games.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            if (includeTopSpace) const SizedBox(height: 20),

            LiveNflInHomeScreen(onSeeAllPressed: onSeeAllPressed),
          ],
        );
      },
    );
  }
}

class ConditionalFinalNflSection extends StatelessWidget {
  final NflFinalGamesRepository nflFinalDatabase;
  final VoidCallback? onSeeAllPressed;
  final bool includeTopSpace;

  const ConditionalFinalNflSection({
    super.key,
    required this.nflFinalDatabase,
    this.onSeeAllPressed,
    this.includeTopSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: nflFinalDatabase.stream,
      builder: (context, snapshot) {
        print(
          'ConditionalFinalNflSection - Connection State: ${snapshot.connectionState}',
        );
        print('ConditionalFinalNflSection - Has Data: ${snapshot.hasData}');
        print('ConditionalFinalNflSection - Has Error: ${snapshot.hasError}');
        if (snapshot.hasData) {
          print(
            'ConditionalFinalNflSection - Data Length: ${snapshot.data?.length}',
          );
        }
        if (snapshot.hasError) {
          print('ConditionalFinalNflSection - Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }

        final games = snapshot.data ?? [];
        print('ConditionalFinalNflSection - Games Count: ${games.length}');

        if (games.isEmpty) {
          print(
            'ConditionalFinalNflSection - Games is empty, returning SizedBox.shrink()',
          );
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            if (includeTopSpace) const SizedBox(height: 20),

            NflFinalGamesHorizontalList(onSeeAllPressed: onSeeAllPressed),
          ],
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback? onNavigateToLiveGames;
  final Function(String)? onSportSelected;
  final VoidCallback? onNavigateToFinalGames;
  const HomePage({
    super.key,
    this.onNavigateToLiveGames,
    this.onSportSelected,
    this.onNavigateToFinalGames,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authService = AuthService();
  final nflDatabase = NflLiveGamesRepository();
  final nflFinalDatabase = NflFinalGamesRepository();

  // Handle sport selection
  void _onSportSelected(String sport) {
    print('Selected sport: $sport');
    // Call the parent callback if provided
    widget.onSportSelected?.call(sport);
  }

  void logout() async {
    await authService.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Playbook",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: logout,
              icon: const Icon(Icons.logout, size: 28),
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          SportsOptions(onSportSelected: _onSportSelected),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Live Games",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ConditionalNflSection(
                    nflDatabase: nflDatabase,
                    onSeeAllPressed: widget.onNavigateToLiveGames,
                    includeTopSpace: false,
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Final Games",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ConditionalFinalNflSection(
                    nflFinalDatabase: nflFinalDatabase,
                    onSeeAllPressed: widget.onNavigateToFinalGames,
                    includeTopSpace: false,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
