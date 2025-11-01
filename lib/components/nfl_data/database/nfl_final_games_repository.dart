import 'package:playbook/components/nfl_data/database/nfl_game_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NflFinalGamesRepository {
  // Connect to the final_nfl_games table
  final database = Supabase.instance.client.from('final_nfl_games');

  // Read from the database
  Stream<List<NflGameModel>> get stream {
    return Supabase.instance.client
        .from('final_nfl_games')
        .stream(primaryKey: ['id'])
        .map((data) {
          return data.map((nflGame) {
            return NflGameModel.fromMap(nflGame);
          }).toList();
        });
  }
}
