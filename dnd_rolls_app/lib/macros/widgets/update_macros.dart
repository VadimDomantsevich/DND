import 'package:dnd_rolls_app/character/bloc/character_bloc.dart';
import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/macros.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/weapon/weapon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UpdateMacros extends StatefulWidget {
  final Macros? macros;
  final String? characterName;
  const UpdateMacros({Key? key, this.macros, this.characterName})
      : super(key: key);

  @override
  State<UpdateMacros> createState() => _UpdateMacrosState();
}

class _UpdateMacrosState extends State<UpdateMacros> {
  final _formKey = GlobalKey<FormState>();
  String _dialogHeader = '';
  final _nameController = TextEditingController();
  List<Strike> strikes = [];

  @override
  void initState() {
    super.initState();
    if (widget.macros != null) {
      _dialogHeader = 'Редактирование макроса ${widget.macros!.name}';
      _nameController.text = widget.macros!.name;
      strikes = RepositoryProvider.of<MacrosService>(context)
          .getMacros(widget.macros!.name)
          .strikes;
    } else if (widget.characterName != null) {
      _dialogHeader = 'Создание макроса';
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
        buildStrikes(),
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
                    child: const Text('Отменить')),
              ),
              elevatedButtonWrap(
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.macros != null) {
                          final result = [
                            widget.macros!.name,
                            _nameController.text,
                            widget.macros!.characterName,
                            RepositoryProvider.of<MacrosService>(context)
                                .getMacros(widget.macros!.name)
                                .strikes
                          ];
                          Navigator.of(context).pop(result);
                        } else {
                          final result = [
                            _nameController.text,
                            widget.characterName,
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
    if (strikes.isNotEmpty) {
      return BlocProvider(
        create: (context) =>
            CharacterBloc(RepositoryProvider.of<CharacterService>(context))
              ..add(GetCharacterEvent(widget.macros!.characterName)),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is GetCharacterState) {
              return ListView(
                shrinkWrap: true,
                children: [
                  ...strikes.map((strike) {
                    return Column(
                      children: [
                        Slidable(
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: ((_) => {
                                        setState((() {
                                          strikes.remove(strike);
                                        }))
                                      }),
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
                    onTap: () async {
                      Strike? strike = await showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: WeaponScreen(
                                  character: state.character,
                                ),
                              ));
                      if (widget.macros != null) {
                        setState(() {
                          strikes =
                              RepositoryProvider.of<MacrosService>(context)
                                  .getMacros(widget.macros!.name)
                                  .strikes;
                          if (strike != null) {
                            strikes.add(strike);
                          }
                        });
                      } else {
                        if (strike != null) {
                          setState(() {
                            strikes.add(strike);
                          });
                        }
                      }
                    },
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      );
    } else {
      return BlocProvider(
        create: (context) =>
            CharacterBloc(RepositoryProvider.of<CharacterService>(context))
              ..add(GetCharacterEvent(widget.characterName!)),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is GetCharacterState) {
              return ListTile(
                title: const Text('Добавить удар'),
                trailing: const Icon(Icons.add_box_outlined),
                onTap: () async {
                  Strike strike = await showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: WeaponScreen(
                              character: state.character,
                            ),
                          ));
                  setState(() {
                    RepositoryProvider.of<MacrosService>(context)
                        .getMacros(widget.macros!.name)
                        .strikes
                        .add(strike);
                    RepositoryProvider.of<MacrosService>(context)
                        .getMacros(widget.macros!.name)
                        .save();
                    strikes = RepositoryProvider.of<MacrosService>(context)
                        .getMacros(widget.macros!.name)
                        .strikes;
                  });
                },
              );
            } else {
              return Container();
            }
          },
        ),
      );
    }
  }
}
