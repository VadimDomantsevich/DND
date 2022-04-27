import 'package:flutter/material.dart';

Widget elevatedButtonWrap(ElevatedButton elevatedButton){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: elevatedButton,
  );
}