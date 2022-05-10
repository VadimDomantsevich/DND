import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/enchantment.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/enchantment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EnchantWeapon extends StatefulWidget {
  final Weapon weapon;
  const EnchantWeapon({Key? key, required this.weapon}) : super(key: key);

  @override
  State<EnchantWeapon> createState() => _EnchantWeaponState();
}

class _EnchantWeaponState extends State<EnchantWeapon> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  List<Enchantment> enchantments = [];
  int plusHitAndDamage = 1;
  DamageCube diceType = DamageCube.d6;
  String dropdownValue = Strings.chooseEnchantment;
  String dropdownTypeValue = Strings.crushing;
  final _diceCountController = TextEditingController();
  PhysicalTypeOfDamage? physicalTypeOfDamage = PhysicalTypeOfDamage.crushing;
  ElementalTypeOfDamage? elementalTypeOfDamage;

  @override
  void initState() {
    super.initState();
    _dialogHeader = 'Зачарование оружия ${widget.weapon.name}';
    _diceCountController.text = '1';
    if (widget.weapon.enchantments != null) {
      for (var item in widget.weapon.enchantments!) {
        enchantments.add(item);
      }
      //enchantments = widget.weapon.enchantments!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(_dialogHeader),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: enchantments.isNotEmpty
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: enchantments.length,
                  itemBuilder: ((context, index) {
                    return Slidable(
                      key: const ValueKey(1),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (newContext) async {
                              {
                                setState(() {
                                  enchantments.removeAt(index);
                                });
                              }
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Удалить',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(enchantments[index].name),
                      ),
                    );
                  }))
              : Container(),
        ),
        Expanded(
          child: Column(
            children: [
              DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  items: <String>[
                    Strings.chooseEnchantment,
                    Strings.plusHitAndDamage,
                    Strings.plusDamageDice
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
                        case Strings.plusHitAndDamage:
                          break;
                        case Strings.plusDamageDice:
                          break;
                      }
                    });
                  }),
              buildForm(dropdownValue),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  elevatedButtonWrap(ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(Strings.cancel))),
                  elevatedButtonWrap(ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(enchantments);
                      },
                      child: const Text(Strings.save))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildForm(String typeOfEnchantment) {
    switch (typeOfEnchantment) {
      case Strings.plusHitAndDamage:
        return buildPlusHitAndDamageForm();
      case Strings.plusDamageDice:
        return buildPlusDamageDice();
      default:
        return Container();
    }
  }

  Widget buildPlusHitAndDamageForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: buildCounter()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: elevatedButtonWrap(ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final enchantment =
                          RepositoryProvider.of<EnchantmentService>(context)
                              .addEnchantment(
                                  TypeOfEnchantment.plusHitAndDamage,
                                  hitAndDamagePlus: plusHitAndDamage);
                      enchantments.add(enchantment);
                    });
                  },
                  child: const Text('Добавить'))),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPlusDamageDice() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: decrementCount,
                      mini: true,
                      child: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false, signed: true),
                          controller: _diceCountController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.cubes),
                            labelText: 'Количество',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Поле не должно быть пустым';
                            } else if (int.parse(value) < 1 ||
                                int.parse(value) > 30) {
                              return 'От 1 до 30';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: incrementCount,
                      mini: true,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          decrementDamage(diceType);
                        },
                        mini: true,
                        child: const Icon(Icons.arrow_back),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildDamageWidget(diceType),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          incrementDamage(diceType);
                        },
                        mini: true,
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
                value: dropdownTypeValue,
                icon: const Icon(Icons.arrow_downward),
                items: <String>[
                  Strings.crushing,
                  Strings.piercing,
                  Strings.slashing,
                  Strings.acid,
                  Strings.cold,
                  Strings.fire,
                  Strings.force,
                  Strings.lightning,
                  Strings.necrotic,
                  Strings.poison,
                  Strings.psychic,
                  Strings.radiant,
                  Strings.thunder
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownTypeValue = newValue!;
                    switch (newValue) {
                      case Strings.crushing:
                        elementalTypeOfDamage = null;
                        physicalTypeOfDamage = PhysicalTypeOfDamage.crushing;
                        break;
                      case Strings.piercing:
                        elementalTypeOfDamage = null;
                        physicalTypeOfDamage = PhysicalTypeOfDamage.piercing;
                        break;
                      case Strings.slashing:
                        elementalTypeOfDamage = null;
                        physicalTypeOfDamage = PhysicalTypeOfDamage.slashing;
                        break;
                      case Strings.acid:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.acid;
                        break;
                      case Strings.cold:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.cold;
                        break;
                      case Strings.fire:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.fire;
                        break;
                      case Strings.force:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.force;
                        break;
                      case Strings.lightning:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.lightning;
                        break;
                      case Strings.necrotic:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.necrotic;
                        break;
                      case Strings.poison:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.poison;
                        break;
                      case Strings.psychic:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.psychic;
                        break;
                      case Strings.radiant:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.radiant;
                        break;
                      case Strings.thunder:
                        physicalTypeOfDamage = null;
                        elementalTypeOfDamage = ElementalTypeOfDamage.thunder;
                        break;
                    }
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: elevatedButtonWrap(ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        final enchantment = RepositoryProvider.of<
                                EnchantmentService>(context)
                            .addEnchantment(TypeOfEnchantment.extraDamageDie,
                                diceCount: int.parse(_diceCountController.text),
                                diceType: diceType,
                                physicalTypeOfDamage: physicalTypeOfDamage,
                                elementalTypeOfDamage: elementalTypeOfDamage);
                        enchantments.add(enchantment);
                      });
                    }
                  },
                  child: const Text('Добавить'))),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (plusHitAndDamage > 1) {
                plusHitAndDamage--;
              }
            });
          },
          mini: true,
          child: const Icon(Icons.arrow_back),
        ),
        Text('$plusHitAndDamage'),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (plusHitAndDamage < 5) {
                plusHitAndDamage++;
              }
            });
          },
          mini: true,
          child: const Icon(Icons.arrow_forward),
        )
      ],
    );
  }

  void incrementCount() {
    int currentValue = int.parse(_diceCountController.text);
    if (currentValue < 30) {
      currentValue++;
      _diceCountController.text = currentValue.toString();
    }
  }

  void decrementCount() {
    int currentValue = int.parse(_diceCountController.text);
    if (currentValue > 1) {
      currentValue--;
      _diceCountController.text = currentValue.toString();
    }
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
      if (index == DamageCube.values.length - 2) {
        diceType = DamageCube.values.first;
      } else {
        diceType = DamageCube.values.elementAt(index + 1);
      }
    });
  }

  void decrementDamage(DamageCube damage) {
    setState(() {
      int index = DamageCube.values
          .firstWhere((element) => element.name == damage.name)
          .index;
      if (index == 0) {
        diceType = DamageCube.values.elementAt(DamageCube.values.length - 2);
      } else {
        diceType = DamageCube.values.elementAt(index - 1);
      }
    });
  }
}
