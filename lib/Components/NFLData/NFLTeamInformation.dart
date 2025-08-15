import 'package:playbook/Components/NFLData/NFLTeamModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Nflteaminformation {
  final nflDatabase = Supabase.instance.client.from("NFL");

  // Read form the database
  final stream = Supabase.instance.client
      .from("NFL")
      .stream(primaryKey: ['id'])
      .map(
        (data) => data.map((dataMap) => Nflteammodel.fromMap(dataMap)).toList(),
      );
}
