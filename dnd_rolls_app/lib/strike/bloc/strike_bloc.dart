import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/strike.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:equatable/equatable.dart';

part 'strike_event.dart';
part 'strike_state.dart';

class StrikeBloc extends Bloc<StrikeEvent, StrikeState> {
  final StrikeService _strikeService;
  StrikeBloc(this._strikeService) : super(StrikeInitial()) {
    on<RegisterServiceEvent>((event, emit) async {
      await _strikeService.init();
      add(LoadStrikesEvent(event.character, event.weapon));
    });
    on<LoadStrikesEvent>((event, emit) {
      final strikes = _strikeService.getStrikes(event.character, event.weapon);
      emit(StrikeLoadedState(strikes));
    });
    on<SelectStrikeEvent>((event, emit) {
      final strikes = _strikeService.getStrikes(event.character, event.weapon);
      emit(SelectedStrikeState(strikes, event.strike));
    });
  }
}
