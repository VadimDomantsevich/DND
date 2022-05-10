import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  PhysicalTypeOfDamage _typeOfDamage = PhysicalTypeOfDamage.crushing;
  String dropdownValue = Strings.chooseStandartWeapon;
  List<Weapon> seedWeapons = [];

  @override
  void initState() {
    super.initState();
    if (widget.weapon != null) {
      _dialogHeader = 'Редактирование оружия ${widget.weapon!.name}';
      _nameController.text = widget.weapon!.name;
      _damage = widget.weapon!.damage;
      _characteristic = widget.weapon!.mainCharacteristic;
      _typeOfDamage = widget.weapon!.typeOfDamage;
    } else {
      _dialogHeader = 'Создание оружия';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(MdiIcons.swordCross),
                            labelText: 'Название оружия',
                          ),
                          validator: (value) {
                            if (value != null &&
                                RepositoryProvider.of<WeaponService>(context)
                                    .getWeapons()
                                    .any((element) =>
                                        element.name.toLowerCase() ==
                                        value.toLowerCase())) {
                              if (widget.weapon != null &&
                                  widget.weapon!.name.toLowerCase() ==
                                      value.toLowerCase()) {
                                return null;
                              } else {
                                return 'Оружие уже существует';
                              }
                            }
                            return (value == null || value.isEmpty)
                                ? 'Поле не должно быть пустым'
                                : null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
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
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: (() {
                            decrementTypeOfDamage(_typeOfDamage);
                          }),
                          mini: true,
                          child: const Icon(Icons.arrow_back),
                        ),
                        buildTypeOfDamageWidget(_typeOfDamage),
                        FloatingActionButton(
                            onPressed: (() {
                              incrementTypeOfDamage(_typeOfDamage);
                            }),
                            mini: true,
                            child: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                  ))
                ],
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
                        child: const Text(Strings.cancel),
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
                                  _typeOfDamage
                                ];
                                Navigator.of(context).pop(result);
                              } else {
                                final result = [
                                  widget.weapon!.name,
                                  _nameController.text,
                                  _damage,
                                  _characteristic,
                                  _typeOfDamage,
                                  widget.weapon!.enchantments
                                ];
                                Navigator.of(context).pop(result);
                              }
                            }
                          },
                          child: const Text(Strings.save)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          items: <String>[
            Strings.chooseStandartWeapon,
            Strings.simpleMelee,
            Strings.simpleRanged,
            Strings.militaryMelee,
            Strings.militaryRanged
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              switch (newValue) {
                case Strings.simpleMelee:
                  RepositoryProvider.of<WeaponService>(context)
                      .fillSimpleMeleeWeapons();
                  seedWeapons = RepositoryProvider.of<WeaponService>(context)
                      .getSeedWeapons();
                  break;
                case Strings.simpleRanged:
                  RepositoryProvider.of<WeaponService>(context)
                      .fillSimpleRangedWeapons();
                  seedWeapons = RepositoryProvider.of<WeaponService>(context)
                      .getSeedWeapons();
                  break;
                case Strings.militaryMelee:
                  RepositoryProvider.of<WeaponService>(context)
                      .fillMilitaryMeleeWeapons();
                  seedWeapons = RepositoryProvider.of<WeaponService>(context)
                      .getSeedWeapons();
                  break;
                case Strings.militaryRanged:
                  RepositoryProvider.of<WeaponService>(context)
                      .fillMilitaryRangedWeapons();
                  seedWeapons = RepositoryProvider.of<WeaponService>(context)
                      .getSeedWeapons();
                  break;
                default:
                  seedWeapons.clear();
              }
            });
          },
        ),
        Expanded(
          child: ListView(
            children: [
              ...seedWeapons.map(
                (weapon) => ListTile(
                  title: Text(
                    weapon.name,
                    textAlign: TextAlign.center,
                  ),
                  selected: _nameController.text == weapon.name,
                  onTap: () {
                    setState(() {
                      _nameController.text = weapon.name;
                      _damage = weapon.damage;
                      _characteristic = weapon.mainCharacteristic;
                      _typeOfDamage = weapon.typeOfDamage;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTypeOfDamageWidget(PhysicalTypeOfDamage typeOfDamage) {
    Icon typeOfDamageIcon;
    String typeOfDamageText;

    switch (typeOfDamage) {
      case PhysicalTypeOfDamage.crushing:
        typeOfDamageText = Strings.crushing;
        typeOfDamageIcon = const Icon(
          MdiIcons.bone,
          size: 30,
        );
        break;
      case PhysicalTypeOfDamage.piercing:
        typeOfDamageText = Strings.piercing;
        typeOfDamageIcon = const Icon(
          MdiIcons.spear,
          size: 30,
        );
        break;
      case PhysicalTypeOfDamage.slashing:
        typeOfDamageText = Strings.slashing;
        typeOfDamageIcon = const Icon(
          MdiIcons.sword,
          size: 30,
        );
        break;
    }
    return Column(
      children: [
        typeOfDamageIcon,
        Text(typeOfDamageText),
      ],
    );
  }

  void incrementTypeOfDamage(PhysicalTypeOfDamage typeOfDamage) {
    setState(() {
      int index = PhysicalTypeOfDamage.values
          .firstWhere((element) => element.name == typeOfDamage.name)
          .index;
      if (index == PhysicalTypeOfDamage.values.length - 1) {
        _typeOfDamage = PhysicalTypeOfDamage.values.first;
      } else {
        _typeOfDamage = PhysicalTypeOfDamage.values.elementAt(index + 1);
      }
    });
  }

  void decrementTypeOfDamage(PhysicalTypeOfDamage typeOfDamage) {
    setState(() {
      int index = PhysicalTypeOfDamage.values
          .firstWhere((element) => element.name == typeOfDamage.name)
          .index;
      if (index == 0) {
        _typeOfDamage = PhysicalTypeOfDamage.values.last;
      } else {
        _typeOfDamage = PhysicalTypeOfDamage.values.elementAt(index - 1);
      }
    });
  }

  Widget buildCharacteristicWidget(CharacteristicsEnum characteristic) {
    Icon characteristicIcon;
    String characteristicText;
    switch (characteristic) {
      case CharacteristicsEnum.strength:
        characteristicText = Strings.strengthText;
        characteristicIcon = const Icon(FontAwesomeIcons.handFist);
        break;
      case CharacteristicsEnum.dexterity:
        characteristicText = Strings.dexterityText;
        characteristicIcon = const Icon(MdiIcons.karate);
        break;
      case CharacteristicsEnum.constitution:
        characteristicText = Strings.constitutionText;
        characteristicIcon = const Icon(FontAwesomeIcons.childReaching);
        break;
      case CharacteristicsEnum.intelligence:
        characteristicText = Strings.intelligenceText;
        characteristicIcon = const Icon(MdiIcons.wizardHat);
        break;
      case CharacteristicsEnum.wisdom:
        characteristicText = Strings.wisdomText;
        characteristicIcon = const Icon(FontAwesomeIcons.scroll);
        break;
      case CharacteristicsEnum.charisma:
        characteristicText = Strings.charismaText;
        characteristicIcon = const Icon(MdiIcons.emoticonCoolOutline);
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
        damageIcon = const Icon(MdiIcons.diceD4Outline);
        damageText = '1d4';
        break;
      case DamageCube.d6:
        damageIcon = const Icon(MdiIcons.diceD6Outline);
        damageText = '1d6';
        break;
      case DamageCube.d8:
        damageIcon = const Icon(MdiIcons.diceD8Outline);
        damageText = '1d8';
        break;
      case DamageCube.d10:
        damageIcon = const Icon(MdiIcons.diceD10Outline);
        damageText = '1d10';
        break;
      case DamageCube.d12:
        damageIcon = const Icon(MdiIcons.diceD12Outline);
        damageText = '1d12';
        break;
      case DamageCube.d6x2:
        damageIcon = const Icon(MdiIcons.diceMultipleOutline);
        damageText = '2d6';
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
