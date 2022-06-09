import 'package:dnd_rolls_app/character/edit_character/edit_character_bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/widgets/decrement_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDecrementCharacteristicButtonWidget extends StatelessWidget {
  const BlocDecrementCharacteristicButtonWidget({
    Key? key,
    required this.characteristic,
  }) : super(key: key);

  final CharacteristicsEnum characteristic;

  @override
  Widget build(BuildContext context) => DecrementButtonWidget.common(
        onPressed: () => context
            .read<EditCharacterBloc>()
            .add(DecrementCharacteristicEvent(characteristic: characteristic)),
      );
}
