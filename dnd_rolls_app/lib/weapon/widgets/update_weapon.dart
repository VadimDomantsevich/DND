import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/icons/dnd_icons.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:flutter/material.dart';

class UpdateWeapon extends StatefulWidget {
  final Weapon? weapon;
  const UpdateWeapon({Key? key, this.weapon}) : super(key: key);

  @override
  State<UpdateWeapon> createState() => _UpdateWeaponState();
}

class _UpdateWeaponState extends State<UpdateWeapon> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  final _nameController = TextEditingController();
  DamageCube _damage = DamageCube.d6;
  CharacteristicsEnum _characteristic = CharacteristicsEnum.strength;

  @override
  void initState() {
    super.initState();
    if (widget.weapon != null) {
      _dialogHeader = 'Редактирование оружия ${widget.weapon!.name}';
      _nameController.text = widget.weapon!.name;
      _damage = widget.weapon!.damage;
      _characteristic = widget.weapon!.mainCharacteristic;
    } else {
      _dialogHeader = 'Создание оружия';
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 220,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(DnDApp.broadsword),
                      labelText: 'Название оружия',
                    ),
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? 'Поле не должно быть пустым'
                          : null;
                    },
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    decrementCharacteristic(_characteristic);
                  },
                  mini: true,
                  child: const Icon(Icons.arrow_back),
                ),
                buildCharacteristicWidget(_characteristic),
                FloatingActionButton(
                  onPressed: () {
                    incrementCharacteristic(_characteristic);
                  },
                  mini: true,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 84),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    decrementDamage(_damage);
                  },
                  mini: true,
                  child: const Icon(Icons.arrow_back),
                ),
                buildDamageWidget(_damage),
                FloatingActionButton(
                  onPressed: () {
                    incrementDamage(_damage);
                  },
                  mini: true,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
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
                          if (widget.weapon == null) {
                            final result = [
                              _nameController.text,
                              _damage,
                              _characteristic,
                            ];
                            Navigator.of(context).pop(result);
                          } else {
                            final result = [
                              widget.weapon!.name,
                              _nameController.text,
                              _damage,
                              _characteristic,
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

  Widget buildCharacteristicWidget(CharacteristicsEnum characteristic) {
    Icon characteristicIcon;
    String characteristicText;
    switch (characteristic) {
      case CharacteristicsEnum.strength:
        characteristicText = Strings.strengthText;
        characteristicIcon = const Icon(DnDApp.battered_axe);
        break;
      case CharacteristicsEnum.dexterity:
        characteristicText = Strings.dexterityText;
        characteristicIcon = const Icon(DnDApp.bone_knife);
        break;
      case CharacteristicsEnum.constitution:
        characteristicText = Strings.constitutionText;
        characteristicIcon = const Icon(DnDApp.muscle_up);
        break;
      case CharacteristicsEnum.intelligence:
        characteristicText = Strings.intelligenceText;
        characteristicIcon = const Icon(DnDApp.scroll_unfurled);
        break;
      case CharacteristicsEnum.wisdom:
        characteristicText = Strings.wisdomText;
        characteristicIcon = const Icon(DnDApp.quill_ink);
        break;
      case CharacteristicsEnum.charisma:
        characteristicText = Strings.charismaText;
        characteristicIcon = const Icon(DnDApp.crown);
        break;
    }
    return Column(
      children: [
        characteristicIcon,
        Text(characteristicText),
      ],
    );
  }

  void incrementCharacteristic(CharacteristicsEnum characteristic) {
    setState(() {
      int index = CharacteristicsEnum.values
          .firstWhere((element) => element.name == characteristic.name)
          .index;
      if (index == CharacteristicsEnum.values.length - 1) {
        _characteristic = CharacteristicsEnum.values.first;
      } else {
        _characteristic = CharacteristicsEnum.values.elementAt(index + 1);
      }
    });
  }

  void decrementCharacteristic(CharacteristicsEnum characteristic) {
    setState(() {
      int index = CharacteristicsEnum.values
          .firstWhere((element) => element.name == characteristic.name)
          .index;
      if (index == 0) {
        _characteristic = CharacteristicsEnum.values.last;
      } else {
        _characteristic = CharacteristicsEnum.values.elementAt(index - 1);
      }
    });
  }

  Widget buildDamageWidget(DamageCube damage) {
    Icon damageIcon;
    String damageText;
    switch (damage) {
      case DamageCube.d4:
        damageIcon = const Icon(DnDApp.dice_four);
        damageText = '1d4';
        break;
      case DamageCube.d6:
        damageIcon = const Icon(DnDApp.dice_six);
        damageText = '1d6';
        break;
      case DamageCube.d8:
        damageIcon = const Icon(DnDApp.dice_one);
        damageText = '1d8';
        break;
      case DamageCube.d10:
        damageIcon = const Icon(DnDApp.dice_two);
        damageText = '1d10';
        break;
      case DamageCube.d12:
        damageIcon = const Icon(DnDApp.dice_three);
        damageText = '1d12';
        break;
    }
    return Column(
      children: [
        damageIcon,
        Text(damageText),
      ],
    );
  }

  void incrementDamage(DamageCube damage) {
    setState(() {
      int index = DamageCube.values
          .firstWhere((element) => element.name == damage.name)
          .index;
      if (index == DamageCube.values.length - 1) {
        _damage = DamageCube.values.first;
      } else {
        _damage = DamageCube.values.elementAt(index + 1);
      }
    });
  }

  void decrementDamage(DamageCube damage) {
    setState(() {
      int index = DamageCube.values
          .firstWhere((element) => element.name == damage.name)
          .index;
      if (index == 0) {
        _damage = DamageCube.values.last;
      } else {
        _damage = DamageCube.values.elementAt(index - 1);
      }
    });
  }
}
