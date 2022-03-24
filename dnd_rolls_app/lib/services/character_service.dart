import 'package:dnd_rolls_app/core/enums/character_creation_result.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:hive/hive.dart';

class CharacterService {
  late Box<Character> _characters;

  Future<void> init() async {
    Hive.registerAdapter(CharacterAdapter());
    _characters = await Hive.openBox('charactersBox');

    await _characters.clear();
    await _characters.add(Character('Рагнар', 3));
    await _characters.add(Character('Хироки', 3));
  }

  List<Character> getCharacters() {
    return _characters.values.toList();
  }

  Character getCharacter(final String name) {
    final character =
        _characters.values.firstWhere((element) => element.name == name);
    return character;
  }

  Future<CharacterCreationResult> addCharacter(
      final String name, final int skillBonus) async {
    final alreadyExists = _characters.values
        .any((element) => element.name.toLowerCase() == name.toLowerCase());
    if (alreadyExists) {
      return CharacterCreationResult.alreadyExists;
    }
    try {
      _characters.add(Character(name, skillBonus));
      return CharacterCreationResult.success;
    } catch (e) {
      return CharacterCreationResult.failure;
    }
  }

  Future<void> removeCharacter(final String name) async {
    final characterToRemove =
        _characters.values.firstWhere((element) => element.name == name);
    await characterToRemove.delete();
  }

  Future<void> updateCharacter(
      final String name, final String newName, final int skillBonus) async {
    final characterToUpdate =
        _characters.values.firstWhere(((element) => element.name == name));
    final index = characterToUpdate.key as int;
    await _characters.put(index, Character(newName, skillBonus));
  }
}
