import 'package:dnd_rolls_app/core/widgets/elevated_button_wrap.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:dnd_rolls_app/strike/bloc/strike_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StrikeScreen extends StatefulWidget {
  final Character character;
  final Weapon weapon;
  const StrikeScreen({Key? key, required this.character, required this.weapon})
      : super(key: key);

  @override
  State<StrikeScreen> createState() => _StrikeScreenState();
}

class _StrikeScreenState extends State<StrikeScreen> {
  String _dialogHeader = '';

  @override
  void initState() {
    super.initState();
    _dialogHeader = 'Удары оружия ${widget.weapon.name}';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StrikeBloc>(
      create: (strikeContext) =>
          StrikeBloc(RepositoryProvider.of<StrikeService>(strikeContext))
            ..add(RegisterServiceEvent(widget.character, widget.weapon)),
      child: BlocBuilder<StrikeBloc, StrikeState>(
        builder: (context, state) {
          if (state is StrikeLoadedState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_dialogHeader),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...state.strikes.map((strike) {
                      return ListTile(
                        onTap: () {
                          BlocProvider.of<StrikeBloc>(context).add(
                              SelectStrikeEvent(
                                  strike, widget.character, widget.weapon));
                        },
                        title: Text(strike.name),
                      );
                    })
                  ],
                )
              ],
            );
          } else if (state is SelectedStrikeState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_dialogHeader),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ...state.strikes.map((strike) {
                      return ListTile(
                        onTap: () {
                          if (state.strike.name != strike.name) {
                            BlocProvider.of<StrikeBloc>(context).add(
                                SelectStrikeEvent(
                                    strike, widget.character, widget.weapon));
                          } else {
                            BlocProvider.of<StrikeBloc>(context).add(
                                LoadStrikesEvent(
                                    widget.character, widget.weapon));
                          }
                        },
                        selected: strike.name == state.strike.name,
                        title: Text(strike.name),
                      );
                    }),
                    elevatedButtonWrap(
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(state.strike);
                          },
                          child: const Text('Выбрать')),
                    )
                  ],
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
