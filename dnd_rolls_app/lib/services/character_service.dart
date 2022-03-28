import 'package:dnd_rolls_app/model/character.dart';
import 'package:hive/hive.dart';

class CharacterService {
  late Box<Character> _characters;

  Future<void> init() async {
    Hive.registerAdapter(CharacterAdapter());
    _characters = await Hive.openBox('charactersBox');

    await _characters.clear();
    await _characters.add(Character('Рагнар', 3, 13, 17, 15, 11, 16, 12));
    await _characters.add(Character('Хироки', 3, 14, 11, 15, 18, 12, 18));
  }

  List<Character> getCharacters() {
    return _characters.values.toList();
  }

  Character getCharacter(final String name) {
    return _characters.values.firstWhere((element) => element.name == name);
  }

  Future<void> addCharacter(
      final String name,
      final int skillBonus,
      final int strength,
      final int dexterity,
      final int constitution,
      final int intelligence,
      final int wisdom,
      final int charisma) async {
    await _characters.add(Character(name, skillBonus, strength, dexterity,
        constitution, intelligence, wisdom, charisma));
  }

  Future<void> removeCharacter(final String name) async {
    await _characters.values
        .firstWhere((element) => element.name == name)
        .delete();
  }

  Future<void> updateCharacter(
      final String name,
      final String newName,
      final int skillBonus,
      final int strength,
      final int dexterity,
      final int constitution,
      final int intelligence,
      final int wisdom,
      final int charisma) async {
    final characterToUpdate =
        _characters.values.firstWhere(((element) => element.name == name));
    final index = characterToUpdate.key as int;
    await _characters.put(
        index,
        Character(newName, skillBonus, strength, dexterity, constitution,
            intelligence, wisdom, charisma));
  }
}
