import 'package:bloc_test/bloc_test.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/enemy/bloc/enemy_bloc.dart';
import 'package:dnd_rolls_app/model/enemy.dart';
import 'package:dnd_rolls_app/services/enemy_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEnemyService extends Mock implements EnemyService {}

void main() {
  List<Enemy> _enemies = [];
  late EnemyService enemyService;

  setUp(() {
    enemyService = MockEnemyService();
  });
  group('EnemyBloc', () {
    test('initial state is RegisteringServiceState', () {
      final enemyBloc = EnemyBloc(enemyService);
      expect(enemyBloc.state, RegisteringServiceState());
      enemyBloc.close();
    });

    blocTest<EnemyBloc, EnemyState>(
      'emits [EnemyLoadedState[_enemies]] when LoadEnemyEvent is added.',
      setUp: (() {
        when(enemyService.getEnemies).thenAnswer((_) => _enemies);
      }),
      build: () => EnemyBloc(enemyService),
      act: (bloc) => bloc.add(const LoadEnemyEvent()),
      expect: () => <EnemyState>[EnemyLoadedState(_enemies)],
    );

    blocTest<EnemyBloc, EnemyState>(
      'emits [EnemyLoadedState[_enemies]] when RemoveEnemyEvent is added.',
      setUp: (() {
        when(() => enemyService.removeEnemy(any()))
            .thenAnswer((_) => Future.value());
        when(enemyService.getEnemies).thenAnswer((_) => _enemies);
      }),
      build: () => EnemyBloc(enemyService),
      act: (bloc) => bloc.add(const RemoveEnemyEvent('name')),
      expect: () => <EnemyState>[EnemyLoadedState(_enemies)],
    );
    group('AddEnemyEvent', () {
      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies]] when AddEnemyEvent is return CreationResult.success.',
        setUp: (() {
          when(() => enemyService.addEnemy(any(), any(), any()))
              .thenAnswer((_) => CreationResult.success);
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const AddEnemyEvent('name', 30, 10)),
        expect: () => <EnemyState>[EnemyLoadedState(_enemies)],
      );

      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies, error: Не удалось создать]] when AddEnemyEvent is return CreationResult.failure.',
        setUp: (() {
          when(() => enemyService.addEnemy(any(), any(), any()))
              .thenAnswer((_) => CreationResult.failure);
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const AddEnemyEvent('name', 30, 10)),
        expect: () => <EnemyState>[
          EnemyLoadedState(_enemies, error: 'Не удалось создать')
        ],
      );
      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies, error: Противник с таким именем уже существует]] when AddEnemyEvent is return CreationResult.alreadyExists.',
        setUp: (() {
          when(() => enemyService.addEnemy(any(), any(), any()))
              .thenAnswer((_) => CreationResult.alreadyExists);
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const AddEnemyEvent('name', 30, 10)),
        expect: () => <EnemyState>[
          EnemyLoadedState(_enemies,
              error: 'Противник с таким именем уже существует')
        ],
      );
    });

    group('UpdateEnemyEvent', () {
      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies]] when UpdateEnemyEvent is return CreationResult.success.',
        setUp: (() {
          when(() => enemyService.updateEnemy(any(), any(), any(), any()))
              .thenAnswer((_) => Future.value(CreationResult.success));
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const UpdateEnemyEvent('name', 'name', 30, 10)),
        expect: () => <EnemyState>[EnemyLoadedState(_enemies)],
      );

      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies, error: Не удалось отредактировать]] when UpdateEnemyEvent is return CreationResult.failure.',
        setUp: (() {
          when(() => enemyService.updateEnemy(any(), any(), any(), any()))
              .thenAnswer((_) => Future.value(CreationResult.failure));
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const UpdateEnemyEvent('name', 'name', 30, 10)),
        expect: () => <EnemyState>[
          EnemyLoadedState(_enemies, error: 'Не удалось отредактировать')
        ],
      );
      blocTest<EnemyBloc, EnemyState>(
        'emits [EnemyLoadedState[_enemies, error: Противник с таким именем уже существует]] when UpdateEnemyEvent is return CreationResult.alreadyExists.',
        setUp: (() {
          when(() => enemyService.updateEnemy(any(), any(), any(), any()))
              .thenAnswer((_) => Future.value(CreationResult.alreadyExists));
          when(enemyService.getEnemies).thenAnswer((_) => _enemies);
        }),
        build: () => EnemyBloc(enemyService),
        act: (bloc) => bloc.add(const UpdateEnemyEvent('name', 'name', 30, 10)),
        expect: () => <EnemyState>[
          EnemyLoadedState(_enemies,
              error: 'Противник с таким именем уже существует')
        ],
      );
    });
  });
}
