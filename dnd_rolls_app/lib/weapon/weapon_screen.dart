import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/core/themes/app_theme.dart';
import 'package:dnd_rolls_app/core/widgets/wraps.dart';
import 'package:dnd_rolls_app/model/character.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/enchantment_service.dart';
import 'package:dnd_rolls_app/services/macros_service.dart';
import 'package:dnd_rolls_app/services/strike_service.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:dnd_rolls_app/weapon/bloc/weapon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeaponScreen extends StatelessWidget {
  final Character? character;
  const WeaponScreen({Key? key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.weaponScreenTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: BlocProvider(
        create: (context) => WeaponBloc(
          RepositoryProvider.of<WeaponService>(context),
          RepositoryProvider.of<StrikeService>(context),
          RepositoryProvider.of<MacrosService>(context),
          RepositoryProvider.of<EnchantmentService>(context),
        )..add(RegisterServiceEvent()),
        child: BlocConsumer<WeaponBloc, WeaponState>(
          listener: (context, state) {
            if (state is WeaponLoadedState) {
              if (state.error != null) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Ошибка"),
                    content: Text(state.error!),
                  ),
                );
              }
            }
          },
          builder: (context, state) =>
              containerRadialGradienWrap(buildListView(context, state)),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, WeaponState state) {
    if (state is WeaponLoadedState) {
      return ListView(
        children: [
          ...state.weapons.map(
            (weapon) => Column(
              children: [
                Slidable(
                  key: const ValueKey(1),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (newContext) async => {
                              BlocProvider.of<WeaponBloc>(context)
                                  .add(RemoveWeaponEvent(weapon.name))
                            },
                        backgroundColor:
                            AppTheme.deleteSlidableActionBacgroundColor,
                        foregroundColor: AppTheme.actionPaneForegroundColor,
                        icon: Icons.delete,
                        //label: 'Удалить',
                      ),
                      SlidableAction(
                        onPressed: (newContext) async =>
                            {update(context, weapon)},
                        backgroundColor: AppTheme.editSlidableActionBackgroundColor,
                        foregroundColor: AppTheme.actionPaneForegroundColor,
                        icon: Icons.create,
                        //label: 'Исправить',
                      ),
                      SlidableAction(
                        onPressed: (newContext) async =>
                            {enchant(context, weapon)},
                        backgroundColor:
                            AppTheme.enchantSlidableActionBackgroundColor,
                        foregroundColor: AppTheme.actionPaneForegroundColor,
                        icon: FontAwesomeIcons.wandMagicSparkles,
                        //label: 'Зачаровать',
                      ),
                    ],
                  ),
                  child: ListTile(
                    trailing: const Icon(Icons.check_circle_outline),
                    onTap: () {
                      BlocProvider.of<WeaponBloc>(context)
                          .add(SelectWeaponEvent(weapon));
                    },
                    title: Text(
                        '${weapon.name} ${getDamageName(weapon.damage)} ${getCharacteristicName(weapon.mainCharacteristic)} ${getTypeOfDamageName(weapon.typeOfDamage)}',),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Создать новое оружие'),
            trailing: const Icon(Icons.add_box_outlined),
            onTap: () async {
              /* List<dynamic> result = await showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                        child: UpdateWeapon(),
                      ));
              if (result.isNotEmpty) {
                BlocProvider.of<WeaponBloc>(context).add(
                    AddWeaponEvent(result[0], result[1], result[2], result[3]));
              } */
            },
          ),
        ],
      );
    } else if (state is SelectedWeaponState) {
      return ListView(
        children: [
          ...state.weapons.map(
            (weapon) => Slidable(
              key: const ValueKey(1),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (newContext) async => {
                          BlocProvider.of<WeaponBloc>(context)
                              .add(RemoveWeaponEvent(weapon.name))
                        },
                    backgroundColor: AppTheme.deleteSlidableActionBacgroundColor,
                    foregroundColor: AppTheme.actionPaneForegroundColor,
                    icon: Icons.delete,
                    //label: 'Удалить',
                  ),
                  SlidableAction(
                    onPressed: (newContext) async =>
                        {update(context, weapon)},
                    backgroundColor: AppTheme.editSlidableActionBackgroundColor,
                    foregroundColor: AppTheme.actionPaneForegroundColor,
                    icon: Icons.create,
                    //label: 'Исправить',
                  ),
                  SlidableAction(
                    onPressed: (newContext) async =>
                        {enchant(context, weapon)},
                    backgroundColor: AppTheme.enchantSlidableActionBackgroundColor,
                    foregroundColor: AppTheme.actionPaneForegroundColor,
                    icon: FontAwesomeIcons.wandMagicSparkles,
                    //label: 'Зачаровать',
                  ),
                ],
              ),
              child: ListTile(
                trailing: state.weapon.name == weapon.name
                    ? Icon(
                        Icons.check_circle,
                        color: Theme.of(context).primaryColor,
                      )
                    : const Icon(Icons.check_circle_outline),
                onTap: () {
                  if (state.weapon != weapon) {
                    BlocProvider.of<WeaponBloc>(context)
                        .add(SelectWeaponEvent(weapon));
                  } else {
                    BlocProvider.of<WeaponBloc>(context)
                        .add(const LoadWeaponEvent());
                  }
                },
                title: Text(
                    '${weapon.name} ${getDamageName(weapon.damage)} ${getCharacteristicName(weapon.mainCharacteristic)} ${getTypeOfDamageName(weapon.typeOfDamage)}',),
              ),
            ),
          ),
          ListTile(
            title: const Text('Создать новое оружие'),
            trailing: const Icon(Icons.add_box_outlined),
            onTap: () async {
              /* List<dynamic> result = await showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                        child: UpdateWeapon(),
                      ));
              if (result.isNotEmpty) {
                BlocProvider.of<WeaponBloc>(context).add(
                    AddWeaponEvent(result[0], result[1], result[2], result[3]));
              } */
            },
          ),
          elevatedButtonWrap(
            ElevatedButton(
                onPressed: () async {
                  /* Strike strike = await showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: StrikeScreen(
                                character: character!, weapon: state.weapon),
                          ));
                  Navigator.of(context).pop(strike); */
                },
                child: const Text(Strings.choose),),
          )
        ],
      );
    }
    return Container();
  }

  String getCharacteristicName(CharacteristicsEnum characteristic) {
    switch (characteristic) {
      case CharacteristicsEnum.strength:
        return Strings.strengthText;
      case CharacteristicsEnum.dexterity:
        return Strings.dexterityText;
      case CharacteristicsEnum.constitution:
        return Strings.constitutionText;
      case CharacteristicsEnum.intelligence:
        return Strings.intelligenceText;
      case CharacteristicsEnum.wisdom:
        return Strings.wisdomText;
      case CharacteristicsEnum.charisma:
        return Strings.charismaText;
    }
  }

  String getDamageName(DamageCube damage) {
    switch (damage) {
      case DamageCube.d4:
        return Strings.damageD4;
      case DamageCube.d6:
        return Strings.damageD6;
      case DamageCube.d8:
        return Strings.damageD8;
      case DamageCube.d10:
        return Strings.damageD10;
      case DamageCube.d12:
        return Strings.damageD12;
      case DamageCube.d6x2:
        return Strings.damage2D6;
    }
  }

  String getTypeOfDamageName(PhysicalTypeOfDamage typeOfDamage) {
    switch (typeOfDamage) {
      case PhysicalTypeOfDamage.crushing:
        return Strings.crushing;
      case PhysicalTypeOfDamage.piercing:
        return Strings.piercing;
      case PhysicalTypeOfDamage.slashing:
        return Strings.slashing;
    }
  }

  Future<void> update(BuildContext context, Weapon weapon) async {
    /* List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateWeapon(weapon: weapon),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<WeaponBloc>(context).add(UpdateWeaponEvent(
          result[0], result[1], result[2], result[3], result[4], result[5]));
    } */
  }

  Future<void> enchant(BuildContext context, Weapon weapon) async {
    /* List<Enchantment> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: EnchantWeapon(weapon: weapon),
            ));
    BlocProvider.of<WeaponBloc>(context)
        .add(EnchantWeaponEvent(weapon, result)); */
  }
}
