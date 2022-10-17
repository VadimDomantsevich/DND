// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../character/widgets/characters_screen/bloc_characters_screen_widget.dart'
    as _i1;
import '../../character/widgets/edit_character_screens/bloc_create_character_screen_widget.dart'
    as _i2;

class AutoRouter extends _i3.RootStackRouter {
  AutoRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    BlocCharactersScreenWidgetRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BlocCharactersScreenWidget());
    },
    BlocCreateCharacterScreenWidgetRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i2.BlocCreateCharacterScreenWidget());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(BlocCharactersScreenWidgetRoute.name, path: '/'),
        _i3.RouteConfig(BlocCreateCharacterScreenWidgetRoute.name,
            path: '/bloc-create-character-screen-widget')
      ];
}

/// generated route for
/// [_i1.BlocCharactersScreenWidget]
class BlocCharactersScreenWidgetRoute extends _i3.PageRouteInfo<void> {
  const BlocCharactersScreenWidgetRoute()
      : super(BlocCharactersScreenWidgetRoute.name, path: '/');

  static const String name = 'BlocCharactersScreenWidgetRoute';
}

/// generated route for
/// [_i2.BlocCreateCharacterScreenWidget]
class BlocCreateCharacterScreenWidgetRoute extends _i3.PageRouteInfo<void> {
  const BlocCreateCharacterScreenWidgetRoute()
      : super(BlocCreateCharacterScreenWidgetRoute.name,
            path: '/bloc-create-character-screen-widget');

  static const String name = 'BlocCreateCharacterScreenWidgetRoute';
}
