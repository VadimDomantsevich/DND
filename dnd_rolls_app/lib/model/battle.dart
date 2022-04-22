import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';

class Battle {
  int turn;
  List<Character> characters;
  List<Enemy> enemies;
  List<BattleLog> battleLogs;
  List<Character> whoAttacked;

  Battle(this.turn, this.characters, this.enemies, this.battleLogs,
      this.whoAttacked);
}
