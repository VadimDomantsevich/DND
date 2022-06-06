/* import 'package:dnd_rolls_app/battle/battle_screen.dart';
import 'package:dnd_rolls_app/character/character_screen.dart';
import 'package:dnd_rolls_app/character/widgets/charactersScreenWidgets/bloc_characters_screen_widget.dart';
import 'package:dnd_rolls_app/character/widgets/charactersScreenWidgets/bloc_characters_sliverlist.dart';
import 'package:dnd_rolls_app/core/widgets/add_list_tile_widget.dart';
import 'package:dnd_rolls_app/core/widgets/bloc_language_picker_widget.dart';
import 'package:dnd_rolls_app/enemy/enemy_screen.dart';
import 'package:dnd_rolls_app/macros/macros_screen.dart';
import 'package:dnd_rolls_app/weapon/weapon_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const BlocCharactersScreenWidget(),
        );
      case '/CharactersScreen':
        return MaterialPageRoute(
          builder: (_) => const CharactersScreen(),
        );
      case '/EnemyScreen':
        return MaterialPageRoute(
          builder: (_) => const EnemyScreen(),
        );
      case '/MacrosScreen':
        return MaterialPageRoute(
          builder: (_) => const MacrosScreen(),
        );
      case '/WeaponScreen':
        return MaterialPageRoute(
          builder: (_) => const WeaponScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const BattleScreen(),
        );
    }
  }
}
 */