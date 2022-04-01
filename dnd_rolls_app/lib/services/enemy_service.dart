import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EnemyService {
  late Box<Enemy> _enemies;

  Future<void> init() async {
    Hive.registerAdapter(EnemyAdapter());
    _enemies = await Hive.openBox('enemyBox');

    await _enemies.clear();
    await _enemies.add(Enemy('Манекен', 30, 10));
    await _enemies.add(Enemy('Манекен бронированный', 30, 15));
  }

  List<Enemy> getEnemies() {
    return _enemies.values.toList();
  }

  Enemy getEnemy(String name) {
    return _enemies.values.firstWhere((element) => element.name == name);
  }

  CreationResult addEnemy(
      final String name, final int health, final int armorClass) {
    final alreadyExists = _enemies.values
        .any((element) => element.name.toLowerCase() == name.toLowerCase());
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      _enemies.add(Enemy(name, health, armorClass));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }

  Future<void> removeEnemy(final String name) async {
    await _enemies.values
        .firstWhere((element) => element.name == name)
        .delete();
  }

  Future<CreationResult> updateEnemy(final String name, final String newName,
      final int health, final int armorClass) async {
    final enemyToUpdate =
        _enemies.values.firstWhere((element) => element.name == name);
    final alreadyExists = _enemies.values.any((element) =>
        element.name.toLowerCase() == newName.toLowerCase() &&
        element != enemyToUpdate);
    if (alreadyExists) {
      return CreationResult.alreadyExists;
    }
    try {
      final index = enemyToUpdate.key as int;
      await _enemies.put(index, Enemy(newName, health, armorClass));
      return CreationResult.success;
    } catch (e) {
      return CreationResult.failure;
    }
  }
}
