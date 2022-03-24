import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/model/characteristics.dart';
import 'package:dnd_rolls_app/services/characteristics_service.dart';
import 'package:equatable/equatable.dart';

part 'characteristics_event.dart';
part 'characteristics_state.dart';

class CharacteristicsBloc
    extends Bloc<CharacteristicsEvent, CharacteristicsState> {
  final CharacteristicsService _characteristicsService;
  CharacteristicsBloc(this._characteristicsService)
      : super(CharacteristicsInitial()) {
    on<LoadCharacteristicsEvent>((event, emit) async {
      final characteristics =
          _characteristicsService.getCharacteristics(event.name);
      emit(CharacteristicsLoadedState(event.name, characteristics));
    });
    on<ChangeCharacteristicEvent>((event, emit) async {
      await _characteristicsService.updateCharacteristics(event.name,
          strength: event.strength,
          dexterity: event.dexterity,
          constitution: event.constitution,
          intelligence: event.intelligence,
          wisdom: event.wisdom,
          charisma: event.charisma);
      add(LoadCharacteristicsEvent(event.name));
    });
  }
}
