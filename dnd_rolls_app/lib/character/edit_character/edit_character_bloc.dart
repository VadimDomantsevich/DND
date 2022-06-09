import 'package:bloc/bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/services/character_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_character_state.dart';
part 'edit_character_event.dart';
part 'edit_character_bloc.freezed.dart';

class EditCharacterBloc extends Bloc<EditCharacterEvent, EditCharacterState> {
  final CharacterService _characterService;
  final Character? character;
  EditCharacterBloc(
    this._characterService,
    this.character,
  ) : super(
          const EditCharacterState.editing(
            name: '',
            skillBonus: 3,
            strength: 10,
            dexterity: 10,
            constitution: 10,
            intelligence: 10,
            wisdom: 10,
            charisma: 10,
          ),
        ) {
    on<InitEvent>(
      (event, emit) => _onInitEvent(event, emit),
    );
    on<DecrementSkillBonusEvent>(
      (event, emit) => _onDecrementSkillBonusEvent(event, emit),
    );
    on<IncrementSkillBonusEvent>(
      (event, emit) => _onIncrementSkillBonusEvent(event, emit),
    );
    on<DecrementCharacteristicEvent>(
      (event, emit) => _onDecrementCharacteristicEvent(event, emit),
    );
    on<IncrementCharacteristicEvent>(
      (event, emit) => _onIncrementCharacteristicEvent(event, emit),
    );
    on<SubmitFormEvent>(
      (event, emit) => _onSubmitFormEvent(event, emit),
    );

    add(const InitEvent());
  }

  void _onInitEvent(
    InitEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    if (character != null) {
      emit(
        EditCharacterState.editing(
          name: character!.name,
          skillBonus: character!.skillBonus,
          strength: character!.strength,
          dexterity: character!.dexterity,
          constitution: character!.constitution,
          intelligence: character!.intelligence,
          wisdom: character!.wisdom,
          charisma: character!.charisma,
        ),
      );
    }
  }

  void _onDecrementSkillBonusEvent(
    DecrementSkillBonusEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    if (state.skillBonus > 0) {
      emit(
        EditCharacterState.editing(
          name: state.name,
          skillBonus: state.skillBonus - 1,
          strength: state.strength,
          dexterity: state.dexterity,
          constitution: state.constitution,
          intelligence: state.intelligence,
          wisdom: state.wisdom,
          charisma: state.charisma,
        ),
      );
    }
  }

  void _onIncrementSkillBonusEvent(
    IncrementSkillBonusEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    if (state.skillBonus < 6) {
      emit(
        EditCharacterState.editing(
          name: state.name,
          skillBonus: state.skillBonus + 1,
          strength: state.strength,
          dexterity: state.dexterity,
          constitution: state.constitution,
          intelligence: state.intelligence,
          wisdom: state.wisdom,
          charisma: state.charisma,
        ),
      );
    }
  }

  void _onDecrementCharacteristicEvent(
    DecrementCharacteristicEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    switch (event.characteristic) {
      case CharacteristicsEnum.strength:
        if (state.strength > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength - 1,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.dexterity:
        if (state.dexterity > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity - 1,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.constitution:
        if (state.constitution > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution - 1,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.intelligence:
        if (state.intelligence > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence - 1,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.wisdom:
        if (state.wisdom > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom - 1,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.charisma:
        if (state.charisma > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma - 1,
            ),
          );
        }
        break;
    }
  }

  void _onIncrementCharacteristicEvent(
    IncrementCharacteristicEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    switch (event.characteristic) {
      case CharacteristicsEnum.strength:
        if (state.strength > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength + 1,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.dexterity:
        if (state.dexterity > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity + 1,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.constitution:
        if (state.constitution > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution + 1,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.intelligence:
        if (state.intelligence > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence + 1,
              wisdom: state.wisdom,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.wisdom:
        if (state.wisdom > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom + 1,
              charisma: state.charisma,
            ),
          );
        }
        break;
      case CharacteristicsEnum.charisma:
        if (state.charisma > 0) {
          emit(
            EditCharacterState.editing(
              name: state.name,
              skillBonus: state.skillBonus,
              strength: state.strength,
              dexterity: state.dexterity,
              constitution: state.constitution,
              intelligence: state.intelligence,
              wisdom: state.wisdom,
              charisma: state.charisma + 1,
            ),
          );
        }
        break;
    }
  }

  void _onSubmitFormEvent(
    SubmitFormEvent event,
    Emitter<EditCharacterState> emit,
  ) {
    if (event.name == null || event.name!.isEmpty) {
      emit(
        EditCharacterState.emptyName(
          name: event.name,
          skillBonus: event.skillBonus,
          strength: event.strength,
          dexterity: event.dexterity,
          constitution: event.constitution,
          intelligence: event.intelligence,
          wisdom: event.wisdom,
          charisma: event.charisma,
        ),
      );
    } else if (event.name != null &&
        _characterService.getCharacters().any(
              (element) =>
                  element.name.toLowerCase() == event.name!.toLowerCase() &&
                  element != character,
            )) {
      emit(
        EditCharacterState.nameAlreadyExists(
          name: event.name,
          skillBonus: event.skillBonus,
          strength: event.strength,
          dexterity: event.dexterity,
          constitution: event.constitution,
          intelligence: event.intelligence,
          wisdom: event.wisdom,
          charisma: event.charisma,
        ),
      );
    } else {
      character != null
          ? _characterService.updateCharacter(
              character!.name,
              event.name!,
              event.skillBonus,
              event.strength,
              event.dexterity,
              event.constitution,
              event.intelligence,
              event.wisdom,
              event.charisma,
            )
          : _characterService.addCharacter(
              event.name!,
              event.skillBonus,
              event.strength,
              event.dexterity,
              event.constitution,
              event.intelligence,
              event.wisdom,
              event.charisma,
            );

      emit(
        EditCharacterState.valid(
          name: event.name,
          skillBonus: event.skillBonus,
          strength: event.strength,
          dexterity: event.dexterity,
          constitution: event.constitution,
          intelligence: event.intelligence,
          wisdom: event.wisdom,
          charisma: event.charisma,
        ),
      );
    }
  }
}
