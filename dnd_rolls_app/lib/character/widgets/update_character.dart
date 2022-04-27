import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:flutter/material.dart';

class UpdateCharacter extends StatefulWidget {
  final Character? character;
  const UpdateCharacter({Key? key, this.character}) : super(key: key);

  @override
  State<UpdateCharacter> createState() => _UpdateCharacterState();
}

class _UpdateCharacterState extends State<UpdateCharacter> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  final _nameController = TextEditingController();
  int _skillBonusValue = 3;
  int _strengthValue = 10;
  int _dexterityValue = 10;
  int _constitutionValue = 10;
  int _intelligenceValue = 10;
  int _wisdomValue = 10;
  int _charismaValue = 10;

  @override
  void initState() {
    super.initState();
    if (widget.character != null) {
      _dialogHeader = 'Редактирование персонажа ${widget.character!.name}';
      _nameController.text = widget.character!.name;
      _skillBonusValue = widget.character!.skillBonus;
      _strengthValue = widget.character!.strength;
      _dexterityValue = widget.character!.dexterity;
      _constitutionValue = widget.character!.constitution;
      _intelligenceValue = widget.character!.intelligence;
      _wisdomValue = widget.character!.wisdom;
      _charismaValue = widget.character!.charisma;
    } else {
      _dialogHeader = 'Создание персонажа';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(_dialogHeader),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 230,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Как вас будут называть',
                        labelText: 'Имя персонажа',
                      ),
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Поле не должно быть пустым'
                            : null;
                      },
                    ),
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      decrementSkillBonus(_skillBonusValue);
                    },
                    tooltip: 'Уменьшить',
                    child: const Icon(Icons.remove),
                  ),
                  Column(
                    children: [
                      const Text('Бонус'),
                      Text('$_skillBonusValue'),
                    ],
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      incrementSkillBonus(_skillBonusValue);
                    },
                    tooltip: 'Увеличить',
                    child: const Icon(Icons.add),
                  ),
                ]),
          ),
          buildCharacteristic(CharacteristicsEnum.strength),
          buildCharacteristic(CharacteristicsEnum.dexterity),
          buildCharacteristic(CharacteristicsEnum.constitution),
          buildCharacteristic(CharacteristicsEnum.intelligence),
          buildCharacteristic(CharacteristicsEnum.wisdom),
          buildCharacteristic(CharacteristicsEnum.charisma),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                elevatedButtonWrap(
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Отменить'),
                  ),
                ),
                elevatedButtonWrap(
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.character != null) {
                            final result = [
                              widget.character!.name,
                              _nameController.text,
                              _skillBonusValue,
                              _strengthValue,
                              _dexterityValue,
                              _constitutionValue,
                              _intelligenceValue,
                              _wisdomValue,
                              _charismaValue
                            ];
                            Navigator.of(context).pop(result);
                          } else {
                            final result = [
                              _nameController.text,
                              _skillBonusValue,
                              _strengthValue,
                              _dexterityValue,
                              _constitutionValue,
                              _intelligenceValue,
                              _wisdomValue,
                              _charismaValue
                            ];
                            Navigator.of(context).pop(result);
                          }
                        }
                      },
                      child: const Text('Сохранить')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void incrementSkillBonus(int value) {
    setState(() {
      if (value < 6) {
        _skillBonusValue++;
      }
    });
  }

  void decrementSkillBonus(int value) {
    setState(() {
      if (value > 1) {
        _skillBonusValue--;
      }
    });
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
      characteristicText = Strings.strengthText;
      characteristicValue = _strengthValue;
    } else if (characteristicsEnum == CharacteristicsEnum.dexterity) {
      characteristicText = Strings.dexterityText;
      characteristicValue = _dexterityValue;
    } else if (characteristicsEnum == CharacteristicsEnum.constitution) {
      characteristicText = Strings.constitutionText;
      characteristicValue = _constitutionValue;
    } else if (characteristicsEnum == CharacteristicsEnum.intelligence) {
      characteristicText = Strings.intelligenceText;
      characteristicValue = _intelligenceValue;
    } else if (characteristicsEnum == CharacteristicsEnum.wisdom) {
      characteristicText = Strings.wisdomText;
      characteristicValue = _wisdomValue;
    } else if (characteristicsEnum == CharacteristicsEnum.charisma) {
      characteristicText = Strings.charismaText;
      characteristicValue = _charismaValue;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 84, vertical: 8),
      child: Row(
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
      ),
    );
  }
}
