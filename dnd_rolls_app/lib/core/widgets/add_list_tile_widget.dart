import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AddListTileWidget extends StatelessWidget {
  const AddListTileWidget({
    Key? key,
    required this.titleWidget,
    required this.trailingIconWidget,
    required this.onTap,
  }) : super(key: key);

  final Widget titleWidget;
  final Widget trailingIconWidget;
  final VoidCallback onTap;

  factory AddListTileWidget.common({
    required String title,
    required VoidCallback onTap,
  }) =>
      AddListTileWidget(
        titleWidget: AutoSizeText(
          title,
          maxLines: 1,
        ),
        trailingIconWidget: const Icon(Icons.add_box_outlined),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) => ListTile(
        title: titleWidget,
        trailing: trailingIconWidget,
        onTap: onTap,
      );
}
