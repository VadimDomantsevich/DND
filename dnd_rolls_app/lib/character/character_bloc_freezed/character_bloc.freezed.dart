// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Character> characters, String? error)
        charactersLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CharactersLoadedState value) charactersLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterStateCopyWith<$Res> {
  factory $CharacterStateCopyWith(
          CharacterState value, $Res Function(CharacterState) then) =
      _$CharacterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CharacterStateCopyWithImpl<$Res>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._value, this._then);

  final CharacterState _value;
  // ignore: unused_field
  final $Res Function(CharacterState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$CharacterStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CharacterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Character> characters, String? error)
        charactersLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CharactersLoadedState value) charactersLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CharacterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_CharactersLoadedStateCopyWith<$Res> {
  factory _$$_CharactersLoadedStateCopyWith(_$_CharactersLoadedState value,
          $Res Function(_$_CharactersLoadedState) then) =
      __$$_CharactersLoadedStateCopyWithImpl<$Res>;
  $Res call({List<Character> characters, String? error});
}

/// @nodoc
class __$$_CharactersLoadedStateCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res>
    implements _$$_CharactersLoadedStateCopyWith<$Res> {
  __$$_CharactersLoadedStateCopyWithImpl(_$_CharactersLoadedState _value,
      $Res Function(_$_CharactersLoadedState) _then)
      : super(_value, (v) => _then(v as _$_CharactersLoadedState));

  @override
  _$_CharactersLoadedState get _value =>
      super._value as _$_CharactersLoadedState;

  @override
  $Res call({
    Object? characters = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_CharactersLoadedState(
      characters: characters == freezed
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CharactersLoadedState implements _CharactersLoadedState {
  const _$_CharactersLoadedState(
      {required final List<Character> characters, this.error})
      : _characters = characters;

  final List<Character> _characters;
  @override
  List<Character> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'CharacterState.charactersLoaded(characters: $characters, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharactersLoadedState &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_characters),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_CharactersLoadedStateCopyWith<_$_CharactersLoadedState> get copyWith =>
      __$$_CharactersLoadedStateCopyWithImpl<_$_CharactersLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Character> characters, String? error)
        charactersLoaded,
  }) {
    return charactersLoaded(characters, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
  }) {
    return charactersLoaded?.call(characters, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Character> characters, String? error)?
        charactersLoaded,
    required TResult orElse(),
  }) {
    if (charactersLoaded != null) {
      return charactersLoaded(characters, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CharactersLoadedState value) charactersLoaded,
  }) {
    return charactersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
  }) {
    return charactersLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CharactersLoadedState value)? charactersLoaded,
    required TResult orElse(),
  }) {
    if (charactersLoaded != null) {
      return charactersLoaded(this);
    }
    return orElse();
  }
}

abstract class _CharactersLoadedState implements CharacterState {
  const factory _CharactersLoadedState(
      {required final List<Character> characters,
      final String? error}) = _$_CharactersLoadedState;

  List<Character> get characters => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_CharactersLoadedStateCopyWith<_$_CharactersLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CharacterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterEventCopyWith<$Res> {
  factory $CharacterEventCopyWith(
          CharacterEvent value, $Res Function(CharacterEvent) then) =
      _$CharacterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CharacterEventCopyWithImpl<$Res>
    implements $CharacterEventCopyWith<$Res> {
  _$CharacterEventCopyWithImpl(this._value, this._then);

  final CharacterEvent _value;
  // ignore: unused_field
  final $Res Function(CharacterEvent) _then;
}

/// @nodoc
abstract class _$$LoadCharactersEventCopyWith<$Res> {
  factory _$$LoadCharactersEventCopyWith(_$LoadCharactersEvent value,
          $Res Function(_$LoadCharactersEvent) then) =
      __$$LoadCharactersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCharactersEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$LoadCharactersEventCopyWith<$Res> {
  __$$LoadCharactersEventCopyWithImpl(
      _$LoadCharactersEvent _value, $Res Function(_$LoadCharactersEvent) _then)
      : super(_value, (v) => _then(v as _$LoadCharactersEvent));

  @override
  _$LoadCharactersEvent get _value => super._value as _$LoadCharactersEvent;
}

/// @nodoc

class _$LoadCharactersEvent implements LoadCharactersEvent {
  const _$LoadCharactersEvent();

  @override
  String toString() {
    return 'CharacterEvent.loadCharacters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCharactersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return loadCharacters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return loadCharacters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (loadCharacters != null) {
      return loadCharacters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return loadCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return loadCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (loadCharacters != null) {
      return loadCharacters(this);
    }
    return orElse();
  }
}

abstract class LoadCharactersEvent implements CharacterEvent {
  const factory LoadCharactersEvent() = _$LoadCharactersEvent;
}

/// @nodoc
abstract class _$$GetAllCharactersNamesEventCopyWith<$Res> {
  factory _$$GetAllCharactersNamesEventCopyWith(
          _$GetAllCharactersNamesEvent value,
          $Res Function(_$GetAllCharactersNamesEvent) then) =
      __$$GetAllCharactersNamesEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCharactersNamesEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$GetAllCharactersNamesEventCopyWith<$Res> {
  __$$GetAllCharactersNamesEventCopyWithImpl(
      _$GetAllCharactersNamesEvent _value,
      $Res Function(_$GetAllCharactersNamesEvent) _then)
      : super(_value, (v) => _then(v as _$GetAllCharactersNamesEvent));

  @override
  _$GetAllCharactersNamesEvent get _value =>
      super._value as _$GetAllCharactersNamesEvent;
}

/// @nodoc

class _$GetAllCharactersNamesEvent implements GetAllCharactersNamesEvent {
  const _$GetAllCharactersNamesEvent();

  @override
  String toString() {
    return 'CharacterEvent.getAllCharactersNames()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCharactersNamesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return getAllCharactersNames();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return getAllCharactersNames?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (getAllCharactersNames != null) {
      return getAllCharactersNames();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return getAllCharactersNames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return getAllCharactersNames?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (getAllCharactersNames != null) {
      return getAllCharactersNames(this);
    }
    return orElse();
  }
}

abstract class GetAllCharactersNamesEvent implements CharacterEvent {
  const factory GetAllCharactersNamesEvent() = _$GetAllCharactersNamesEvent;
}

/// @nodoc
abstract class _$$GetCharactersNamesEventCopyWith<$Res> {
  factory _$$GetCharactersNamesEventCopyWith(_$GetCharactersNamesEvent value,
          $Res Function(_$GetCharactersNamesEvent) then) =
      __$$GetCharactersNamesEventCopyWithImpl<$Res>;
  $Res call({List<Character> characters});
}

/// @nodoc
class __$$GetCharactersNamesEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$GetCharactersNamesEventCopyWith<$Res> {
  __$$GetCharactersNamesEventCopyWithImpl(_$GetCharactersNamesEvent _value,
      $Res Function(_$GetCharactersNamesEvent) _then)
      : super(_value, (v) => _then(v as _$GetCharactersNamesEvent));

  @override
  _$GetCharactersNamesEvent get _value =>
      super._value as _$GetCharactersNamesEvent;

  @override
  $Res call({
    Object? characters = freezed,
  }) {
    return _then(_$GetCharactersNamesEvent(
      characters: characters == freezed
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$GetCharactersNamesEvent implements GetCharactersNamesEvent {
  const _$GetCharactersNamesEvent({required final List<Character> characters})
      : _characters = characters;

  final List<Character> _characters;
  @override
  List<Character> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  String toString() {
    return 'CharacterEvent.getCharactersNames(characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCharactersNamesEvent &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_characters));

  @JsonKey(ignore: true)
  @override
  _$$GetCharactersNamesEventCopyWith<_$GetCharactersNamesEvent> get copyWith =>
      __$$GetCharactersNamesEventCopyWithImpl<_$GetCharactersNamesEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return getCharactersNames(characters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return getCharactersNames?.call(characters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (getCharactersNames != null) {
      return getCharactersNames(characters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return getCharactersNames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return getCharactersNames?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (getCharactersNames != null) {
      return getCharactersNames(this);
    }
    return orElse();
  }
}

abstract class GetCharactersNamesEvent implements CharacterEvent {
  const factory GetCharactersNamesEvent(
      {required final List<Character> characters}) = _$GetCharactersNamesEvent;

  List<Character> get characters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$GetCharactersNamesEventCopyWith<_$GetCharactersNamesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCharacterEventCopyWith<$Res> {
  factory _$$GetCharacterEventCopyWith(
          _$GetCharacterEvent value, $Res Function(_$GetCharacterEvent) then) =
      __$$GetCharacterEventCopyWithImpl<$Res>;
  $Res call({String characterName});
}

/// @nodoc
class __$$GetCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$GetCharacterEventCopyWith<$Res> {
  __$$GetCharacterEventCopyWithImpl(
      _$GetCharacterEvent _value, $Res Function(_$GetCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$GetCharacterEvent));

  @override
  _$GetCharacterEvent get _value => super._value as _$GetCharacterEvent;

  @override
  $Res call({
    Object? characterName = freezed,
  }) {
    return _then(_$GetCharacterEvent(
      characterName: characterName == freezed
          ? _value.characterName
          : characterName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCharacterEvent implements GetCharacterEvent {
  const _$GetCharacterEvent({required this.characterName});

  @override
  final String characterName;

  @override
  String toString() {
    return 'CharacterEvent.getCharacter(characterName: $characterName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCharacterEvent &&
            const DeepCollectionEquality()
                .equals(other.characterName, characterName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(characterName));

  @JsonKey(ignore: true)
  @override
  _$$GetCharacterEventCopyWith<_$GetCharacterEvent> get copyWith =>
      __$$GetCharacterEventCopyWithImpl<_$GetCharacterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return getCharacter(characterName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return getCharacter?.call(characterName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (getCharacter != null) {
      return getCharacter(characterName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return getCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return getCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (getCharacter != null) {
      return getCharacter(this);
    }
    return orElse();
  }
}

abstract class GetCharacterEvent implements CharacterEvent {
  const factory GetCharacterEvent({required final String characterName}) =
      _$GetCharacterEvent;

  String get characterName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$GetCharacterEventCopyWith<_$GetCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCharacterEventCopyWith<$Res> {
  factory _$$AddCharacterEventCopyWith(
          _$AddCharacterEvent value, $Res Function(_$AddCharacterEvent) then) =
      __$$AddCharacterEventCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int skillBonus,
      int strength,
      int dexterity,
      int constitution,
      int intelligence,
      int wisdom,
      int charisma});
}

/// @nodoc
class __$$AddCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$AddCharacterEventCopyWith<$Res> {
  __$$AddCharacterEventCopyWithImpl(
      _$AddCharacterEvent _value, $Res Function(_$AddCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$AddCharacterEvent));

  @override
  _$AddCharacterEvent get _value => super._value as _$AddCharacterEvent;

  @override
  $Res call({
    Object? name = freezed,
    Object? skillBonus = freezed,
    Object? strength = freezed,
    Object? dexterity = freezed,
    Object? constitution = freezed,
    Object? intelligence = freezed,
    Object? wisdom = freezed,
    Object? charisma = freezed,
  }) {
    return _then(_$AddCharacterEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      skillBonus: skillBonus == freezed
          ? _value.skillBonus
          : skillBonus // ignore: cast_nullable_to_non_nullable
              as int,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      dexterity: dexterity == freezed
          ? _value.dexterity
          : dexterity // ignore: cast_nullable_to_non_nullable
              as int,
      constitution: constitution == freezed
          ? _value.constitution
          : constitution // ignore: cast_nullable_to_non_nullable
              as int,
      intelligence: intelligence == freezed
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      wisdom: wisdom == freezed
          ? _value.wisdom
          : wisdom // ignore: cast_nullable_to_non_nullable
              as int,
      charisma: charisma == freezed
          ? _value.charisma
          : charisma // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddCharacterEvent implements AddCharacterEvent {
  const _$AddCharacterEvent(
      {required this.name,
      required this.skillBonus,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma});

  @override
  final String name;
  @override
  final int skillBonus;
  @override
  final int strength;
  @override
  final int dexterity;
  @override
  final int constitution;
  @override
  final int intelligence;
  @override
  final int wisdom;
  @override
  final int charisma;

  @override
  String toString() {
    return 'CharacterEvent.addCharacter(name: $name, skillBonus: $skillBonus, strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCharacterEvent &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.skillBonus, skillBonus) &&
            const DeepCollectionEquality().equals(other.strength, strength) &&
            const DeepCollectionEquality().equals(other.dexterity, dexterity) &&
            const DeepCollectionEquality()
                .equals(other.constitution, constitution) &&
            const DeepCollectionEquality()
                .equals(other.intelligence, intelligence) &&
            const DeepCollectionEquality().equals(other.wisdom, wisdom) &&
            const DeepCollectionEquality().equals(other.charisma, charisma));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(skillBonus),
      const DeepCollectionEquality().hash(strength),
      const DeepCollectionEquality().hash(dexterity),
      const DeepCollectionEquality().hash(constitution),
      const DeepCollectionEquality().hash(intelligence),
      const DeepCollectionEquality().hash(wisdom),
      const DeepCollectionEquality().hash(charisma));

  @JsonKey(ignore: true)
  @override
  _$$AddCharacterEventCopyWith<_$AddCharacterEvent> get copyWith =>
      __$$AddCharacterEventCopyWithImpl<_$AddCharacterEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return addCharacter(name, skillBonus, strength, dexterity, constitution,
        intelligence, wisdom, charisma);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return addCharacter?.call(name, skillBonus, strength, dexterity,
        constitution, intelligence, wisdom, charisma);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (addCharacter != null) {
      return addCharacter(name, skillBonus, strength, dexterity, constitution,
          intelligence, wisdom, charisma);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return addCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return addCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (addCharacter != null) {
      return addCharacter(this);
    }
    return orElse();
  }
}

abstract class AddCharacterEvent implements CharacterEvent {
  const factory AddCharacterEvent(
      {required final String name,
      required final int skillBonus,
      required final int strength,
      required final int dexterity,
      required final int constitution,
      required final int intelligence,
      required final int wisdom,
      required final int charisma}) = _$AddCharacterEvent;

  String get name => throw _privateConstructorUsedError;
  int get skillBonus => throw _privateConstructorUsedError;
  int get strength => throw _privateConstructorUsedError;
  int get dexterity => throw _privateConstructorUsedError;
  int get constitution => throw _privateConstructorUsedError;
  int get intelligence => throw _privateConstructorUsedError;
  int get wisdom => throw _privateConstructorUsedError;
  int get charisma => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AddCharacterEventCopyWith<_$AddCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCharacterEventCopyWith<$Res> {
  factory _$$UpdateCharacterEventCopyWith(_$UpdateCharacterEvent value,
          $Res Function(_$UpdateCharacterEvent) then) =
      __$$UpdateCharacterEventCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String newName,
      int skillBonus,
      int strength,
      int dexterity,
      int constitution,
      int intelligence,
      int wisdom,
      int charisma});
}

/// @nodoc
class __$$UpdateCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$UpdateCharacterEventCopyWith<$Res> {
  __$$UpdateCharacterEventCopyWithImpl(_$UpdateCharacterEvent _value,
      $Res Function(_$UpdateCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$UpdateCharacterEvent));

  @override
  _$UpdateCharacterEvent get _value => super._value as _$UpdateCharacterEvent;

  @override
  $Res call({
    Object? name = freezed,
    Object? newName = freezed,
    Object? skillBonus = freezed,
    Object? strength = freezed,
    Object? dexterity = freezed,
    Object? constitution = freezed,
    Object? intelligence = freezed,
    Object? wisdom = freezed,
    Object? charisma = freezed,
  }) {
    return _then(_$UpdateCharacterEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      newName: newName == freezed
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
      skillBonus: skillBonus == freezed
          ? _value.skillBonus
          : skillBonus // ignore: cast_nullable_to_non_nullable
              as int,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int,
      dexterity: dexterity == freezed
          ? _value.dexterity
          : dexterity // ignore: cast_nullable_to_non_nullable
              as int,
      constitution: constitution == freezed
          ? _value.constitution
          : constitution // ignore: cast_nullable_to_non_nullable
              as int,
      intelligence: intelligence == freezed
          ? _value.intelligence
          : intelligence // ignore: cast_nullable_to_non_nullable
              as int,
      wisdom: wisdom == freezed
          ? _value.wisdom
          : wisdom // ignore: cast_nullable_to_non_nullable
              as int,
      charisma: charisma == freezed
          ? _value.charisma
          : charisma // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateCharacterEvent implements UpdateCharacterEvent {
  const _$UpdateCharacterEvent(
      {required this.name,
      required this.newName,
      required this.skillBonus,
      required this.strength,
      required this.dexterity,
      required this.constitution,
      required this.intelligence,
      required this.wisdom,
      required this.charisma});

  @override
  final String name;
  @override
  final String newName;
  @override
  final int skillBonus;
  @override
  final int strength;
  @override
  final int dexterity;
  @override
  final int constitution;
  @override
  final int intelligence;
  @override
  final int wisdom;
  @override
  final int charisma;

  @override
  String toString() {
    return 'CharacterEvent.updateCharacter(name: $name, newName: $newName, skillBonus: $skillBonus, strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCharacterEvent &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.newName, newName) &&
            const DeepCollectionEquality()
                .equals(other.skillBonus, skillBonus) &&
            const DeepCollectionEquality().equals(other.strength, strength) &&
            const DeepCollectionEquality().equals(other.dexterity, dexterity) &&
            const DeepCollectionEquality()
                .equals(other.constitution, constitution) &&
            const DeepCollectionEquality()
                .equals(other.intelligence, intelligence) &&
            const DeepCollectionEquality().equals(other.wisdom, wisdom) &&
            const DeepCollectionEquality().equals(other.charisma, charisma));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(newName),
      const DeepCollectionEquality().hash(skillBonus),
      const DeepCollectionEquality().hash(strength),
      const DeepCollectionEquality().hash(dexterity),
      const DeepCollectionEquality().hash(constitution),
      const DeepCollectionEquality().hash(intelligence),
      const DeepCollectionEquality().hash(wisdom),
      const DeepCollectionEquality().hash(charisma));

  @JsonKey(ignore: true)
  @override
  _$$UpdateCharacterEventCopyWith<_$UpdateCharacterEvent> get copyWith =>
      __$$UpdateCharacterEventCopyWithImpl<_$UpdateCharacterEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return updateCharacter(name, newName, skillBonus, strength, dexterity,
        constitution, intelligence, wisdom, charisma);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return updateCharacter?.call(name, newName, skillBonus, strength, dexterity,
        constitution, intelligence, wisdom, charisma);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (updateCharacter != null) {
      return updateCharacter(name, newName, skillBonus, strength, dexterity,
          constitution, intelligence, wisdom, charisma);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return updateCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return updateCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (updateCharacter != null) {
      return updateCharacter(this);
    }
    return orElse();
  }
}

abstract class UpdateCharacterEvent implements CharacterEvent {
  const factory UpdateCharacterEvent(
      {required final String name,
      required final String newName,
      required final int skillBonus,
      required final int strength,
      required final int dexterity,
      required final int constitution,
      required final int intelligence,
      required final int wisdom,
      required final int charisma}) = _$UpdateCharacterEvent;

  String get name => throw _privateConstructorUsedError;
  String get newName => throw _privateConstructorUsedError;
  int get skillBonus => throw _privateConstructorUsedError;
  int get strength => throw _privateConstructorUsedError;
  int get dexterity => throw _privateConstructorUsedError;
  int get constitution => throw _privateConstructorUsedError;
  int get intelligence => throw _privateConstructorUsedError;
  int get wisdom => throw _privateConstructorUsedError;
  int get charisma => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateCharacterEventCopyWith<_$UpdateCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCharacterEventCopyWith<$Res> {
  factory _$$SelectCharacterEventCopyWith(_$SelectCharacterEvent value,
          $Res Function(_$SelectCharacterEvent) then) =
      __$$SelectCharacterEventCopyWithImpl<$Res>;
  $Res call({Character character, List<Character> selectedCharacters});
}

/// @nodoc
class __$$SelectCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$SelectCharacterEventCopyWith<$Res> {
  __$$SelectCharacterEventCopyWithImpl(_$SelectCharacterEvent _value,
      $Res Function(_$SelectCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$SelectCharacterEvent));

  @override
  _$SelectCharacterEvent get _value => super._value as _$SelectCharacterEvent;

  @override
  $Res call({
    Object? character = freezed,
    Object? selectedCharacters = freezed,
  }) {
    return _then(_$SelectCharacterEvent(
      character: character == freezed
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      selectedCharacters: selectedCharacters == freezed
          ? _value._selectedCharacters
          : selectedCharacters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$SelectCharacterEvent implements SelectCharacterEvent {
  const _$SelectCharacterEvent(
      {required this.character,
      required final List<Character> selectedCharacters})
      : _selectedCharacters = selectedCharacters;

  @override
  final Character character;
  final List<Character> _selectedCharacters;
  @override
  List<Character> get selectedCharacters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCharacters);
  }

  @override
  String toString() {
    return 'CharacterEvent.selectCharacter(character: $character, selectedCharacters: $selectedCharacters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCharacterEvent &&
            const DeepCollectionEquality().equals(other.character, character) &&
            const DeepCollectionEquality()
                .equals(other._selectedCharacters, _selectedCharacters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(character),
      const DeepCollectionEquality().hash(_selectedCharacters));

  @JsonKey(ignore: true)
  @override
  _$$SelectCharacterEventCopyWith<_$SelectCharacterEvent> get copyWith =>
      __$$SelectCharacterEventCopyWithImpl<_$SelectCharacterEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return selectCharacter(character, selectedCharacters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return selectCharacter?.call(character, selectedCharacters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (selectCharacter != null) {
      return selectCharacter(character, selectedCharacters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return selectCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return selectCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (selectCharacter != null) {
      return selectCharacter(this);
    }
    return orElse();
  }
}

abstract class SelectCharacterEvent implements CharacterEvent {
  const factory SelectCharacterEvent(
          {required final Character character,
          required final List<Character> selectedCharacters}) =
      _$SelectCharacterEvent;

  Character get character => throw _privateConstructorUsedError;
  List<Character> get selectedCharacters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SelectCharacterEventCopyWith<_$SelectCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnselectCharacterEventCopyWith<$Res> {
  factory _$$UnselectCharacterEventCopyWith(_$UnselectCharacterEvent value,
          $Res Function(_$UnselectCharacterEvent) then) =
      __$$UnselectCharacterEventCopyWithImpl<$Res>;
  $Res call({Character character, List<Character> selectedCharacters});
}

/// @nodoc
class __$$UnselectCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$UnselectCharacterEventCopyWith<$Res> {
  __$$UnselectCharacterEventCopyWithImpl(_$UnselectCharacterEvent _value,
      $Res Function(_$UnselectCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$UnselectCharacterEvent));

  @override
  _$UnselectCharacterEvent get _value =>
      super._value as _$UnselectCharacterEvent;

  @override
  $Res call({
    Object? character = freezed,
    Object? selectedCharacters = freezed,
  }) {
    return _then(_$UnselectCharacterEvent(
      character: character == freezed
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as Character,
      selectedCharacters: selectedCharacters == freezed
          ? _value._selectedCharacters
          : selectedCharacters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$UnselectCharacterEvent implements UnselectCharacterEvent {
  const _$UnselectCharacterEvent(
      {required this.character,
      required final List<Character> selectedCharacters})
      : _selectedCharacters = selectedCharacters;

  @override
  final Character character;
  final List<Character> _selectedCharacters;
  @override
  List<Character> get selectedCharacters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCharacters);
  }

  @override
  String toString() {
    return 'CharacterEvent.unselectCharacter(character: $character, selectedCharacters: $selectedCharacters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnselectCharacterEvent &&
            const DeepCollectionEquality().equals(other.character, character) &&
            const DeepCollectionEquality()
                .equals(other._selectedCharacters, _selectedCharacters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(character),
      const DeepCollectionEquality().hash(_selectedCharacters));

  @JsonKey(ignore: true)
  @override
  _$$UnselectCharacterEventCopyWith<_$UnselectCharacterEvent> get copyWith =>
      __$$UnselectCharacterEventCopyWithImpl<_$UnselectCharacterEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return unselectCharacter(character, selectedCharacters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return unselectCharacter?.call(character, selectedCharacters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (unselectCharacter != null) {
      return unselectCharacter(character, selectedCharacters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return unselectCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return unselectCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (unselectCharacter != null) {
      return unselectCharacter(this);
    }
    return orElse();
  }
}

abstract class UnselectCharacterEvent implements CharacterEvent {
  const factory UnselectCharacterEvent(
          {required final Character character,
          required final List<Character> selectedCharacters}) =
      _$UnselectCharacterEvent;

  Character get character => throw _privateConstructorUsedError;
  List<Character> get selectedCharacters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UnselectCharacterEventCopyWith<_$UnselectCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCharacterEventCopyWith<$Res> {
  factory _$$RemoveCharacterEventCopyWith(_$RemoveCharacterEvent value,
          $Res Function(_$RemoveCharacterEvent) then) =
      __$$RemoveCharacterEventCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$$RemoveCharacterEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$RemoveCharacterEventCopyWith<$Res> {
  __$$RemoveCharacterEventCopyWithImpl(_$RemoveCharacterEvent _value,
      $Res Function(_$RemoveCharacterEvent) _then)
      : super(_value, (v) => _then(v as _$RemoveCharacterEvent));

  @override
  _$RemoveCharacterEvent get _value => super._value as _$RemoveCharacterEvent;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$RemoveCharacterEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveCharacterEvent implements RemoveCharacterEvent {
  const _$RemoveCharacterEvent({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'CharacterEvent.removeCharacter(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCharacterEvent &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$RemoveCharacterEventCopyWith<_$RemoveCharacterEvent> get copyWith =>
      __$$RemoveCharacterEventCopyWithImpl<_$RemoveCharacterEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return removeCharacter(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return removeCharacter?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (removeCharacter != null) {
      return removeCharacter(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return removeCharacter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return removeCharacter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (removeCharacter != null) {
      return removeCharacter(this);
    }
    return orElse();
  }
}

abstract class RemoveCharacterEvent implements CharacterEvent {
  const factory RemoveCharacterEvent({required final String name}) =
      _$RemoveCharacterEvent;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RemoveCharacterEventCopyWith<_$RemoveCharacterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterServiceEventCopyWith<$Res> {
  factory _$$RegisterServiceEventCopyWith(_$RegisterServiceEvent value,
          $Res Function(_$RegisterServiceEvent) then) =
      __$$RegisterServiceEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterServiceEventCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res>
    implements _$$RegisterServiceEventCopyWith<$Res> {
  __$$RegisterServiceEventCopyWithImpl(_$RegisterServiceEvent _value,
      $Res Function(_$RegisterServiceEvent) _then)
      : super(_value, (v) => _then(v as _$RegisterServiceEvent));

  @override
  _$RegisterServiceEvent get _value => super._value as _$RegisterServiceEvent;
}

/// @nodoc

class _$RegisterServiceEvent implements RegisterServiceEvent {
  const _$RegisterServiceEvent();

  @override
  String toString() {
    return 'CharacterEvent.registerService()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterServiceEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCharacters,
    required TResult Function() getAllCharactersNames,
    required TResult Function(List<Character> characters) getCharactersNames,
    required TResult Function(String characterName) getCharacter,
    required TResult Function(
            String name,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        addCharacter,
    required TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)
        updateCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        selectCharacter,
    required TResult Function(
            Character character, List<Character> selectedCharacters)
        unselectCharacter,
    required TResult Function(String name) removeCharacter,
    required TResult Function() registerService,
  }) {
    return registerService();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
  }) {
    return registerService?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCharacters,
    TResult Function()? getAllCharactersNames,
    TResult Function(List<Character> characters)? getCharactersNames,
    TResult Function(String characterName)? getCharacter,
    TResult Function(String name, int skillBonus, int strength, int dexterity,
            int constitution, int intelligence, int wisdom, int charisma)?
        addCharacter,
    TResult Function(
            String name,
            String newName,
            int skillBonus,
            int strength,
            int dexterity,
            int constitution,
            int intelligence,
            int wisdom,
            int charisma)?
        updateCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        selectCharacter,
    TResult Function(Character character, List<Character> selectedCharacters)?
        unselectCharacter,
    TResult Function(String name)? removeCharacter,
    TResult Function()? registerService,
    required TResult orElse(),
  }) {
    if (registerService != null) {
      return registerService();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCharactersEvent value) loadCharacters,
    required TResult Function(GetAllCharactersNamesEvent value)
        getAllCharactersNames,
    required TResult Function(GetCharactersNamesEvent value) getCharactersNames,
    required TResult Function(GetCharacterEvent value) getCharacter,
    required TResult Function(AddCharacterEvent value) addCharacter,
    required TResult Function(UpdateCharacterEvent value) updateCharacter,
    required TResult Function(SelectCharacterEvent value) selectCharacter,
    required TResult Function(UnselectCharacterEvent value) unselectCharacter,
    required TResult Function(RemoveCharacterEvent value) removeCharacter,
    required TResult Function(RegisterServiceEvent value) registerService,
  }) {
    return registerService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
  }) {
    return registerService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCharactersEvent value)? loadCharacters,
    TResult Function(GetAllCharactersNamesEvent value)? getAllCharactersNames,
    TResult Function(GetCharactersNamesEvent value)? getCharactersNames,
    TResult Function(GetCharacterEvent value)? getCharacter,
    TResult Function(AddCharacterEvent value)? addCharacter,
    TResult Function(UpdateCharacterEvent value)? updateCharacter,
    TResult Function(SelectCharacterEvent value)? selectCharacter,
    TResult Function(UnselectCharacterEvent value)? unselectCharacter,
    TResult Function(RemoveCharacterEvent value)? removeCharacter,
    TResult Function(RegisterServiceEvent value)? registerService,
    required TResult orElse(),
  }) {
    if (registerService != null) {
      return registerService(this);
    }
    return orElse();
  }
}

abstract class RegisterServiceEvent implements CharacterEvent {
  const factory RegisterServiceEvent() = _$RegisterServiceEvent;
}
