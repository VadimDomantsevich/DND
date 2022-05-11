import 'package:dnd_rolls_app/battle/battle_screen.dart';
import 'package:dnd_rolls_app/enemy/enemy_screen.dart';
import 'package:dnd_rolls_app/macros/macros_screen.dart';
import 'package:dnd_rolls_app/weapon/weapon_screen.dart';
import 'package:flutter/material.dart';

import '../../character/character_screen.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BattleScreen(),
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
