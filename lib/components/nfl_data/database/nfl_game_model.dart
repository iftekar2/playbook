class NflGame {
  int? id;
  String team_one_logo;
  String team_one_name;
  String team_one_records;
  String team_one_score;

  String team_two_logo;
  String team_two_name;
  String team_two_records;
  String team_two_score;

  String team_one_total_yards;
  String team_two_total_yards;
  String team_one_total_turnovers;
  String team_two_total_turnovers;
  String team_one_first_downs;
  String team_two_first_downs;
  String team_one_penalties;
  String team_two_penalties;
  String team_one_third_down;
  String team_two_third_down;
  String team_one_forth_down;
  String team_two_forth_down;
  String team_one_red_zone;
  String team_two_red_zone;
  String team_one_possession;
  String team_two_possession;

  String game_status;

  String team_one_passing_yard_player_image;
  String team_one_passing_yard_player_name;
  String team_one_passing_yard_player_position;
  String team_one_passing_yard_player_game_state;
  String team_one_player_one_passing_yard;
  String team_two_passing_yard_player_image;
  String team_two_passing_yard_player_name;
  String team_two_passing_yard_player_position;
  String team_two_passing_yard_player_game_state;
  String team_two_player_two_passing_yard;

  String team_one_rushing_yard_player_image;
  String team_one_rushing_yard_player_name;
  String team_one_rushing_yard_player_position;
  String team_one_rushing_yard_player_game_state;
  String team_one_player_one_rushing_yard;
  String team_two_rushing_yard_player_image;
  String team_two_rushing_yard_player_name;
  String team_two_rushing_yard_player_position;
  String team_two_rushing_yard_player_game_state;
  String team_two_player_two_rushing_yard;

  String team_one_receiving_yard_player_image;
  String team_one_receiving_yard_player_name;
  String team_one_receiving_yard_player_position;
  String team_one_receiving_yard_player_game_state;
  String team_one_player_one_receiving_yard;
  String team_two_receiving_yard_player_image;
  String team_two_receiving_yard_player_name;
  String team_two_receiving_yard_player_position;
  String team_two_receiving_yard_player_game_state;
  String team_two_player_two_receiving_yard;

  String team_one_sacks_player_image;
  String team_one_sacks_player_name;
  String team_one_sacks_player_position;
  String team_one_player_one_sacks;
  String team_two_sacks_player_image;
  String team_two_sacks_player_name;
  String team_two_sacks_player_position;
  String team_two_player_two_sacks;

  String team_one_tackles_player_image;
  String team_one_tackles_player_name;
  String team_one_tackles_player_position;
  String team_one_tackles_player_game_state;
  String team_one_player_one_tackles;
  String team_two_tackles_player_image;
  String team_two_tackles_player_name;
  String team_two_tackles_player_position;
  String team_two_tackles_player_game_state;
  String team_two_player_two_tackles;

  NflGame({
    this.id,
    required this.team_one_logo,
    required this.team_one_name,
    required this.team_one_records,
    required this.team_one_score,

    required this.team_two_logo,
    required this.team_two_name,
    required this.team_two_records,
    required this.team_two_score,

    required this.team_one_total_yards,
    required this.team_two_total_yards,
    required this.team_one_total_turnovers,
    required this.team_two_total_turnovers,
    required this.team_one_first_downs,
    required this.team_two_first_downs,
    required this.team_one_penalties,
    required this.team_two_penalties,
    required this.team_one_third_down,
    required this.team_two_third_down,
    required this.team_one_forth_down,
    required this.team_two_forth_down,
    required this.team_one_red_zone,
    required this.team_two_red_zone,
    required this.team_one_possession,
    required this.team_two_possession,

    required this.game_status,

    required this.team_one_passing_yard_player_image,
    required this.team_one_passing_yard_player_name,
    required this.team_one_passing_yard_player_position,
    required this.team_one_passing_yard_player_game_state,
    required this.team_one_player_one_passing_yard,
    required this.team_two_passing_yard_player_image,
    required this.team_two_passing_yard_player_name,
    required this.team_two_passing_yard_player_position,
    required this.team_two_passing_yard_player_game_state,
    required this.team_two_player_two_passing_yard,

    required this.team_one_rushing_yard_player_image,
    required this.team_one_rushing_yard_player_name,
    required this.team_one_rushing_yard_player_position,
    required this.team_one_rushing_yard_player_game_state,
    required this.team_one_player_one_rushing_yard,
    required this.team_two_rushing_yard_player_image,
    required this.team_two_rushing_yard_player_name,
    required this.team_two_rushing_yard_player_position,
    required this.team_two_rushing_yard_player_game_state,
    required this.team_two_player_two_rushing_yard,

    required this.team_one_receiving_yard_player_image,
    required this.team_one_receiving_yard_player_name,
    required this.team_one_receiving_yard_player_position,
    required this.team_one_receiving_yard_player_game_state,
    required this.team_one_player_one_receiving_yard,
    required this.team_two_receiving_yard_player_image,
    required this.team_two_receiving_yard_player_name,
    required this.team_two_receiving_yard_player_position,
    required this.team_two_receiving_yard_player_game_state,
    required this.team_two_player_two_receiving_yard,

    required this.team_one_sacks_player_image,
    required this.team_one_sacks_player_name,
    required this.team_one_sacks_player_position,
    required this.team_one_player_one_sacks,
    required this.team_two_sacks_player_image,
    required this.team_two_sacks_player_name,
    required this.team_two_sacks_player_position,
    required this.team_two_player_two_sacks,

    required this.team_one_tackles_player_image,
    required this.team_one_tackles_player_name,
    required this.team_one_tackles_player_position,
    required this.team_one_tackles_player_game_state,
    required this.team_one_player_one_tackles,
    required this.team_two_tackles_player_image,
    required this.team_two_tackles_player_name,
    required this.team_two_tackles_player_position,
    required this.team_two_tackles_player_game_state,
    required this.team_two_player_two_tackles,
  });

  factory NflGame.fromMap(Map<String, dynamic> map) {
    return NflGame(
      id: map['id'] as int?,
      team_one_logo: (map['team_one_logo'] ?? '').toString(),
      team_one_name: (map['team_one_name'] ?? '').toString(),
      team_one_records: (map['team_one_records'] ?? '').toString(),
      team_one_score: (map['team_one_score'] ?? '').toString(),

      team_two_logo: (map['team_two_logo'] ?? '').toString(),
      team_two_name: (map['team_two_name'] ?? '').toString(),
      team_two_records: (map['team_two_records'] ?? '').toString(),
      team_two_score: (map['team_two_score'] ?? '').toString(),

      team_one_total_yards: (map['team_one_total_yards'] ?? '').toString(),
      team_two_total_yards: (map['team_two_total_yards'] ?? '').toString(),
      team_one_total_turnovers: (map['team_one_total_turnovers'] ?? '')
          .toString(),
      team_two_total_turnovers: (map['team_two_total_turnovers'] ?? '')
          .toString(),
      team_one_first_downs: (map['team_one_first_downs'] ?? '').toString(),
      team_two_first_downs: (map['team_two_first_downs'] ?? '').toString(),
      team_one_penalties: (map['team_one_penalties'] ?? '').toString(),
      team_two_penalties: (map['team_two_penalties'] ?? '').toString(),
      team_one_third_down: (map['team_one_third_down'] ?? '').toString(),
      team_two_third_down: (map['team_two_third_down'] ?? '').toString(),
      team_one_forth_down: (map['team_one_forth_down'] ?? '').toString(),
      team_two_forth_down: (map['team_two_forth_down'] ?? '').toString(),
      team_one_red_zone: (map['team_one_red_zone'] ?? '').toString(),
      team_two_red_zone: (map['team_two_red_zone'] ?? '').toString(),
      team_one_possession: (map['team_one_possession'] ?? '').toString(),
      team_two_possession: (map['team_two_possession'] ?? '').toString(),

      game_status: (map['game_status'] ?? '').toString(),

      team_one_passing_yard_player_image:
          (map["team_one_passing_yard_player_image"] ?? '').toString(),
      team_one_passing_yard_player_name:
          (map["team_one_passing_yard_player_name"] ?? '').toString(),
      team_one_passing_yard_player_position:
          (map["team_one_passing_yard_player_position"] ?? '').toString(),
      team_one_passing_yard_player_game_state:
          (map["team_one_passing_yard_player_game_state"] ?? '').toString(),
      team_one_player_one_passing_yard:
          (map["team_one_player_one_passing_yard"] ?? '').toString(),
      team_two_passing_yard_player_image:
          (map["team_two_passing_yard_player_image"] ?? '').toString(),
      team_two_passing_yard_player_name:
          (map["team_two_passing_yard_player_name"] ?? '').toString(),
      team_two_passing_yard_player_position:
          (map["team_two_passing_yard_player_position"] ?? '').toString(),
      team_two_passing_yard_player_game_state:
          (map["team_two_passing_yard_player_game_state"] ?? '').toString(),
      team_two_player_two_passing_yard:
          (map["team_two_player_two_passing_yard"] ?? '').toString(),

      team_one_rushing_yard_player_image:
          (map["team_one_rushing_yard_player_image"] ?? '').toString(),
      team_one_rushing_yard_player_name:
          (map["team_one_rushing_yard_player_name"] ?? '').toString(),
      team_one_rushing_yard_player_position:
          (map["team_one_rushing_yard_player_position"] ?? '').toString(),
      team_one_rushing_yard_player_game_state:
          (map["team_one_rushing_yard_player_game_state"] ?? '').toString(),
      team_one_player_one_rushing_yard:
          (map["team_one_player_one_rushing_yard"] ?? '').toString(),
      team_two_rushing_yard_player_image:
          (map["team_two_rushing_yard_player_image"] ?? '').toString(),
      team_two_rushing_yard_player_name:
          (map["team_two_rushing_yard_player_name"] ?? '').toString(),
      team_two_rushing_yard_player_position:
          (map["team_two_rushing_yard_player_position"] ?? '').toString(),
      team_two_rushing_yard_player_game_state:
          (map["team_two_rushing_yard_player_game_state"] ?? '').toString(),
      team_two_player_two_rushing_yard:
          (map["team_two_player_two_rushing_yard"] ?? '').toString(),

      team_one_receiving_yard_player_image:
          (map["team_one_receiving_yard_player_image"] ?? '').toString(),
      team_one_receiving_yard_player_name:
          (map["team_one_receiving_yard_player_name"] ?? '').toString(),
      team_one_receiving_yard_player_position:
          (map["team_one_receiving_yard_player_position"] ?? '').toString(),
      team_one_receiving_yard_player_game_state:
          (map["team_one_receiving_yard_player_game_state"] ?? '').toString(),
      team_one_player_one_receiving_yard:
          (map["team_one_player_one_receiving_yard"] ?? '').toString(),
      team_two_receiving_yard_player_image:
          (map["team_two_receiving_yard_player_image"] ?? '').toString(),
      team_two_receiving_yard_player_name:
          (map["team_two_receiving_yard_player_name"] ?? '').toString(),
      team_two_receiving_yard_player_position:
          (map["team_two_receiving_yard_player_position"] ?? '').toString(),
      team_two_receiving_yard_player_game_state:
          (map["team_two_receiving_yard_player_game_state"] ?? '').toString(),
      team_two_player_two_receiving_yard:
          (map["team_two_player_two_receiving_yard"] ?? '').toString(),

      team_one_sacks_player_image: (map["team_one_sacks_player_image"] ?? '')
          .toString(),
      team_one_sacks_player_name: (map["team_one_sacks_player_name"] ?? '')
          .toString(),
      team_one_sacks_player_position:
          (map["team_one_sacks_player_position"] ?? '').toString(),
      team_one_player_one_sacks: (map["team_one_player_one_sacks"] ?? '')
          .toString(),
      team_two_sacks_player_image: (map["team_two_sacks_player_image"] ?? '')
          .toString(),
      team_two_sacks_player_name: (map["team_two_sacks_player_name"] ?? '')
          .toString(),
      team_two_sacks_player_position:
          (map["team_two_sacks_player_position"] ?? '').toString(),
      team_two_player_two_sacks: (map["team_two_player_two_sacks"] ?? '')
          .toString(),

      team_one_tackles_player_image:
          (map["team_one_tackles_player_image"] ?? '').toString(),
      team_one_tackles_player_name: (map["team_one_tackles_player_name"] ?? '')
          .toString(),
      team_one_tackles_player_position:
          (map["team_one_tackles_player_position"] ?? '').toString(),
      team_one_tackles_player_game_state:
          (map["team_one_tackles_player_game_state"] ?? '').toString(),
      team_one_player_one_tackles: (map["team_one_player_one_tackles"] ?? '')
          .toString(),
      team_two_tackles_player_image:
          (map["team_two_tackles_player_image"] ?? '').toString(),
      team_two_tackles_player_name: (map["team_two_tackles_player_name"] ?? '')
          .toString(),
      team_two_tackles_player_position:
          (map["team_two_tackles_player_position"] ?? '').toString(),
      team_two_tackles_player_game_state:
          (map["team_two_tackles_player_game_state"] ?? '').toString(),
      team_two_player_two_tackles: (map["team_two_player_two_tackles"] ?? '')
          .toString(),
    );
  }
}
