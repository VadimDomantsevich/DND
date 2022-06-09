import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';

class Battle {
  int turn;
  List<Character> characters;
  List<Enemy> enemies;
  List<int> currentHealth;
  List<BattleLog> battleLogs;
  List<Character> whoAttacked;
  List<Enemy> defeatedEnemies;

  Battle(this.turn, this.characters, this.enemies, this.currentHealth,
      this.battleLogs, this.whoAttacked, this.defeatedEnemies);
}
