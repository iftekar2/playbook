class NbaGameModel {
  int? id;

  String game_id;
  String game_status;
  String team_one_name;
  String team_one_logo;
  String team_one_record;
  String team_one_score;
  String team_two_name;
  String team_two_logo;
  String team_two_record;
  String team_two_score;
  String team_one_points_leader_name;
  String team_one_points_leader_image;
  String team_one_points_leader_jersey;
  String team_one_points_leader_points;
  String team_one_points_leader_field_goals;
  String team_one_points_leader_free_throw;
  String team_one_assists_leader_name;
  String team_one_assists_leader_image;
  String team_one_assists_leader_jersey;
  String team_one_assists_leader_assists;
  String team_one_assists_leader_turnovers;
  String team_one_rebounds_leader_name;
  String team_one_rebounds_leader_image;
  String team_one_rebounds_leader_jersey;
  String team_one_rebounds_leader_rebounds;
  String team_one_rebounds_leader_defensive_rebounds;
  String team_one_rebounds_leader_offensive_rebounds;
  String team_two_points_leader_name;
  String team_two_points_leader_image;
  String team_two_points_leader_jersey;
  String team_two_points_leader_points;
  String team_two_points_leader_field_goals;
  String team_two_points_leader_free_throw;
  String team_two_assists_leader_name;
  String team_two_assists_leader_image;
  String team_two_assists_leader_jersey;
  String team_two_assists_leader_assists;
  String team_two_assists_leader_turnovers;
  String team_two_rebounds_leader_name;
  String team_two_rebounds_leader_image;
  String team_two_rebounds_leader_jersey;
  String team_two_rebounds_leader_rebounds;
  String team_two_rebounds_leader_defensive_rebounds;
  String team_two_rebounds_leader_offensive_rebounds;
  String team_one_fg_pct;
  String team_one_3pt_pct;
  String team_one_ft_pct;
  String team_one_o_rebounds;
  String team_one_d_rebounds;
  String team_one_assists;
  String team_one_steals;
  String team_one_blocks;
  String team_one_turnovers;
  String team_one_technical_fouls;
  String team_one_turnover_points;
  String team_one_fast_break_points;
  String team_one_points_in_paint;
  String team_one_fouls;
  String team_one_largest_lead;
  String team_two_fg_pct;
  String team_two_3pt_pct;
  String team_two_ft_pct;
  String team_two_o_rebounds;
  String team_two_d_rebounds;
  String team_two_assists;
  String team_two_steals;
  String team_two_blocks;
  String team_two_turnovers;
  String team_two_technical_fouls;
  String team_two_turnover_points;
  String team_two_fast_break_points;
  String team_two_points_in_paint;
  String team_two_fouls;
  String team_two_largest_lead;
  String team_one_quarter_scores_one;
  String team_one_quarter_scores_two;
  String team_one_quarter_scores_three;
  String team_one_quarter_scores_four;
  String team_one_quarter_scores_ot_one;
  String team_two_quarter_scores_one;
  String team_two_quarter_scores_two;
  String team_two_quarter_scores_three;
  String team_two_quarter_scores_four;
  String team_two_quarter_scores_ot_one;

  String game_time;

  NbaGameModel({
    this.id,

    required this.game_id,
    required this.game_status,
    required this.team_one_name,
    required this.team_one_logo,
    required this.team_one_record,
    required this.team_one_score,
    required this.team_two_name,
    required this.team_two_logo,
    required this.team_two_record,
    required this.team_two_score,

    required this.team_one_points_leader_name,
    required this.team_one_points_leader_image,
    required this.team_one_points_leader_jersey,
    required this.team_one_points_leader_points,
    required this.team_one_points_leader_field_goals,
    required this.team_one_points_leader_free_throw,
    required this.team_one_assists_leader_name,
    required this.team_one_assists_leader_image,
    required this.team_one_assists_leader_jersey,
    required this.team_one_assists_leader_assists,
    required this.team_one_assists_leader_turnovers,
    required this.team_one_rebounds_leader_name,
    required this.team_one_rebounds_leader_image,
    required this.team_one_rebounds_leader_jersey,
    required this.team_one_rebounds_leader_rebounds,
    required this.team_one_rebounds_leader_defensive_rebounds,
    required this.team_one_rebounds_leader_offensive_rebounds,

    required this.team_two_points_leader_name,
    required this.team_two_points_leader_image,
    required this.team_two_points_leader_jersey,
    required this.team_two_points_leader_points,
    required this.team_two_points_leader_field_goals,
    required this.team_two_points_leader_free_throw,
    required this.team_two_assists_leader_name,
    required this.team_two_assists_leader_image,
    required this.team_two_assists_leader_jersey,
    required this.team_two_assists_leader_assists,
    required this.team_two_assists_leader_turnovers,
    required this.team_two_rebounds_leader_name,
    required this.team_two_rebounds_leader_image,
    required this.team_two_rebounds_leader_jersey,
    required this.team_two_rebounds_leader_rebounds,
    required this.team_two_rebounds_leader_defensive_rebounds,
    required this.team_two_rebounds_leader_offensive_rebounds,

    required this.team_one_fg_pct,
    required this.team_one_3pt_pct,
    required this.team_one_ft_pct,
    required this.team_one_o_rebounds,
    required this.team_one_d_rebounds,
    required this.team_one_assists,
    required this.team_one_steals,
    required this.team_one_blocks,
    required this.team_one_turnovers,
    required this.team_one_technical_fouls,
    required this.team_one_turnover_points,
    required this.team_one_fast_break_points,
    required this.team_one_points_in_paint,
    required this.team_one_fouls,
    required this.team_one_largest_lead,
    required this.team_two_fg_pct,
    required this.team_two_3pt_pct,
    required this.team_two_ft_pct,
    required this.team_two_o_rebounds,
    required this.team_two_d_rebounds,
    required this.team_two_assists,
    required this.team_two_steals,
    required this.team_two_blocks,
    required this.team_two_turnovers,
    required this.team_two_technical_fouls,
    required this.team_two_turnover_points,
    required this.team_two_fast_break_points,
    required this.team_two_points_in_paint,
    required this.team_two_fouls,
    required this.team_two_largest_lead,
    required this.team_one_quarter_scores_one,
    required this.team_one_quarter_scores_two,
    required this.team_one_quarter_scores_three,
    required this.team_one_quarter_scores_four,
    required this.team_one_quarter_scores_ot_one,
    required this.team_two_quarter_scores_one,
    required this.team_two_quarter_scores_two,
    required this.team_two_quarter_scores_three,
    required this.team_two_quarter_scores_four,
    required this.team_two_quarter_scores_ot_one,

    required this.game_time,
  });

  factory NbaGameModel.fromMap(Map<String, dynamic> map) {
    return NbaGameModel(
      id: map['id'] as int?,

      game_id: (map["game_id"] ?? '').toString(),
      game_status: (map["game_status"] ?? '').toString(),
      team_one_name: (map["team_one_name"] ?? '').toString(),
      team_one_logo: (map["team_one_logo"] ?? '').toString(),
      team_one_record: (map["team_one_record"] ?? '').toString(),
      team_one_score: (map["team_one_score"] ?? '').toString(),
      team_two_name: (map["team_two_name"] ?? '').toString(),
      team_two_logo: (map["team_two_logo"] ?? '').toString(),
      team_two_record: (map["team_two_record"] ?? '').toString(),
      team_two_score: (map["team_two_score"] ?? '').toString(),
      team_one_points_leader_name: (map["team_one_points_leader_name"] ?? '')
          .toString(),
      team_one_points_leader_image: (map["team_one_points_leader_image"] ?? '')
          .toString(),
      team_one_points_leader_jersey:
          (map["team_one_points_leader_jersey"] ?? '').toString(),
      team_one_points_leader_points:
          (map["team_one_points_leader_points"] ?? '').toString(),
      team_one_points_leader_field_goals:
          (map["team_one_points_leader_field_goals"] ?? '').toString(),
      team_one_points_leader_free_throw:
          (map["team_one_points_leader_free_throw"] ?? '').toString(),
      team_one_assists_leader_name: (map["team_one_assists_leader_name"] ?? '')
          .toString(),
      team_one_assists_leader_image:
          (map["team_one_assists_leader_image"] ?? '').toString(),
      team_one_assists_leader_jersey:
          (map["team_one_assists_leader_jersey"] ?? '').toString(),
      team_one_assists_leader_assists:
          (map["team_one_assists_leader_assists"] ?? '').toString(),
      team_one_assists_leader_turnovers:
          (map["team_one_assists_leader_turnovers"] ?? '').toString(),
      team_one_rebounds_leader_name:
          (map["team_one_rebounds_leader_name"] ?? '').toString(),
      team_one_rebounds_leader_image:
          (map["team_one_rebounds_leader_image"] ?? '').toString(),
      team_one_rebounds_leader_jersey:
          (map["team_one_rebounds_leader_jersey"] ?? '').toString(),
      team_one_rebounds_leader_rebounds:
          (map["team_one_rebounds_leader_rebounds"] ?? '').toString(),
      team_one_rebounds_leader_defensive_rebounds:
          (map["team_one_rebounds_leader_defensive_rebounds"] ?? '').toString(),
      team_one_rebounds_leader_offensive_rebounds:
          (map["team_one_rebounds_leader_offensive_rebounds"] ?? '').toString(),
      team_two_points_leader_name: (map["team_two_points_leader_name"] ?? '')
          .toString(),
      team_two_points_leader_image: (map["team_two_points_leader_image"] ?? '')
          .toString(),
      team_two_points_leader_jersey:
          (map["team_two_points_leader_jersey"] ?? '').toString(),
      team_two_points_leader_points:
          (map["team_two_points_leader_points"] ?? '').toString(),
      team_two_points_leader_field_goals:
          (map["team_two_points_leader_field_goals"] ?? '').toString(),
      team_two_points_leader_free_throw:
          (map["team_two_points_leader_free_throw"] ?? '').toString(),
      team_two_assists_leader_name: (map["team_two_assists_leader_name"] ?? '')
          .toString(),
      team_two_assists_leader_image:
          (map["team_two_assists_leader_image"] ?? '').toString(),
      team_two_assists_leader_jersey:
          (map["team_two_assists_leader_jersey"] ?? '').toString(),
      team_two_assists_leader_assists:
          (map["team_two_assists_leader_assists"] ?? '').toString(),
      team_two_assists_leader_turnovers:
          (map["team_two_assists_leader_turnovers"] ?? '').toString(),
      team_two_rebounds_leader_name:
          (map["team_two_rebounds_leader_name"] ?? '').toString(),
      team_two_rebounds_leader_image:
          (map["team_two_rebounds_leader_image"] ?? '').toString(),
      team_two_rebounds_leader_jersey:
          (map["team_two_rebounds_leader_jersey"] ?? '').toString(),
      team_two_rebounds_leader_rebounds:
          (map["team_two_rebounds_leader_rebounds"] ?? '').toString(),
      team_two_rebounds_leader_defensive_rebounds:
          (map["team_two_rebounds_leader_defensive_rebounds"] ?? '').toString(),
      team_two_rebounds_leader_offensive_rebounds:
          (map["team_two_rebounds_leader_offensive_rebounds"] ?? '').toString(),
      team_one_fg_pct: (map["team_one_fg_pct"] ?? '').toString(),
      team_one_3pt_pct: (map["team_one_3pt_pct"] ?? '').toString(),
      team_one_ft_pct: (map["team_one_ft_pct"] ?? '').toString(),
      team_one_o_rebounds: (map["team_one_o_rebounds"] ?? '').toString(),
      team_one_d_rebounds: (map["team_one_d_rebounds"] ?? '').toString(),
      team_one_assists: (map["team_one_assists"] ?? '').toString(),
      team_one_steals: (map["team_one_steals"] ?? '').toString(),
      team_one_blocks: (map["team_one_blocks"] ?? '').toString(),
      team_one_turnovers: (map["team_one_turnovers"] ?? '').toString(),
      team_one_technical_fouls: (map["team_one_technical_fouls"] ?? '')
          .toString(),
      team_one_turnover_points: (map["team_one_turnover_points"] ?? '')
          .toString(),
      team_one_fast_break_points: (map["team_one_fast_break_points"] ?? '')
          .toString(),
      team_one_points_in_paint: (map["team_one_points_in_paint"] ?? '')
          .toString(),
      team_one_fouls: (map["team_one_fouls"] ?? '').toString(),
      team_one_largest_lead: (map["team_one_largest_lead"] ?? '').toString(),
      team_two_fg_pct: (map["team_two_fg_pct"] ?? '').toString(),
      team_two_3pt_pct: (map["team_two_3pt_pct"] ?? '').toString(),
      team_two_ft_pct: (map["team_two_ft_pct"] ?? '').toString(),
      team_two_o_rebounds: (map["team_two_o_rebounds"] ?? '').toString(),
      team_two_d_rebounds: (map["team_two_d_rebounds"] ?? '').toString(),
      team_two_assists: (map["team_two_assists"] ?? '').toString(),
      team_two_steals: (map["team_two_steals"] ?? '').toString(),
      team_two_blocks: (map["team_two_blocks"] ?? '').toString(),
      team_two_turnovers: (map["team_two_turnovers"] ?? '').toString(),
      team_two_technical_fouls: (map["team_two_technical_fouls"] ?? '')
          .toString(),
      team_two_turnover_points: (map["team_two_turnover_points"] ?? '')
          .toString(),
      team_two_fast_break_points: (map["team_two_fast_break_points"] ?? '')
          .toString(),
      team_two_points_in_paint: (map["team_two_points_in_paint"] ?? '')
          .toString(),
      team_two_fouls: (map["team_two_fouls"] ?? '').toString(),
      team_two_largest_lead: (map["team_two_largest_lead"] ?? '').toString(),
      team_one_quarter_scores_one: (map["team_one_quarter_scores_one"] ?? '')
          .toString(),
      team_one_quarter_scores_two: (map["team_one_quarter_scores_two"] ?? '')
          .toString(),
      team_one_quarter_scores_three:
          (map["team_one_quarter_scores_three"] ?? '').toString(),
      team_one_quarter_scores_four: (map["team_one_quarter_scores_four"] ?? '')
          .toString(),
      team_one_quarter_scores_ot_one:
          (map["team_one_quarter_scores_ot_one"] ?? '').toString(),
      team_two_quarter_scores_one: (map["team_two_quarter_scores_one"] ?? '')
          .toString(),
      team_two_quarter_scores_two: (map["team_two_quarter_scores_two"] ?? '')
          .toString(),
      team_two_quarter_scores_three:
          (map["team_two_quarter_scores_three"] ?? '').toString(),
      team_two_quarter_scores_four: (map["team_two_quarter_scores_four"] ?? '')
          .toString(),
      team_two_quarter_scores_ot_one:
          (map["team_two_quarter_scores_ot_one"] ?? '').toString(),

      game_time: (map["game_time"] ?? '').toString(),
    );
  }
}
