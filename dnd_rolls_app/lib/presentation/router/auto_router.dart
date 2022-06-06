import 'package:auto_route/annotations.dart';
import 'package:dnd_rolls_app/character/widgets/characters_screen/bloc_characters_screen_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/bloc_create_character_screen_widget.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: BlocCharactersScreenWidget,
      initial: true,
    ),
    AutoRoute(
      page: BlocCreateCharacterScreenWidget,
    )
  ],
)
class $AutoRouter {}
