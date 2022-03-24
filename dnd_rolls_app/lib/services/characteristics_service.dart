import 'package:dnd_rolls_app/model/characteristics.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CharacteristicsService {
  late Box<Characteristics> _characterstics;

  Future<void> init() async {
    Hive.registerAdapter(CharacteristicsAdapter());
    _characterstics = await Hive.openBox('characteristicsBox');

    await _characterstics.clear();
    await _characterstics.add(Characteristics(
      strength: 13,
      dexterity: 17,
      constitution: 15,
      intelligence: 11,
      wisdom: 16,
      charisma: 14,
      name: 'Рагнар',
    ));
    await _characterstics.add(Characteristics(
        strength: 12,
        dexterity: 11,
        constitution: 16,
        intelligence: 18,
        wisdom: 12,
        charisma: 18,
        name: 'Хироки'));
  }

  Characteristics getCharacteristics(final String name) {
    final characteristics =
        _characterstics.values.firstWhere((element) => element.name == name);
    return characteristics;
  }

  Future<void> updateCharacteristics(final String name,
      {final int? strength,
      final int? dexterity,
      final int? constitution,
      final int? intelligence,
      final int? wisdom,
      final int? charisma}) async {
    final characteristicsToUpdate =
        _characterstics.values.firstWhere((element) => element.name == name);
    final index = characteristicsToUpdate.key as int;
    final newCharacteristics = characteristicsToUpdate.copyWith(
        strength: strength ?? characteristicsToUpdate.strength,
        dexterity: dexterity ?? characteristicsToUpdate.dexterity,
        constitution: constitution ?? characteristicsToUpdate.constitution,
        intelligence: intelligence ?? characteristicsToUpdate.intelligence,
        wisdom: wisdom ?? characteristicsToUpdate.wisdom,
        charisma: charisma ?? characteristicsToUpdate.charisma,
        name: name);
    await _characterstics.put(index, newCharacteristics);
  }
}
