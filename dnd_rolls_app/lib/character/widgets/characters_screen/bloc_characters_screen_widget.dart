import 'package:dnd_rolls_app/character/character_bloc_freezed/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/bloc_add_character_list_tile.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/bloc_characters_gridview_widget.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/bloc_characters_sliverlist.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/charactersScreenWidgets/characters_appbar_title_text_widget.dart';
import 'package:dnd_rolls_app/core/widgets/bloc_language_picker_widget.dart';
import 'package:dnd_rolls_app/core/widgets/radial_gradient_wrap_widget.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCharactersScreenWidget extends StatelessWidget {
  const BlocCharactersScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CharacterBloc(
          RepositoryProvider.of<CharacterService>(context),
          RepositoryProvider.of<MacrosService>(context),
        ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const CharactersAppBarTitleTextWidget(),
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BlocLanguagePickerWidget(),
                  ),
                ],
              ),
              body: RadialGradientWrap.common(
                widget: Column(
                  children: const [
                    Expanded(child: BlocCharactersGridViewWidget()),
                    BlocAddCharacterListTile(),
                  ],
                ),
                /* Column(
                  children: const [
                    Expanded(
                      child: BlocCharactersSliverList(),
                    ),
                    BlocAddCharacterListTile(),
                  ],
                ), */
              ),
            );
          },
        ),
      );
}
