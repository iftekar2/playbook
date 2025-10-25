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
  });

  factory NflGame.fromMap(Map<String, dynamic> map) {
    return NflGame(
      id: map['id'] as int?,
      team_one_logo: map['team_one_logo'] as String,
      team_one_name: map['team_one_name'] as String,
      team_one_records: map['team_one_records'] as String,
      team_one_score: map['team_one_score'] as String,

      team_two_logo: map['team_two_logo'] as String,
      team_two_name: map['team_two_name'] as String,
      team_two_records: map['team_two_records'] as String,
      team_two_score: map['team_two_score'] as String,
    );
  }
}
