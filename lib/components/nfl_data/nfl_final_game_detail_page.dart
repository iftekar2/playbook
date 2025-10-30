import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_game.dart';
import 'package:playbook/components/nfl_data/nfl_live_game_detail_page.dart';

class NflFinalGameDetailModalHelper {
  static void show(BuildContext context, NflGame game) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) => NflLiveGameDetailModal(game: game, isFinal: true),
    );
  }
}
