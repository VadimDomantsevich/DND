import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/icons/dnd_icons.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateEnemy extends StatefulWidget {
  final Enemy? enemy;
  const UpdateEnemy({Key? key, this.enemy}) : super(key: key);

  @override
  State<UpdateEnemy> createState() => _UpdateEnemyState();
}

class _UpdateEnemyState extends State<UpdateEnemy> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  final _nameController = TextEditingController();
  final _healthController = TextEditingController();
  final _armorClassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.enemy != null) {
      _dialogHeader = 'Редактирование противника ${widget.enemy!.name}';
      _nameController.text = widget.enemy!.name;
      _healthController.text = widget.enemy!.health.toString();
      _armorClassController.text = widget.enemy!.armorClass.toString();
    } else {
      _dialogHeader = 'Создание противника';
      _healthController.text = '30';
      _armorClassController.text = '10';
    }
  }

  @override
  Widget build(BuildContext context) {
    return containerRadialGradienWrap(SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(_dialogHeader),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.spaghettiMonsterFlying),
                labelText: 'Имя противника',
              ),
              validator: (value) {
                if (value != null &&
                    RepositoryProvider.of<EnemyService>(context)
                        .getEnemies()
                        .any((element) =>
                            element.name.toLowerCase() ==
                            value.toLowerCase())) {
                  if (widget.enemy != null &&
                      widget.enemy!.name.toLowerCase() == value.toLowerCase()) {
                    return null;
                  } else {
                    return 'Противник уже существует';
                  }
                }
                return (value == null || value.isEmpty)
                    ? 'Поле не должно быть пустым'
                    : null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 84),
            child: SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: decrementArmor,
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: true),
                      controller: _armorClassController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.shieldHalved),
                        labelText: 'Класс доспеха',
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
                  FloatingActionButton(
                    onPressed: incrementArmor,
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 84),
            child: SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: decrementHealth,
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: true),
                      controller: _healthController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.heart,
                        ),
                        labelText: 'Здоровье',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Поле не должно быть пустым';
                        } else if (int.parse(value) <= 0) {
                          return 'Больше 0';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: incrementHealth,
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
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
                    child: const Text(Strings.cancel),
                  ),
                ),
                elevatedButtonWrap(
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.enemy == null) {
                            final result = [
                              _nameController.text,
                              int.parse(_healthController.text),
                              int.parse(_armorClassController.text),
                            ];
                            Navigator.of(context).pop(result);
                          } else {
                            final result = [
                              widget.enemy!.name,
                              _nameController.text,
                              int.parse(_healthController.text),
                              int.parse(_armorClassController.text),
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
        ]),
      ),
    ));
  }

  void incrementArmor() {
    int currentValue = int.parse(_armorClassController.text);
    if (currentValue < 30) {
      currentValue++;
      _armorClassController.text = currentValue.toString();
    }
  }

  void decrementArmor() {
    int currentValue = int.parse(_armorClassController.text);
    if (currentValue > 1) {
      currentValue--;
      _armorClassController.text = currentValue.toString();
    }
  }

  void incrementHealth() {
    int currentValue = int.parse(_healthController.text);
    currentValue++;
    _healthController.text = currentValue.toString();
  }

  void decrementHealth() {
    int currentValue = int.parse(_healthController.text);
    if (currentValue > 1) {
      currentValue--;
      _healthController.text = currentValue.toString();
    }
  }
}
