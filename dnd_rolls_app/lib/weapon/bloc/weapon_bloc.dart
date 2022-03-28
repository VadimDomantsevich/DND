import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:equatable/equatable.dart';

part 'weapon_event.dart';
part 'weapon_state.dart';

class WeaponBloc extends Bloc<WeaponEvent, WeaponState> {
  final WeaponService _weaponService;
  WeaponBloc(this._weaponService) : super(WeaponInitial()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _weaponService.init();
      add(const LoadWeaponEvent());
    });
    on<LoadWeaponEvent>((event, emit) {
      final weapons = _weaponService.getWeapons();
      emit(WeaponLoadedState(weapons));
    });
    on<AddWeaponEvent>((event, emit) async {
      await _weaponService.addWeapon(
          event.name, event.damage, event.characteristic);
      add(const LoadWeaponEvent());
    });
    on<UpdateWeaponEvent>((event, emit) async {
      await _weaponService.updateWeapon(
          event.name, event.newName, event.damage, event.characteristic);
      add(const LoadWeaponEvent());
    });
    on<RemoveWeaponEvent>((event, emit) async {
      await _weaponService.removeWeapon(event.name);
      add(const LoadWeaponEvent());
    });
  }
}
