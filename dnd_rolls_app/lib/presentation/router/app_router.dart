import 'package:dnd_rolls_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

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
