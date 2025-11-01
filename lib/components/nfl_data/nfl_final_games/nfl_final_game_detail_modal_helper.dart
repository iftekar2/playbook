import 'package:flutter/material.dart';
import 'package:playbook/components/nfl_data/database/nfl_game_model.dart';
import 'package:playbook/components/nfl_data/nfl_game_detail_modal.dart';

class NflFinalGameDetailModalHelper {
  static void show(BuildContext context, NflGameModel game) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) => NflGameDetailModal(game: game, isFinal: true),
    );
  }
}
