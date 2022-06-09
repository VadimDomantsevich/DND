import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/bloc_decrement_characteristic_button_widget.dart';
import 'package:dnd_rolls_app/character/widgets/edit_character_screens/edit_character_screen_widgets/bloc_increment_characteristic_button_widget.dart';
import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/widgets/title_with_number_text_widget.dart';
import 'package:flutter/material.dart';

class CharacteristicWidget extends StatelessWidget {
  const CharacteristicWidget({
    Key? key,
    required this.characteristic,
    required this.title,
    required this.value,
  }) : super(key: key);

  final CharacteristicsEnum characteristic;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: MediaQuery.of(context).size.width * 0.15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocDecrementCharacteristicButtonWidget(
              characteristic: characteristic,
            ),
            TitleWithNumberTextWidget(title: title, value: value),
            BlocIncrementCharacteristicButtonWidget(
              characteristic: characteristic,
            )
          ],
        ),
      );
}
