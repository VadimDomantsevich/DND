import 'package:dnd_rolls_app/character/character_bloc_freezed/character_bloc.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/bloc_create_character_screen_widget.dart';
import 'package:dnd_rolls_app/core/widgets/add_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocAddCharacterListTile extends StatelessWidget {
  const BlocAddCharacterListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AddListTileWidget.common(
        title: AppLocalizations.of(context)!.createNewCharacter,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) => const Dialog(
              child: BlocCreateCharacterScreenWidget(),
            ),
          );
          //I don't know how not to use context here
          context.read<CharacterBloc>().add(const LoadCharactersEvent());
        },
      );
}
