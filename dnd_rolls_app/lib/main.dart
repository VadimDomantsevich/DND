import 'package:dnd_rolls_app/presentation/router/app_router.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: ((context) => CharacterService())),
        RepositoryProvider(create: ((context) => WeaponService())),
        RepositoryProvider(create: ((context) => EnemyService()))
      ],
      child: MaterialApp(
        title: 'DND',
        onGenerateRoute: appRouter.onGenerateRoutes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
