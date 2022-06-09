import 'package:dnd_rolls_app/core/widgets/language_picker_widget.dart';
import 'package:dnd_rolls_app/core/widgets/dropdown_menu_item_text_widget.dart';
import 'package:dnd_rolls_app/locale/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocLanguagePickerWidget extends StatelessWidget {
  const BlocLanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return LanguagePickerWidget.common(
            value: state.locale,
            dropDownMenuItems: [
              DropdownMenuItem(
                value: const Locale('en'),
                onTap: () => context.read<LocaleBloc>().add(
                      const ChooseLocaleEvent(
                        locale: Locale('en'),
                      ),
                    ),
                child: const Center(
                  child: DropDownMenuItemTextWidget(
                    title: '🇺🇸',
                  ),
                ),
              ),
              DropdownMenuItem(
                value: const Locale('ru'),
                onTap: () => context.read<LocaleBloc>().add(
                      const ChooseLocaleEvent(
                        locale: Locale('ru'),
                      ),
                    ),
                child: const Center(
                  child: DropDownMenuItemTextWidget(
                    title: '🇷🇺',
                  ),
                ),
              ),
            ],
          );
        },
      );
}
