class Nflupcominggamesmodel {
  final String gameDate;
  final String gameStartTime;
  final String teamOneName;
  final String teamOneLogo;
  final String teamOneLocation;
  final String teamOneRecord;
  final String teamTwoName;
  final String teamTwoLogo;
  final String teamTwoLocation;
  final String teamTwoRecord;

  Nflupcominggamesmodel({
    required this.gameDate,
    required this.gameStartTime,
    required this.teamOneName,
    required this.teamOneLogo,
    required this.teamOneLocation,
    required this.teamOneRecord,
    required this.teamTwoName,
    required this.teamTwoLogo,
    required this.teamTwoLocation,
    required this.teamTwoRecord,
  });

  factory Nflupcominggamesmodel.fromMap(Map<String, dynamic> map) {
    return Nflupcominggamesmodel(
      gameDate: map['game_date'] as String? ?? '',
      gameStartTime: map['game_start_time'] as String? ?? '',
      teamOneName: map['team1_name'] as String? ?? '',
      teamOneLogo: map['team1_logo'] as String? ?? '',
      teamOneLocation: map['team1_loc'] as String? ?? '',
      teamOneRecord: map['team1_rec'] as String? ?? '',
      teamTwoName: map['team2_name'] as String? ?? '',
      teamTwoLogo: map['team2_logo'] as String? ?? '',
      teamTwoLocation: map['team2_loc'] as String? ?? '',
      teamTwoRecord: map['team2_rec'] as String? ?? '',
    );
  }
}
