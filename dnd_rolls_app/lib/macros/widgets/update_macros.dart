import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UpdateMacros extends StatefulWidget {
  final Macros? macros;
  final List<String>? charactersNames;
  const UpdateMacros({Key? key, this.macros, this.charactersNames})
      : super(key: key);

  @override
  State<UpdateMacros> createState() => _UpdateMacrosState();
}

class _UpdateMacrosState extends State<UpdateMacros> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  final _nameController = TextEditingController();
  final _characterNameController = TextEditingController();
  List<Strike>? strikes = [];
  //List<String> charactersNames = [];

  @override
  void initState() {
    super.initState();
    if (widget.macros != null) {
      _dialogHeader = 'Редактирование макроса ${widget.macros!.name}';
      _nameController.text = widget.macros!.name;
      strikes = widget.macros!.strikes;
    } else if (widget.charactersNames != null) {
      _dialogHeader = 'Создание макроса';
      _characterNameController.text = widget.charactersNames!.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
              labelText: 'Название макроса',
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Поле не должно быть пустым'
                  : null;
            },
          ),
        ),
        buildCharacterNames(),
        buildStrikes(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Отменить')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.macros != null) {
                          final result = [
                            widget.macros!.name,
                            _nameController.text,
                            widget.macros!.characterName,
                            strikes
                          ];
                          Navigator.of(context).pop(result);
                        } else {
                          final result = [
                            _nameController.text,
                            _characterNameController.text,
                            strikes
                          ];
                          Navigator.of(context).pop(result);
                        }
                      }
                    },
                    child: const Text('Сохранить')),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildStrikes() {
    if (strikes != null) {
      return ListView(
        shrinkWrap: true,
        children: [
          ...strikes!.map((strike) {
            return Column(
              children: [
                Slidable(
                  key: const ValueKey(0),
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: ((_) => {strikes!.remove(strike)}),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Удалить',
                    ),
                  ]),
                  child: ListTile(
                    title: Text(strike.name),
                  ),
                )
              ],
            );
          }),
          ListTile(
            title: const Text('Добавить удар'),
            trailing: const Icon(Icons.add_box_outlined),
            onTap: () {
              //TODO
            },
          )
        ],
      );
    } else {
      return ListTile(
        title: const Text('Добавить удар'),
        trailing: const Icon(Icons.add_box_outlined),
        onTap: () {
          //TODO
        },
      );
    }
  }

  Widget buildCharacterNames() {
    if (widget.macros == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              mini: true,
              onPressed: () {
                backCharactersName();
              },
              tooltip: 'Назад',
              child: const Icon(Icons.arrow_back),
            ),
            Text(
              _characterNameController.text,
              style: Theme.of(context).textTheme.headline5,
            ),
            FloatingActionButton(
              mini: true,
              onPressed: () {
                forwardCharactersName();
              },
              tooltip: 'Вперёд',
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void backCharactersName() {
    setState(() {
      if (widget.charactersNames!.indexOf(_characterNameController.text) == 0) {
        _characterNameController.text = widget.charactersNames!.last;
      } else {
        _characterNameController.text = widget.charactersNames!.elementAt(
            widget.charactersNames!.indexOf(_characterNameController.text) - 1);
      }
    });
  }

  void forwardCharactersName() {
    setState(() {
      if (widget.charactersNames!.indexOf(_characterNameController.text) ==
          widget.charactersNames!.length) {
        _characterNameController.text = widget.charactersNames!.first;
      } else {
        _characterNameController.text = widget.charactersNames!.elementAt(
            widget.charactersNames!.indexOf(_characterNameController.text) + 1);
      }
    });
  }
}
