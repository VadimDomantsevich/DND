import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.dart';
part 'locale_event.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc()
      : super(
          const LocaleState.initial(
            locale: Locale('ru'),
          ),
        ) {
    on<ChooseLocaleEvent>((event, emit) => _onChooseLocaleEvent(event, emit));
  }

  void _onChooseLocaleEvent(
    ChooseLocaleEvent event,
    Emitter<LocaleState> emit,
  ) {
    emit(LocaleState.chosen(locale: event.locale));
  }
}
