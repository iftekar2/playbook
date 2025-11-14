import 'package:flutter/material.dart';
import 'package:playbook/components/nba_data/database/nba_game_model.dart';

class NbaGameDetailModal extends StatefulWidget {
  final NbaGameModel game;
  final bool isFinal;

  const NbaGameDetailModal({
    super.key,
    required this.game,
    this.isFinal = false,
  });

  @override
  State<NbaGameDetailModal> createState() => _NbaGameDetailModalState();
}

class _NbaGameDetailModalState extends State<NbaGameDetailModal>
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
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeModal,
                child: Container(
                  color: Colors.black.withOpacity(0.5 * _fadeAnimation.value),
                ),
              ),
            ),
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
                  height: 720,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!widget.isFinal &&
                                _isGameLive(widget.game.game_status))
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red[600],
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
                              )
                            else
                              const SizedBox(width: 48),
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
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              _buildTeamsSection(),
                              const SizedBox(height: 24),
                              if (!widget.isFinal) _buildGameProgress(),
                              const SizedBox(height: 24),
                              _buildGameLeaders(),
                              const SizedBox(height: 24),
                              _buildStatisticsSection(),
                              const SizedBox(height: 24),
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildTeamAvatar(widget.game.team_one_logo),
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
                      widget.game.team_one_record,
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
          Row(
            children: [
              _buildTeamAvatar(widget.game.team_two_logo),
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
                      widget.game.team_two_record,
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

  Widget _buildGameProgress() {
    final gameInfo = _parseGameStatus();
    final int currentQuarter = gameInfo['quarter'] as int;
    final bool completed = gameInfo['completed'] as bool;
    final String time = gameInfo['time'] as String;
    final String statusLabel = gameInfo['status'] as String;

    final List<String> periods = ['1', '2', '3', '4'];
    if (statusLabel.toLowerCase().contains('ot') || currentQuarter > 4) {
      periods.add('OT');
    }

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
            children: periods.map((label) {
              final bool isCompleted;
              if (label == 'OT') {
                isCompleted = currentQuarter > 4 || completed;
              } else {
                final int periodNumber = int.tryParse(label) ?? 1;
                isCompleted = periodNumber < currentQuarter || completed;
              }
              return _buildQuarterIndicator(label, isCompleted);
            }).toList(),
          ),
          const SizedBox(height: 16),
          if (completed)
            const Text(
              'Game Over',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          else if (time.isNotEmpty)
            Text(
              '$time • ${_formatQuarterLabel(currentQuarter)}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            )
          else
            Text(
              statusLabel,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGameLeaders() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),

      child: Column(
        children: [
          Text(
            'Game Leaders',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Points Leader",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Column(
                          children: [
                            Image.network(
                              widget.game.team_one_points_leader_imag,
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
                              widget.game.team_one_points_leader_name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("PTS: "),
                                      Text(
                                        widget
                                            .game
                                            .team_one_points_leader_points,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("FG: "),
                                      Text(
                                        widget
                                            .game
                                            .team_one_points_leader_field_goal,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("FT: "),
                                      Text(
                                        widget
                                            .game
                                            .team_one_points_leader_free_throw,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 80,
                                child: VerticalDivider(
                                  color: Colors.grey[300],
                                  thickness: 1,
                                  width: 32,
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("PTS: "),
                                      Text(
                                        widget
                                            .game
                                            .team_two_points_leader_points,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("FG: "),
                                      Text(
                                        widget
                                            .game
                                            .team_two_points_leader_field_goal,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("FT: "),
                                      Text(
                                        widget
                                            .game
                                            .team_two_points_leader_free_throw,
                                        style: const TextStyle(
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

                        SizedBox(width: 10),

                        Column(
                          children: [
                            Image.network(
                              widget.game.team_two_points_leader_imag,
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
                              widget.game.team_two_points_leader_name,
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
            ],
          ),

          SizedBox(height: 10),

          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Rebounds Leader",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Column(
                          children: [
                            Image.network(
                              widget.game.team_one_rebound_leader_image,
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
                              widget.game.team_one_rebound_leader_name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("REB: "),
                                      Text(
                                        widget
                                            .game
                                            .team_one_rebound_leader_rebound,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("DREB: "),
                                      Text(
                                        widget.game.team_one_defensive_rebound,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("OREB: "),
                                      Text(
                                        widget.game.team_one_offensive_rebound,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 80,
                                child: VerticalDivider(
                                  color: Colors.grey[300],
                                  thickness: 1,
                                  width: 32,
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("REB: "),
                                      Text(
                                        widget
                                            .game
                                            .team_two_rebound_leader_rebound,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("DREB: "),
                                      Text(
                                        widget.game.team_two_defensive_rebound,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      const Text("OREB: "),
                                      Text(
                                        widget.game.team_two_offensive_rebound,
                                        style: const TextStyle(
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

                        SizedBox(width: 10),

                        Column(
                          children: [
                            Image.network(
                              widget.game.team_two_rebound_leader_image,
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
                              widget.game.team_two_rebound_leader_name,
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

              SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Assists Leader",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_one_assist_leader_image,
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
                                  widget.game.team_one_assist_leader_name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("AST: "),
                                          Text(
                                            widget
                                                .game
                                                .team_one_assist_leader_assist,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 5),

                                      Row(
                                        children: [
                                          const Text("TO: "),
                                          Text(
                                            widget
                                                .game
                                                .team_one_assist_leader_turnover,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 80,
                                    child: VerticalDivider(
                                      color: Colors.grey[300],
                                      thickness: 1,
                                      width: 32,
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("AST: "),
                                          Text(
                                            widget
                                                .game
                                                .team_two_assist_leader_assist,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 5),

                                      Row(
                                        children: [
                                          const Text("TO: "),
                                          Text(
                                            widget
                                                .game
                                                .team_two_assist_leader_turnover,
                                            style: const TextStyle(
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

                            SizedBox(width: 10),

                            Column(
                              children: [
                                Image.network(
                                  widget.game.team_two_assist_leader_image,
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
                                  widget.game.team_two_points_leader_name,
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
                ],
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
            'Team Comparison',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      label: 'FG %',
                      value: widget.game.team_one_field_goal_percentage,
                    ),
                    _buildStatRow(
                      label: '3PT %',
                      value: widget.game.team_one_three_points_percentage,
                    ),
                    _buildStatRow(
                      label: 'Turnovers',
                      value: widget.game.team_one_turnovers,
                    ),
                    _buildStatRow(
                      label: 'Rebounds',
                      value: widget.game.team_one_rebound,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 180,
                child: VerticalDivider(
                  color: Colors.grey[300],
                  thickness: 1,
                  width: 32,
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      label: 'FG %',
                      value: widget.game.team_two_field_goal_percentage,
                    ),
                    _buildStatRow(
                      label: '3PT %',
                      value: widget.game.team_two_three_points_percentage,
                    ),
                    _buildStatRow(
                      label: 'Turnovers',
                      value: widget.game.team_two_turnovers,
                    ),
                    _buildStatRow(
                      label: 'Rebounds',
                      value: widget.game.team_two_rebound,
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

  // Widget _buildLeaderCard({
  //   required String title,
  //   required String teamOneImage,
  //   required String teamOneName,
  //   required String teamOnePrimaryStat,
  //   required List<String> teamOneSecondaryStatsOne,
  //   required List<String> teamOneSecondaryStats,
  //   required String teamTwoImage,
  //   required String teamTwoName,
  //   required String teamTwoPrimaryStat,
  //   required List<String> teamTwoSecondaryStats,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.grey[200]!),
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: const TextStyle(
  //             fontSize: 15,
  //             fontWeight: FontWeight.w600,
  //             color: Colors.black87,
  //           ),
  //         ),
  //         const SizedBox(height: 12),
  //         Row(
  //           children: [
  //             _buildLeaderInfo(
  //               image: teamOneImage,
  //               name: teamOneName,
  //               primaryStat: teamOnePrimaryStat,
  //               secondaryStats: teamOneSecondaryStats,
  //               alignment: CrossAxisAlignment.start,
  //             ),
  //             const SizedBox(width: 16),
  //             // Expanded(
  //             //   child: Column(
  //             //     children: [
  //             //       Text(
  //             //         teamOnePrimaryStat,
  //             //         style: const TextStyle(
  //             //           fontSize: 16,
  //             //           fontWeight: FontWeight.bold,
  //             //         ),
  //             //       ),
  //             //       const SizedBox(height: 4),
  //             //       Text('vss', style: TextStyle(color: Colors.grey[500])),
  //             //       const SizedBox(height: 4),
  //             //       Text(
  //             //         teamTwoPrimaryStat,
  //             //         style: const TextStyle(
  //             //           fontSize: 16,
  //             //           fontWeight: FontWeight.bold,
  //             //         ),
  //             //       ),
  //             //     ],
  //             //   ),
  //             // ),
  //             const SizedBox(width: 16),
  //             _buildLeaderInfo(
  //               image: teamTwoImage,
  //               name: teamTwoName,
  //               primaryStat: teamTwoPrimaryStat,
  //               secondaryStats: teamTwoSecondaryStats,
  //               alignment: CrossAxisAlignment.end,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildLeaderInfo({
  //   required String image,
  //   required String name,
  //   required String primaryStat,
  //   required List<String> secondaryStats,
  //   required CrossAxisAlignment alignment,
  // }) {
  //   return Column(
  //     crossAxisAlignment: alignment,
  //     children: [
  //       ClipOval(
  //         child: SizedBox(
  //           width: 60,
  //           height: 60,
  //           child: image.isNotEmpty
  //               ? Image.network(
  //                   image,
  //                   fit: BoxFit.cover,
  //                   errorBuilder: (context, error, stackTrace) {
  //                     return Icon(
  //                       Icons.person,
  //                       size: 40,
  //                       color: Colors.grey[500],
  //                     );
  //                   },
  //                 )
  //               : Icon(Icons.person, size: 40, color: Colors.grey[500]),
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       SizedBox(
  //         width: 120,
  //         child: Text(
  //           name,
  //           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis,
  //           textAlign: alignment == CrossAxisAlignment.start
  //               ? TextAlign.left
  //               : TextAlign.right,
  //         ),
  //       ),
  //       const SizedBox(height: 4),
  //       Text(
  //         primaryStat,
  //         style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //         textAlign: alignment == CrossAxisAlignment.start
  //             ? TextAlign.left
  //             : TextAlign.right,
  //       ),
  //       const SizedBox(height: 2),
  //       ...secondaryStats.map(
  //         (stat) => SizedBox(
  //           width: 120,
  //           child: Text(
  //             stat,
  //             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
  //             textAlign: alignment == CrossAxisAlignment.start
  //                 ? TextAlign.left
  //                 : TextAlign.right,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildStatRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
          Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildQuarterIndicator(String label, bool completed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: completed ? Colors.blue : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: completed ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTeamAvatar(String logoUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: ClipOval(
        child: logoUrl.isNotEmpty
            ? Image.network(
                logoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.sports_basketball,
                    size: 30,
                    color: Colors.grey[600],
                  );
                },
              )
            : Icon(Icons.sports_basketball, size: 30, color: Colors.grey[600]),
      ),
    );
  }

  bool _isGameLive(String status) {
    final lowered = status.toLowerCase();
    if (lowered.isEmpty) return false;
    if (lowered.contains('final')) return false;
    return lowered.contains('q') ||
        lowered.contains('quarter') ||
        lowered.contains('halftime') ||
        lowered.contains('1st') ||
        lowered.contains('2nd') ||
        lowered.contains('3rd') ||
        lowered.contains('4th') ||
        lowered.contains('ot');
  }

  Map<String, dynamic> _parseGameStatus() {
    final status = widget.game.game_status.trim();
    if (status.isEmpty) {
      return {
        'quarter': 1,
        'completed': false,
        'status': 'Scheduled',
        'time': '',
      };
    }

    final lowered = status.toLowerCase();

    if (lowered.contains('final')) {
      return {
        'quarter': lowered.contains('ot') ? 5 : 4,
        'completed': true,
        'status': status,
        'time': '',
      };
    }

    if (lowered.contains('halftime')) {
      return {
        'quarter': 2,
        'completed': false,
        'status': status,
        'time': 'HALFTIME',
      };
    }

    int quarter = 1;
    String time = '';

    final timeMatch = RegExp(r'(\d+:\d{2})').firstMatch(status);
    if (timeMatch != null) {
      time = timeMatch.group(1) ?? '';
    }

    final quarterMatch = RegExp(
      r'(?:qtr|quarter|q)\s*(\d+)',
      caseSensitive: false,
    ).firstMatch(status);
    if (quarterMatch != null) {
      quarter = int.tryParse(quarterMatch.group(1) ?? '') ?? quarter;
    } else {
      final ordinalMatch = RegExp(
        r'(\d+)(?:st|nd|rd|th)\s+quarter',
        caseSensitive: false,
      ).firstMatch(status);
      if (ordinalMatch != null) {
        quarter = int.tryParse(ordinalMatch.group(1) ?? '') ?? quarter;
      } else if (lowered.contains('ot')) {
        quarter = 5;
      }
    }

    return {
      'quarter': quarter,
      'completed': false,
      'status': status,
      'time': time,
    };
  }

  String _formatQuarterLabel(int quarter) {
    if (quarter <= 4) {
      return '${quarter}${_getOrdinalSuffix(quarter)} Quarter';
    }
    if (quarter == 5) {
      return 'Overtime';
    }
    return 'OT ${quarter - 4}';
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
}

class NbaGameDetailModalHelper {
  static void show(
    BuildContext context,
    NbaGameModel game, {
    bool isFinal = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) => NbaGameDetailModal(game: game, isFinal: isFinal),
    );
  }
}
