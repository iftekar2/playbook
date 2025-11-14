class NbaGameModel {
  int? id;

  String game_status;

  String team_one_logo;
  String team_two_logo;
  String team_one_name;
  String team_two_name;
  String team_one_score;
  String team_two_score;
  String team_one_record;
  String team_two_record;

  String team_one_points_leader_imag;
  String team_two_points_leader_imag;
  String team_one_points_leader_name;
  String team_two_points_leader_name;

  String team_one_points_leader_points;
  String team_two_points_leader_points;
  String team_one_points_leader_field_goal;
  String team_two_points_leader_field_goal;

  String team_one_points_leader_free_throw;
  String team_two_points_leader_free_throw;
  String team_one_rebound_leader_image;
  String team_two_rebound_leader_image;

  String team_one_rebound_leader_name;
  String team_two_rebound_leader_name;
  String team_one_rebound_leader_rebound;
  String team_two_rebound_leader_rebound;

  String team_one_defensive_rebound;
  String team_two_defensive_rebound;
  String team_one_offensive_rebound;
  String team_two_offensive_rebound;

  String team_one_assist_leader_image;
  String team_two_assist_leader_image;
  String team_one_assist_leader_name;
  String team_two_assist_leader_name;
  String team_one_assist_leader_assist;
  String team_two_assist_leader_assist;
  String team_one_assist_leader_turnover;
  String team_two_assist_leader_turnover;

  String team_one_field_goal_percentage;
  String team_two_field_goal_percentage;
  String team_one_three_points_percentage;
  String team_two_three_points_percentage;
  String team_one_turnovers;
  String team_two_turnovers;
  String team_one_rebound;
  String team_two_rebound;

  NbaGameModel({
    this.id,

    required this.game_status,

    required this.team_one_logo,
    required this.team_two_logo,
    required this.team_one_name,
    required this.team_two_name,
    required this.team_one_score,
    required this.team_two_score,
    required this.team_one_record,
    required this.team_two_record,

    required this.team_one_points_leader_imag,
    required this.team_two_points_leader_imag,
    required this.team_one_points_leader_name,
    required this.team_two_points_leader_name,

    required this.team_one_points_leader_points,
    required this.team_two_points_leader_points,
    required this.team_one_points_leader_field_goal,
    required this.team_two_points_leader_field_goal,

    required this.team_one_points_leader_free_throw,
    required this.team_two_points_leader_free_throw,
    required this.team_one_rebound_leader_image,
    required this.team_two_rebound_leader_image,

    required this.team_one_rebound_leader_name,
    required this.team_two_rebound_leader_name,
    required this.team_one_rebound_leader_rebound,
    required this.team_two_rebound_leader_rebound,

    required this.team_one_defensive_rebound,
    required this.team_two_defensive_rebound,
    required this.team_one_offensive_rebound,
    required this.team_two_offensive_rebound,
    required this.team_one_assist_leader_image,

    required this.team_two_assist_leader_image,
    required this.team_one_assist_leader_name,
    required this.team_two_assist_leader_name,
    required this.team_one_assist_leader_assist,
    required this.team_two_assist_leader_assist,

    required this.team_one_assist_leader_turnover,
    required this.team_two_assist_leader_turnover,
    required this.team_one_field_goal_percentage,
    required this.team_two_field_goal_percentage,

    required this.team_one_three_points_percentage,
    required this.team_two_three_points_percentage,
    required this.team_one_turnovers,
    required this.team_two_turnovers,
    required this.team_one_rebound,
    required this.team_two_rebound,
  });

  factory NbaGameModel.fromMap(Map<String, dynamic> map) {
    return NbaGameModel(
      id: map['id'] as int?,

      game_status: (map['game_status'] ?? '').toString(),

      team_one_logo: (map['team_one_logo'] ?? '').toString(),
      team_two_logo: (map['team_two_logo'] ?? '').toString(),
      team_one_name: (map['team_one_name'] ?? '').toString(),
      team_two_name: (map['team_two_name'] ?? '').toString(),
      team_one_score: (map['team_one_score'] ?? '').toString(),
      team_two_score: (map['team_two_score'] ?? '').toString(),
      team_one_record: (map['team_one_record'] ?? '').toString(),
      team_two_record: (map['team_two_record'] ?? '').toString(),

      team_one_points_leader_imag: (map['team_one_points_leader_imag'] ?? '')
          .toString(),
      team_two_points_leader_imag: (map['team_two_points_leader_imag'] ?? '')
          .toString(),
      team_one_points_leader_name: (map['team_one_points_leader_name'] ?? '')
          .toString(),
      team_two_points_leader_name: (map['team_two_points_leader_name'] ?? '')
          .toString(),

      team_one_points_leader_points:
          (map['team_one_points_leader_points'] ?? '').toString(),
      team_two_points_leader_points:
          (map['team_two_points_leader_points'] ?? '').toString(),
      team_one_points_leader_field_goal:
          (map['team_one_points_leader_field_goal'] ?? '').toString(),
      team_two_points_leader_field_goal:
          (map['team_two_points_leader_field_goal'] ?? '').toString(),

      team_one_points_leader_free_throw:
          (map['team_one_points_leader_free_throw'] ?? '').toString(),
      team_two_points_leader_free_throw:
          (map['team_two_points_leader_free_throw'] ?? '').toString(),
      team_one_rebound_leader_image:
          (map['team_one_rebound_leader_image'] ?? '').toString(),
      team_two_rebound_leader_image:
          (map['team_two_rebound_leader_image'] ?? '').toString(),

      team_one_rebound_leader_name: (map['team_one_rebound_leader_name'] ?? '')
          .toString(),
      team_two_rebound_leader_name: (map['team_two_rebound_leader_name'] ?? '')
          .toString(),
      team_one_rebound_leader_rebound:
          (map['team_one_rebound_leader_rebound'] ?? '').toString(),
      team_two_rebound_leader_rebound:
          (map['team_two_rebound_leader_rebound'] ?? '').toString(),

      team_one_defensive_rebound: (map['team_one_defensive_rebound'] ?? '')
          .toString(),
      team_two_defensive_rebound: (map['team_two_defensive_rebound'] ?? '')
          .toString(),
      team_one_offensive_rebound: (map['team_one_offensive_rebound'] ?? '')
          .toString(),
      team_two_offensive_rebound: (map['team_two_offensive_rebound'] ?? '')
          .toString(),

      team_one_assist_leader_image: (map['team_one_assist_leader_image'] ?? '')
          .toString(),
      team_two_assist_leader_image: (map['team_two_assist_leader_image'] ?? '')
          .toString(),
      team_one_assist_leader_name: (map['team_one_assist_leader_name'] ?? '')
          .toString(),
      team_two_assist_leader_name: (map['team_two_assist_leader_name'] ?? '')
          .toString(),
      team_one_assist_leader_assist:
          (map['team_one_assist_leader_assist'] ?? '').toString(),
      team_two_assist_leader_assist:
          (map['team_two_assist_leader_assist'] ?? '').toString(),

      team_one_assist_leader_turnover:
          (map['team_one_assist_leader_turnover'] ?? '').toString(),
      team_two_assist_leader_turnover:
          (map['team_two_assist_leader_turnover'] ?? '').toString(),
      team_one_field_goal_percentage:
          (map['team_one_field_goal_percentage'] ?? '').toString(),
      team_two_field_goal_percentage:
          (map['team_two_field_goal_percentage'] ?? '').toString(),

      team_one_three_points_percentage:
          (map['team_one_three_points_percentage'] ?? '').toString(),
      team_two_three_points_percentage:
          (map['team_two_three_points_percentage'] ?? '').toString(),
      team_one_turnovers: (map['team_one_turnovers'] ?? '').toString(),
      team_two_turnovers: (map['team_two_turnovers'] ?? '').toString(),
      team_one_rebound: (map['team_one_rebound'] ?? '').toString(),
      team_two_rebound: (map['team_two_rebound'] ?? '').toString(),
    );
  }
}
