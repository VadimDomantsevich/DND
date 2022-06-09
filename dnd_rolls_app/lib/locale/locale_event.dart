part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.chooseLocale({
    required Locale locale,
  }) = ChooseLocaleEvent;
}
