import 'package:flutter/material.dart';
import 'package:playbook/components/final_games/final_games_page.dart';
import 'package:playbook/components/home/home_page.dart';
import 'package:playbook/components/live_games/live_games_page.dart';
import 'package:playbook/components/search/search_page.dart';
import 'package:playbook/components/upcoming_games/upcoming_games_page.dart';
import 'package:playbook/components/nfl_data/nfl_landing_page.dart';
import 'package:playbook/components/nba_data/nba_page.dart';
import 'package:playbook/components/nhl_data/nhl_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  // Method to handle sport page navigation
  void navigateToSport(String sport) {
    setState(() {
      switch (sport) {
        case 'NFL':
          _currentIndex = 5;
          break;
        case 'NBA':
          _currentIndex = 6;
          break;
        case 'NHL':
          _currentIndex = 7;
          break;
        case 'MLB':
          _currentIndex = 8;
          break;
        default:
          _currentIndex = 0;
      }
    });
  }

  // Bottom navigation bar items
  List<Widget> _getScreens() {
    return [
      HomePage(
        onNavigateToLiveGames: () {
          setState(() {
            _currentIndex = 1; // Navigate to Live Games Page
          });
        },

        onNavigateToFinalGames: () {
          setState(() {
            _currentIndex = 3; // Navigate to Final Games Page
          });
        },

        onSportSelected: (String sport) {
          navigateToSport(sport);
        },
      ),
      LiveGamesPage(),
      SearchPage(),
      FinalGamesPage(),
      UpcomingGamesPage(),
      NflLandingPage(),
      NbaPage(),
      NhlPage(),
      // MLB page would go here when created
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screens = _getScreens();

    return Scaffold(
      body: screens[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  label: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  icon: Icons.live_tv,
                  selectedIcon: Icons.live_tv,
                  label: 'Live',
                  index: 1,
                ),
                _buildNavItem(
                  icon: Icons.search,
                  selectedIcon: Icons.search_outlined,
                  label: 'Search',
                  index: 2,
                ),
                _buildNavItem(
                  icon: Icons.sports_score,
                  selectedIcon: Icons.sports_score,
                  label: 'Final',
                  index: 3,
                ),

                _buildNavItem(
                  icon: Icons.calendar_month_outlined,
                  selectedIcon: Icons.calendar_month,
                  label: 'Schedule',
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    final color = isSelected
        ? Color.fromRGBO(48, 40, 40, 1)
        : Color.fromRGBO(158, 158, 158, 1);

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isSelected ? selectedIcon : icon, color: color, size: 28),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
