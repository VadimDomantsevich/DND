import 'package:dnd_rolls_app/character/bloc/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/create_character.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.charactersScreenTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            CharacterBloc(RepositoryProvider.of<CharacterService>(context))
              ..add(RegisterServiceEvent()),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: ((context, state) {
            //print(state.props.first);
            if (state is CharacterLoadedState) {
              return ListView(
                children: [
                  ...state.characters.map(
                    (e) => ListTile(
                      title: Text(
                          '${e.name} ${e.strength} ${e.dexterity} ${e.constitution} ${e.intelligence} ${e.wisdom} ${e.charisma}'),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.create)),
                    ),
                  ),
                  ListTile(
                    title: const Text('Создать нового персонажа'),
                    trailing: const Icon(Icons.add_box_outlined),
                    onTap: () async {
                      List<dynamic> result = await showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                                child: CreateCharacter(),
                              ));
                      if (result.length == 7) {
                        BlocProvider.of<CharacterBloc>(context).add(
                            AddCharacterEvent(result[0], result[1], result[2],
                                result[3], result[4], result[5], result[6]));
                      }
                    },
                  ),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
