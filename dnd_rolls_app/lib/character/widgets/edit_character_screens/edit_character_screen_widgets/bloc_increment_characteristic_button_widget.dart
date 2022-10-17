import 'package:dnd_rolls_app/character/edit_character/edit_character_bloc.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/widgets/increment_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocIncrementCharacteristicButtonWidget extends StatelessWidget {
  const BlocIncrementCharacteristicButtonWidget({
    Key? key,
    required this.characteristic,
  }) : super(key: key);

  final CharacteristicsEnum characteristic;

  @override
  Widget build(BuildContext context) => IncrementButtonWidget.common(
        onPressed: () => context
            .read<EditCharacterBloc>()
            .add(IncrementCharacteristicEvent(characteristic: characteristic)),
      );
}
