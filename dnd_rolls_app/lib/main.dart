import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:dnd_rolls_app/l10n/all_locales.dart';
import 'package:dnd_rolls_app/locale/locale_bloc.dart';
import 'package:dnd_rolls_app/presentation/router/auto_router.gr.dart';
import 'package:dnd_rolls_app/services/battle_service.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/enchantment_service.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  runApp(
    BlocProvider(
      create: (context) => LocaleBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AutoRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CharacterService()),
        RepositoryProvider(create: (context) => EnchantmentService()),
        RepositoryProvider(create: (context) => WeaponService()),
        RepositoryProvider(create: (context) => EnemyService()),
        RepositoryProvider(create: (context) => StrikeService()),
        RepositoryProvider(create: (context) => MacrosService()),
        RepositoryProvider(create: (context) => BattleService())
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'DND',
            debugShowCheckedModeBanner: false,
            supportedLocales: AllLocale.all,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            theme: AppTheme.lightTheme,
          );
        },
      ),
    );
  }
}
