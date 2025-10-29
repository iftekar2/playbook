import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_game.dart';

class NflGameDetailModal extends StatefulWidget {
  final NflGame game;

  const NflGameDetailModal({super.key, required this.game});

  @override
  State<NflGameDetailModal> createState() => _NflGameDetailModalState();
}

class _NflGameDetailModalState extends State<NflGameDetailModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeModal() {
    _animationController.reverse().then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          children: [
            // Background overlay
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeModal,
                child: Container(
                  color: Colors.black.withOpacity(0.5 * _fadeAnimation.value),
                ),
              ),
            ),
            // Modal content
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Transform.translate(
                offset: Offset(
                  0,
                  MediaQuery.of(context).size.height *
                      0.3 *
                      _slideAnimation.value,
                ),
                child: Container(
                  height: 800,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Handle bar
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      // Header
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'LIVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _closeModal,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Game content
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              // Teams section
                              _buildTeamsSection(),
                              const SizedBox(height: 24),
                              // Game progress
                              _buildGameProgress(),
                              const SizedBox(height: 24),
                              // Player status
                              _buildPlayerStatus(),
                              const SizedBox(height: 24),
                              // Statistics
                              _buildStatisticsSection(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTeamsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          // Team 1
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipOval(
                  child: Image.network(
                    widget.game.team_one_logo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        size: 60,
                    5   color: Colors.grey[600],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.game.team_one_name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.game.team_one_records,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                widget.game.team_one_score,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // VS separator
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'VS',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
            ],
          ),
          const SizedBox(height: 20),
          // Team 2
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipOval(
                  child: Image.network(
                    widget.game.team_two_logo,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person,
                        size: 60,
                    5   color: Colors.grey[600],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.game.team_two_name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.game.team_two_records,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                widget.game.team_two_score,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to parse game status and extract quarter info
  Map<String, dynamic> _parseGameStatus() {
    String status = widget.game.game_status;

    // Check if game is final
    if (status.toLowerCase().contains('final')) {
      return {'quarter': 4, 'completed': true, 'status': 'Final', 'time': ''};
    }

    // Parse format like "12:03 - 4th" or "8:42 - 3rd"
    try {
      RegExp regExp = RegExp(r'(\d+:\d+)\s*-\s*(\d+)');
      Match? match = regExp.firstMatch(status);

      if (match != null) {
        String time = match.group(1) ?? '';
        int quarter = int.tryParse(match.group(2) ?? '') ?? 1;

        return {
          'quarter': quarter,
          'completed': false,
          'status': status,
          'time': time,
        };
      }
    } catch (e) {
      // If parsing fails, return default values
    }

    // Default return
    return {'quarter': 1, 'completed': false, 'status': status, 'time': ''};
  }

  Widget _buildGameProgress() {
    final gameInfo = _parseGameStatus();
    final currentQuarter = gameInfo['quarter'] as int;
    final isGameOver = gameInfo['completed'] as bool;
    final timeRemaining = gameInfo['time'] as String;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          const Text(
            'Game Progress',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildQuarterIndicator('1', 1 < currentQuarter),
              _buildQuarterIndicator('2', 2 < currentQuarter),
              _buildQuarterIndicator('3', 3 < currentQuarter),
              _buildQuarterIndicator('4', 4 < currentQuarter),
            ],
          ),
          const SizedBox(height: 16),
          if (isGameOver)
            const Text(
              'Game Over',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          else if (timeRemaining.isNotEmpty)
            Text(
              '$currentQuarter${_getOrdinalSuffix(currentQuarter)} Quarter - $timeRemaining',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          else
            Text(
              widget.game.game_status,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
    );
  }

  String _getOrdinalSuffix(int number) {
    if (number >= 11 && number <= 13) return 'th';
    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  Widget _buildQuarterIndicator(String quarter, bool completed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: completed ? Colors.blue : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          quarter,
          style: TextStyle(
            color: completed ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerStatus() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          const Text(
            'Game Leaders',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 15),

          Column(
            children: [
              SizedBox(
                height: 130,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Passing Yards",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_one_passing_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_one_passing_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_one_player_one_passing_yard,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),
                                    Text(
                                      widget
                                          .game
                                          .team_one_passing_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_two_player_two_passing_yard,

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      widget
                                          .game
                                          .team_two_passing_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_two_passing_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_two_passing_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Column(
            children: [
              SizedBox(
                height: 130,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Rushing Yards",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_one_rushing_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_one_rushing_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_one_player_one_rushing_yard,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),
                                    Text(
                                      widget
                                          .game
                                          .team_one_rushing_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_two_player_two_rushing_yard,

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      widget
                                          .game
                                          .team_two_rushing_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_two_rushing_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_two_rushing_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Column(
            children: [
              SizedBox(
                height: 130,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Receiving Yards",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_one_receiving_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget
                                      .game
                                      .team_one_receiving_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_one_player_one_receiving_yard,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),
                                    Text(
                                      widget
                                          .game
                                          .team_one_receiving_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget
                                          .game
                                          .team_two_player_two_receiving_yard,

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      widget
                                          .game
                                          .team_two_receiving_yard_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget
                                      .game
                                      .team_two_receiving_yard_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget
                                      .game
                                      .team_two_receiving_yard_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Column(
            children: [
              SizedBox(
                height: 130,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Sacks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_one_sacks_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_one_sacks_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.game.team_one_player_one_sacks,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.game.team_two_player_two_sacks,

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_two_sacks_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_two_sacks_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Column(
            children: [
              SizedBox(
                height: 130,
                width: 400,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Tackles",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_one_tackles_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_one_tackles_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.game.team_one_player_one_tackles,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),
                                    Text(
                                      widget
                                          .game
                                          .team_one_tackles_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.game.team_two_player_two_tackles,

                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      widget
                                          .game
                                          .team_two_tackles_player_game_state,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_two_tackles_player_image,
                                  width: 60,
                                  height: 60,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),

                                Text(
                                  widget.game.team_two_tackles_player_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          const Text(
            'Game Statistics',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.game.team_one_name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildStatRow(
                      'Total Yards',
                      widget.game.team_one_total_yards,
                    ),
                    _buildStatRow(
                      'Turnovers',
                      widget.game.team_one_total_turnovers,
                    ),
                    _buildStatRow(
                      'First Downs',
                      widget.game.team_one_first_downs,
                    ),
                    _buildStatRow(
                      'Third Downs',
                      widget.game.team_one_third_down,
                    ),
                    _buildStatRow(
                      'Forth Downs',
                      widget.game.team_one_forth_down,
                    ),
                    _buildStatRow('Red Zone', widget.game.team_one_red_zone),
                    _buildStatRow(
                      'Time of Position',
                      widget.game.team_one_possession,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  width: 1,
                  height: 180,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.game.team_two_name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildStatRow(
                      'Total Yards',
                      widget.game.team_two_total_yards,
                    ),
                    _buildStatRow(
                      'Turnovers',
                      widget.game.team_two_total_turnovers,
                    ),
                    _buildStatRow(
                      'First Downs',
                      widget.game.team_two_first_downs,
                    ),
                    _buildStatRow(
                      'Third Downs',
                      widget.game.team_two_third_down,
                    ),
                    _buildStatRow(
                      'Forth Downs',
                      widget.game.team_two_forth_down,
                    ),
                    _buildStatRow('Red Zone', widget.game.team_two_red_zone),
                    _buildStatRow(
                      'Time of Position',
                      widget.game.team_two_possession,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 67, 67, 67),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Static method to show the modal
class NflGameDetailModalHelper {
  static void show(BuildContext context, NflGame game) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) => NflGameDetailModal(game: game),
    );
  }
}
