import 'package:dnd_rolls_app/core/widgets/app_bar_title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharactersAppBarTitleTextWidget extends StatelessWidget {
  const CharactersAppBarTitleTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBarTitleTextWidget(
        title: AppLocalizations.of(context)!.characters,
      );
}
