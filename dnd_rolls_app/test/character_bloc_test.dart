import 'package:bloc_test/bloc_test.dart';
import 'package:dnd_rolls_app/character/bloc/character_bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterService extends Mock implements CharacterService {}

class MockMacrosService extends Mock implements MacrosService {}

void main() {
  List<Character> _characters = [];
  late CharacterService characterService;
  late MacrosService macrosService;

  setUp(() {
    characterService = MockCharacterService();
    macrosService = MockMacrosService();
  });

  group('CharacterBloc', () {
    test('initial state is RegisteringServiceState', () {
      final characterBloc = CharacterBloc(characterService, macrosService);
      expect(characterBloc.state, RegisteringServiceState());
      characterBloc.close();
    });
    blocTest<CharacterBloc, CharacterState>(
      'emits [CharacterLoadedState[_characters]] when LoadCharacterEvent is added.',
      setUp: () {
        when(characterService.getCharacters).thenAnswer((_) => _characters);
      },
      build: () => CharacterBloc(characterService, macrosService),
      act: (bloc) => bloc.add(const LoadCharacterEvent()),
      expect: () => <CharacterState>[
        CharacterLoadedState(_characters),
      ],
    );
    blocTest<CharacterBloc, CharacterState>(
      'emits [CharacterLoadedState[_characters]] when RemoveCharacterEvent is added.',
      setUp: () {
        when(characterService.getCharacters).thenAnswer((_) => _characters);
        when(() => characterService.removeCharacter(any()))
            .thenAnswer((_) => Future.value());
      },
      build: () => CharacterBloc(characterService, macrosService),
      act: (bloc) => bloc.add(const RemoveCharacterEvent('Рагнар')),
      expect: () => <CharacterState>[CharacterLoadedState(_characters)],
    );
    group('AddCharacterEvent', () {
      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters, error: Не удалось создать]] when AddCharacterEvent is return CreationResult.failure.',
        setUp: () {
          when(() => characterService.addCharacter(
                  any(), any(), any(), any(), any(), any(), any(), any()))
              .thenAnswer((_) => CreationResult.failure);
          when(characterService.getCharacters).thenAnswer((_) => _characters);
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc
            .add(const AddCharacterEvent('Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[
          CharacterLoadedState(_characters, error: 'Не удалось создать')
        ],
      );
      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters]] when AddCharacterEvent is return CreationResult.successful.',
        setUp: () {
          when((() => characterService.addCharacter(
                  any(), any(), any(), any(), any(), any(), any(), any())))
              .thenAnswer((_) => CreationResult.success);
          when(characterService.getCharacters).thenAnswer((_) => _characters);
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc
            .add(const AddCharacterEvent('Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[CharacterLoadedState(_characters)],
      );

      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters, error: Персонаж с таким именем уже существует]] when AddCharacterEvent is return CreationResult.alreadyExists.',
        setUp: () {
          when((() => characterService.addCharacter(
                  any(), any(), any(), any(), any(), any(), any(), any())))
              .thenAnswer((_) => CreationResult.alreadyExists);
          when(characterService.getCharacters).thenAnswer((_) => _characters);
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc
            .add(const AddCharacterEvent('Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[
          CharacterLoadedState(_characters,
              error: 'Персонаж с таким именем уже существует')
        ],
      );
    });

    group('UpdateCharacterEvent', () {
      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters]] when UpdateCharacterEvent is return CreationResult.success.',
        setUp: () => {
          when((() => characterService.updateCharacter(
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any()))).thenAnswer((_) => Future.value(CreationResult.success)),
          when(characterService.getCharacters).thenAnswer((_) => _characters)
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc.add(const UpdateCharacterEvent(
            'Рагнар', 'Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[CharacterLoadedState(_characters)],
      );
      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters, error: Не удалось отредактировать]] when UpdateCharacterEvent is return CreationResult.failure.',
        setUp: () => {
          when((() => characterService.updateCharacter(
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any(),
              any()))).thenAnswer((_) => Future.value(CreationResult.failure)),
          when(characterService.getCharacters).thenAnswer((_) => _characters)
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc.add(const UpdateCharacterEvent(
            'Рагнар', 'Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[
          CharacterLoadedState(_characters, error: 'Не удалось отредактировать')
        ],
      );

      blocTest<CharacterBloc, CharacterState>(
        'emits [CharacterLoadedState[_characters, error: Персонаж с таким именем уже существует]] when UpdateCharacterEvent is return CreationResult.alreadyExists.',
        setUp: () => {
          when((() => characterService.updateCharacter(any(), any(), any(),
                  any(), any(), any(), any(), any(), any())))
              .thenAnswer((_) => Future.value(CreationResult.alreadyExists)),
          when(characterService.getCharacters).thenAnswer((_) => _characters)
        },
        build: () => CharacterBloc(characterService, macrosService),
        act: (bloc) => bloc.add(const UpdateCharacterEvent(
            'Рагнар', 'Рагнар', 3, 13, 17, 15, 11, 16, 12)),
        expect: () => <CharacterState>[
          CharacterLoadedState(_characters,
              error: 'Персонаж с таким именем уже существует')
        ],
      );
    });
  });
}
