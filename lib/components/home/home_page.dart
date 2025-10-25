import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_database.dart';
import 'package:playbook/components/home/sports_options.dart';
import 'package:playbook/components/login/email_login/auth_service.dart';
import 'package:playbook/components/nfl_data/nfl_in_home_screen.dart';
import 'package:playbook/components/welcome_page.dart';

class ConditionalNflSection extends StatelessWidget {
  final NflDatabase nflDatabase;
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

            NflInHomeScreen(onSeeAllPressed: onSeeAllPressed),
          ],
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback? onNavigateToLiveGames;

  const HomePage({super.key, this.onNavigateToLiveGames});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authService = AuthService();
  final nflDatabase = NflDatabase();

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
          const SportsOptions(),

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
                  ConditionalNflSection(nflDatabase: nflDatabase),

                  ConditionalNflSection(nflDatabase: nflDatabase),

                  ConditionalNflSection(nflDatabase: nflDatabase),

                  ConditionalNflSection(nflDatabase: nflDatabase),

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
