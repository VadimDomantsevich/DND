part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial({
    required Locale locale,
  }) = _Initial;
  const factory LocaleState.chosen({
    required Locale locale,
  }) = _Chosen;
}
