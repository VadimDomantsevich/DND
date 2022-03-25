import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:flutter/material.dart';

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({Key? key}) : super(key: key);

  @override
  State<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _skillBonusController = TextEditingController();
  int _strengthValue = 10;
  int _dexterityValue = 10;
  int _constitutionValue = 10;
  int _intelligenceValue = 10;
  int _wisdomValue = 10;
  int _charismaValue = 10;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Создание персонажа'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Как вас будут называть',
                labelText: 'Имя персонажа *',
              ),
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Поле не должно быть пустым'
                    : null;
              },
            ), //Не влазит
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _skillBonusController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.class__outlined),
                labelText: 'Бонус мастерства',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Поле не должно быть пустым';
                } else if (int.parse(value) < 1 || int.parse(value) > 6) {
                  return 'От 1 до 6';
                } else {
                  return null;
                }
              },
            ),
          ]),
          buildCharacteristic(CharacteristicsEnum.strength),
          buildCharacteristic(CharacteristicsEnum.dexterity),
          buildCharacteristic(CharacteristicsEnum.constitution),
          buildCharacteristic(CharacteristicsEnum.intelligence),
          buildCharacteristic(CharacteristicsEnum.wisdom),
          buildCharacteristic(CharacteristicsEnum.charisma),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final result = [
                    _nameController.text,
                    3,
                    _strengthValue,
                    _dexterityValue,
                    _constitutionValue,
                    _intelligenceValue,
                    _wisdomValue,
                    _charismaValue
                  ];
                  Navigator.of(context).pop(result);
                }
              },
              child: const Text('Сохранить')),
        ],
      ),
    );
  }

  void incrementCharacteristic(CharacteristicsEnum characteristic) {
    setState(() {
      switch (characteristic) {
        case CharacteristicsEnum.strength:
          if (_strengthValue < 20) _strengthValue++;
          break;
        case CharacteristicsEnum.dexterity:
          if (_dexterityValue < 20) _dexterityValue++;
          break;
        case CharacteristicsEnum.constitution:
          if (_constitutionValue < 20) _constitutionValue++;
          break;
        case CharacteristicsEnum.intelligence:
          if (_intelligenceValue < 20) _intelligenceValue++;
          break;
        case CharacteristicsEnum.wisdom:
          if (_wisdomValue < 20) _wisdomValue++;
          break;
        case CharacteristicsEnum.charisma:
          if (_charismaValue < 20) _charismaValue++;
          break;
      }
    });
  }

  void decrementCharacteristic(CharacteristicsEnum characteristic) {
    setState(() {
      switch (characteristic) {
        case CharacteristicsEnum.strength:
          if (_strengthValue > 1) _strengthValue--;
          break;
        case CharacteristicsEnum.dexterity:
          if (_dexterityValue > 1) _dexterityValue--;
          break;
        case CharacteristicsEnum.constitution:
          if (_constitutionValue > 1) _constitutionValue--;
          break;
        case CharacteristicsEnum.intelligence:
          if (_intelligenceValue > 1) _intelligenceValue--;
          break;
        case CharacteristicsEnum.wisdom:
          if (_wisdomValue > 1) _wisdomValue--;
          break;
        case CharacteristicsEnum.charisma:
          if (_charismaValue > 1) _charismaValue--;
          break;
      }
    });
  }

  Widget buildCharacteristic(CharacteristicsEnum characteristicsEnum) {
    String characteristicText = '';
    int characteristicValue = 10;
    if (characteristicsEnum == CharacteristicsEnum.strength) {
      characteristicText = 'Сила';
      characteristicValue = _strengthValue;
    } else if (characteristicsEnum == CharacteristicsEnum.dexterity) {
      characteristicText = 'Ловкость';
      characteristicValue = _dexterityValue;
    } else if (characteristicsEnum == CharacteristicsEnum.constitution) {
      characteristicText = 'Телосложение';
      characteristicValue = _constitutionValue;
    } else if (characteristicsEnum == CharacteristicsEnum.intelligence) {
      characteristicText = 'Интеллект';
      characteristicValue = _intelligenceValue;
    } else if (characteristicsEnum == CharacteristicsEnum.wisdom) {
      characteristicText = 'Мудрость';
      characteristicValue = _wisdomValue;
    } else if (characteristicsEnum == CharacteristicsEnum.charisma) {
      characteristicText = 'Харизма';
      characteristicValue = _charismaValue;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          mini: true,
          onPressed: () {
            decrementCharacteristic(characteristicsEnum);
          },
          tooltip: 'Уменьшить',
          child: const Icon(Icons.remove),
        ),
        Column(
          children: [
            Text(characteristicText),
            Text('$characteristicValue'),
          ],
        ),
        FloatingActionButton(
          mini: true,
          onPressed: () {
            incrementCharacteristic(characteristicsEnum);
          },
          tooltip: 'Увеличить',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
