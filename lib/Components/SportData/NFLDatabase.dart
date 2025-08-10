import 'package:playbook/Components/SportData/NFLData.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Nfldatabase {
  final nflDatabase = Supabase.instance.client.from("NFL");

  // Read form the database
  final stream = Supabase.instance.client
      .from("FNL")
      .stream(primaryKey: ['id'])
      .map((data) => data.map((dataMap) => NFLData.fromMap(dataMap)).toList());
}
