import 'package:bloc_test/bloc_test.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/enchantment_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:dnd_rolls_app/weapon/bloc/weapon_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeaponService extends Mock implements WeaponService {}

class MockStrikeService extends Mock implements StrikeService {}

class MockMacrosService extends Mock implements MacrosService {}

class MockEnchantmentService extends Mock implements EnchantmentService {}

void main() {
  List<Weapon> _weapons = [];
  late WeaponService weaponService;
  late StrikeService strikeService;
  late MacrosService macrosService;
  late EnchantmentService enchantmentService;

  setUp(() {
    weaponService = MockWeaponService();
    strikeService = MockStrikeService();
    macrosService = MockMacrosService();
    enchantmentService = MockEnchantmentService();
    registerFallbackValue(DamageCube.d6);
    registerFallbackValue(CharacteristicsEnum.strength);
    registerFallbackValue(PhysicalTypeOfDamage.slashing);
  });
  group('WeaponBloc', () {
    test('initial state is RegisteringServiceState', () {
      final weaponBloc = WeaponBloc(
          weaponService, strikeService, macrosService, enchantmentService);
      expect(weaponBloc.state, RegisteringServiceState());
      weaponBloc.close();
    });
    blocTest<WeaponBloc, WeaponState>(
      'emits [WeaponLoadedState[_weapons]] when LoadWeaponEvent is added.',
      setUp: (() {
        when(weaponService.getWeapons).thenAnswer((_) => _weapons);
      }),
      build: () => WeaponBloc(
          weaponService, strikeService, macrosService, enchantmentService),
      act: (bloc) => bloc.add(const LoadWeaponEvent()),
      expect: () => <WeaponState>[WeaponLoadedState(_weapons)],
    );
    blocTest<WeaponBloc, WeaponState>(
      'emits [WeaponLoadedState[_weapons]] when RemoveWeaponEvent is added.',
      setUp: (() {
        when((() => weaponService.removeWeapon(any())))
            .thenAnswer((_) => Future.value());
        when(weaponService.getWeapons).thenAnswer((_) => _weapons);
      }),
      build: () => WeaponBloc(
          weaponService, strikeService, macrosService, enchantmentService),
      act: (bloc) => bloc.add(const RemoveWeaponEvent('name')),
      expect: () => <WeaponState>[WeaponLoadedState(_weapons)],
    );
    group('AddWeaponEvent', () {
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons]] when AddWeaponEvent is return CreationResult.success.',
        setUp: () {
          when((() => weaponService.addWeapon(any(), any(), any(), any())))
              .thenAnswer((invocation) => CreationResult.success);
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const AddWeaponEvent('name', DamageCube.d6,
            CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing)),
        expect: () => <WeaponState>[WeaponLoadedState(_weapons)],
      );
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons, error: Не удалось создать]] when AddWeaponEvent is return CreationResult.failure.',
        setUp: () {
          when((() => weaponService.addWeapon(any(), any(), any(), any())))
              .thenAnswer((invocation) => CreationResult.failure);
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const AddWeaponEvent('name', DamageCube.d6,
            CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing)),
        expect: () => <WeaponState>[
          WeaponLoadedState(_weapons, error: 'Не удалось создать')
        ],
      );
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons, error: Оружие с таким именем уже существует]] when AddWeaponEvent is return CreationResult.alreadyExists.',
        setUp: () {
          when((() => weaponService.addWeapon(any(), any(), any(), any())))
              .thenAnswer((invocation) => CreationResult.alreadyExists);
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const AddWeaponEvent('name', DamageCube.d6,
            CharacteristicsEnum.strength, PhysicalTypeOfDamage.slashing)),
        expect: () => <WeaponState>[
          WeaponLoadedState(_weapons,
              error: 'Оружие с таким именем уже существует')
        ],
      );
    });

    group('UpdateWeaponEvent', () {
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons]] when UpdateWeaponEvent is return CreationResult.success.',
        setUp: () {
          when((() => weaponService.updateWeapon(
                  any(), any(), any(), any(), any(), any())))
              .thenAnswer((invocation) => Future.value(CreationResult.success));
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const UpdateWeaponEvent(
            'name',
            'name',
            DamageCube.d6,
            CharacteristicsEnum.strength,
            PhysicalTypeOfDamage.slashing, [])),
        expect: () => <WeaponState>[WeaponLoadedState(_weapons)],
      );
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons, error: Не удалось отредактировать]] when UpdateWeaponEvent is return CreationResult.failure.',
        setUp: () {
          when((() => weaponService.updateWeapon(
                  any(), any(), any(), any(), any(), any())))
              .thenAnswer((invocation) => Future.value(CreationResult.failure));
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const UpdateWeaponEvent(
            'name',
            'name',
            DamageCube.d6,
            CharacteristicsEnum.strength,
            PhysicalTypeOfDamage.slashing, [])),
        expect: () => <WeaponState>[
          WeaponLoadedState(_weapons, error: 'Не удалось отредактировать')
        ],
      );
      blocTest<WeaponBloc, WeaponState>(
        'emits [WeaponLoadedState[_weapons, error: Оружие с таким именем уже существует]] when UpdateWeaponEvent is return CreationResult.alreadyExists.',
        setUp: () {
          when((() => weaponService.updateWeapon(
                  any(), any(), any(), any(), any(), any())))
              .thenAnswer(
                  (invocation) => Future.value(CreationResult.alreadyExists));
          when(weaponService.getWeapons).thenAnswer((_) => _weapons);
        },
        build: () => WeaponBloc(
            weaponService, strikeService, macrosService, enchantmentService),
        act: (bloc) => bloc.add(const UpdateWeaponEvent(
            'name',
            'name',
            DamageCube.d6,
            CharacteristicsEnum.strength,
            PhysicalTypeOfDamage.slashing, [])),
        expect: () => <WeaponState>[
          WeaponLoadedState(_weapons,
              error: 'Оружие с таким именем уже существует')
        ],
      );
    });
  });
}
