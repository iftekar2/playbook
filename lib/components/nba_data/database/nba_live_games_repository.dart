import 'package:playbook/components/nba_data/database/nba_game_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NbaLiveGamesRepository {
  // Connect to the live_nba_games table
  final database = Supabase.instance.client.from('live_nba_games');

  // Read from the database
  Stream<List<NbaGameModel>> get stream {
    return Supabase.instance.client
        .from('live_nba_games')
        .stream(primaryKey: ['id'])
        .map((data) {
          return data.map((nbaGame) {
            return NbaGameModel.fromMap(nbaGame);
          }).toList();
        });
  }
}
