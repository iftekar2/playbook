import 'package:playbook/Components/NFLData/NFLUpcomingGamesModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Nflnextweekinfo {
  final nflDatabase = Supabase.instance.client.from("NFL_Next_Weeks_Games");

  /// New stream for the upcoming games table
  final stream = Supabase.instance.client
      .from("NFL_Next_Weeks_Games")
      .stream(primaryKey: ['id'])
      .map(
        (data) => data
            .map((dataMap) => Nflupcominggamesmodel.fromMap(dataMap))
            .toList(),
      );
}
