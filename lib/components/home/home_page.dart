import 'package:flutter/material.dart';
import 'package:playbook/components/home/sports_options.dart';
import 'package:playbook/components/nfl_data/nfl_in_home_screen.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onNavigateToLiveGames;

  const HomePage({super.key, this.onNavigateToLiveGames});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Playbook",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            //letterSpacing: 1.0,
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          SportsOptions(),

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

                  NflInHomeScreen(
                    onSeeAllPressed: widget.onNavigateToLiveGames,
                  ),

                  const SizedBox(height: 20),
                  NflInHomeScreen(),

                  const SizedBox(height: 20),
                  NflInHomeScreen(),

                  const SizedBox(height: 20),
                  NflInHomeScreen(),

                  const SizedBox(height: 20),
                  NflInHomeScreen(),

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
