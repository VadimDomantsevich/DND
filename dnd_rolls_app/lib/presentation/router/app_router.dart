import 'package:dnd_rolls_app/weapon/weapon_screen.dart';
import 'package:flutter/material.dart';

import '../../character/character_screen.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const CharactersScreen(),
        );
      case '/characters':
        return MaterialPageRoute(
          builder: (_) => const CharactersScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const CharactersScreen(),
        );
    }
  }
}
