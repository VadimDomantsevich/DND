import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:equatable/equatable.dart';

part 'weapon_event.dart';
part 'weapon_state.dart';

class WeaponBloc extends Bloc<WeaponEvent, WeaponState> {
  final WeaponService _weaponService;
  final StrikeService _strikeService;
  final MacrosService _macrosService;
  WeaponBloc(this._weaponService, this._strikeService, this._macrosService)
      : super(RegisteringServiceState()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _weaponService.init();
      await _strikeService.init();
      await _macrosService.init();
      add(const LoadWeaponEvent());
    });
    on<LoadWeaponEvent>((event, emit) {
      final weapons = _weaponService.getWeapons();
      emit(WeaponLoadedState(weapons));
    });
    on<AddWeaponEvent>((event, emit) {
      final result = _weaponService.addWeapon(
          event.name, event.damage, event.characteristic, event.typeOfDamage);
      switch (result) {
        case CreationResult.success:
          add(const LoadWeaponEvent());
          break;
        case CreationResult.failure:
          final weapons = _weaponService.getWeapons();
          emit(WeaponLoadedState(weapons, error: 'Не удалось создать'));
          break;
        case CreationResult.alreadyExists:
          final weapons = _weaponService.getWeapons();
          emit(WeaponLoadedState(weapons,
              error: 'Оружие с таким именем уже существует'));
          break;
      }
    });
    on<UpdateWeaponEvent>((event, emit) async {
      final result = await _weaponService.updateWeapon(
          event.name,
          event.newName,
          event.damage,
          event.characteristic,
          event.typeOfDamage);
      switch (result) {
        case CreationResult.success:
          final oldWeapon = Weapon(event.name, event.damage,
              event.characteristic, event.typeOfDamage);
          final macrosToUpdate = _macrosService.getAllMacros().where(
                (element) => element.strikes
                    .any((element) => element.weapon.name == event.name),
              );
          for (var macros in macrosToUpdate) {
            print('В макросе изначально');
            for (var item in macros.strikes) {
              print(item.name);
            }
            List<Strike> strikes = _strikeService.createNewWeaponMacrosStrikes(
                macros, oldWeapon, _weaponService.getWeapon(event.newName));
            _macrosService.updateMacros(
                macros.name, macros.name, macros.characterName, strikes);
            print('В макросе после изменения');
            for (var item in _macrosService
                .getMacros(macros.name, macros.characterName)
                .strikes) {
              print(item.name);
            }
          }
          add(const LoadWeaponEvent());
          break;
        case CreationResult.failure:
          final weapons = _weaponService.getWeapons();
          emit(WeaponLoadedState(weapons, error: 'Не удалось отредактировать'));
          break;
        case CreationResult.alreadyExists:
          final weapons = _weaponService.getWeapons();
          emit(WeaponLoadedState(weapons,
              error: 'Оружие с таким именем уже существует'));
          break;
      }
    });
    on<SelectWeaponEvent>((event, emit) {
      final weapons = _weaponService.getWeapons();
      emit(SelectedWeaponState(weapons, event.weapon));
    });
    on<RemoveWeaponEvent>((event, emit) async {
      await _weaponService.removeWeapon(event.name);
      add(const LoadWeaponEvent());
    });
  }
}
