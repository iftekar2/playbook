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
  final String passingYard;
  final String passingYardPlayerOneName;
  final String passingYardPlayerOneStates;
  final String passingYardPlayerOneImage;
  final String passingYardPlayerTwoName;
  final String passingYardPlayerTwoStates;
  final String passingYardPlayerTwoImage;
  final String rushingYard;
  final String rushingYardPlayerOneName;
  final String rushingYardPlayerOneStates;
  final String rushingYardPlayerOneImage;
  final String rushingYardPlayerTwoName;
  final String rushingYardPlayerTwoStates;
  final String rushingYardPlayerTwoImage;
  final String receivingYard;
  final String receivingYardPlayerOneName;
  final String receivingYardPlayerOneStates;
  final String receivingYardPlayerOneImage;
  final String receivingYardPlayerTwoName;
  final String receivingYardPlayerTwoStates;
  final String receivingYardPlayerTwoImage;

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
    required this.passingYard,
    required this.passingYardPlayerOneName,
    required this.passingYardPlayerOneStates,
    required this.passingYardPlayerOneImage,
    required this.passingYardPlayerTwoName,
    required this.passingYardPlayerTwoStates,
    required this.passingYardPlayerTwoImage,
    required this.rushingYard,
    required this.rushingYardPlayerOneName,
    required this.rushingYardPlayerOneStates,
    required this.rushingYardPlayerOneImage,
    required this.rushingYardPlayerTwoName,
    required this.rushingYardPlayerTwoStates,
    required this.rushingYardPlayerTwoImage,
    required this.receivingYard,
    required this.receivingYardPlayerOneName,
    required this.receivingYardPlayerOneStates,
    required this.receivingYardPlayerOneImage,
    required this.receivingYardPlayerTwoName,
    required this.receivingYardPlayerTwoStates,
    required this.receivingYardPlayerTwoImage,
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
      passingYard: map['passing_yard'] as String? ?? '',
      passingYardPlayerOneName: map['pass_yds_plyr1_name'] as String? ?? '',
      passingYardPlayerOneStates: map['pass_yds_plyr1_stats'] as String? ?? '',
      passingYardPlayerOneImage: map['pass_yds_plyr1_img'] as String? ?? '',
      passingYardPlayerTwoName: map['pass_yds_plyr2_name'] as String? ?? '',
      passingYardPlayerTwoStates: map['pass_yds_plyr2_stats'] as String? ?? '',
      passingYardPlayerTwoImage: map['pass_yds_plyr2_img'] as String? ?? '',
      rushingYard: map['rushing_yard'] as String? ?? '',
      rushingYardPlayerOneName: map['rush_yds_plyr1_name'] as String? ?? '',
      rushingYardPlayerOneStates: map['rush_yds_plyr1_stats'] as String? ?? '',
      rushingYardPlayerOneImage: map['rush_yds_plyr1_img'] as String? ?? '',
      rushingYardPlayerTwoName: map['rush_yds_plyr2_name'] as String? ?? '',
      rushingYardPlayerTwoStates: map['rush_yds_plyr2_stats'] as String? ?? '',
      rushingYardPlayerTwoImage: map['rush_yds_plyr2_img'] as String? ?? '',
      receivingYard: map['receiving_yard'] as String? ?? '',
      receivingYardPlayerOneName: map['rec_yds_plyr1_name'] as String? ?? '',
      receivingYardPlayerOneStates: map['rec_yds_plyr1_stats'] as String? ?? '',
      receivingYardPlayerOneImage: map['rec_yds_plyr1_img'] as String? ?? '',
      receivingYardPlayerTwoName: map['rec_yds_plyr2_name'] as String? ?? '',
      receivingYardPlayerTwoStates: map['rec_yds_plyr2_stats'] as String? ?? '',
      receivingYardPlayerTwoImage: map['rec_yds_plyr2_img'] as String? ?? '',
    );
  }
}
