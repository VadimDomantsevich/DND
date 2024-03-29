import 'package:collection/collection.dart';
import 'package:dnd_rolls_app/model/battle.dart';
import 'package:dnd_rolls_app/model/battle_log.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/enemy.dart';

class BattleService {
  Battle battle = Battle(1, [], [], [], [], [], []);

  void updateCharacters(List<Character> characters) {
    battle.characters.clear();
    battle.characters = characters;
  }

  void updateEnemies(List<Enemy> enemies) {
    battle.enemies.clear();
    battle.enemies = enemies;
    battle.currentHealth.clear();
    battle.defeatedEnemies.clear();
    for (var enemy in battle.enemies) {
      battle.currentHealth.add(enemy.health);
    }
  }

  void updateBattleLogs(BattleLog battleLog) {
    battle.battleLogs.add(battleLog);
  }

  void startTurn() {
    battle.turn++;
    battle.whoAttacked.clear();
    BattleLog battleLog = BattleLog('Начало ${battle.turn} хода');
    updateBattleLogs(battleLog);
  }

  void characterAttacked(Character character) {
    battle.whoAttacked.add(character);
  }

  bool isEveryoneAttacked() {
    return const UnorderedIterableEquality()
        .equals(battle.characters, battle.whoAttacked);
  }
}
