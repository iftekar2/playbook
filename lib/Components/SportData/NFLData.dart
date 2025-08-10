class NFLData {
  int? team_id;
  String team_name = "";
  String team_log_url = "";
  String conference = "";
  String team_code = "";

  NFLData({
    this.team_id,
    required this.team_name,
    required this.team_log_url,
    required this.conference,
    required this.team_code,
  });

  factory NFLData.fromMap(Map<String, dynamic> map) {
    return NFLData(
      team_id: map['team_id'] as int,
      team_name: map['team_name'] as String,
      team_log_url: map['team_log_url'] as String,
      conference: map['conference'] as String,
      team_code: map['team_code'] as String,
    );
  }
}
