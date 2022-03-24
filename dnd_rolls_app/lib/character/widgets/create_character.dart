import 'package:flutter/material.dart';

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({Key? key}) : super(key: key);

  @override
  State<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  final _formKey = GlobalKey<FormState>();

  final _inputController = TextEditingController();
  late int _strengthValue;
  //final _strengthController = TextEditingController();
  int strength = 10;
  List<dynamic> result = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Создание персонажа'),
          buildNameField(),
          const Text(
              'Сила'), //onSubmitted можно юзать наверн, через onChanged на крайняк можно значения получать
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: '10',
            maxLength: 2,
            //controller: _strengthController,
            onChanged: (value) {
              _strengthValue = int.parse(value);
            },
            decoration: const InputDecoration(labelText: 'Сила'),
            validator: (value) {
              if (int.parse(value!) < 1 || int.parse(value) > 20) {
                return 'Значение от 1 до 20';
              } else {
                return null;
              }
            },
          ),
          const Text('Ловкость'),
          const Text('Телосложение'),
          const Text('Интеллект'),
          const Text('Мудрость'),
          const Text('Харизма'),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  result.addAll([
                    _inputController.text,
                    10,
                    //int.parse(_strengthController.text),
                    10,
                    10,
                    10,
                    10,
                    10
                  ]);
                  Navigator.of(context).pop(result);
                }
              },
              child: const Text('Сохранить')),
        ],
      ),
    );
  }

  Widget buildNameField() => TextFormField(
        controller: _inputController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: 'Как вас будут называть',
          labelText: 'Имя персонажа *',
        ),
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'Поле не должно быть пустым'
              : null;
        },
      );

  /* Widget buildStat(int characteristic) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              characteristic--;
            },
            tooltip: 'Понизить',
            child: const Icon(Icons.remove),
          )
        ],
      ); */

  Widget buildNumberField(TextEditingController controller) => TextField(
        controller: controller,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
      );
}
