import 'package:dnd_rolls_app/core/constants/enums.dart';
import 'package:dnd_rolls_app/core/constants/strings.dart';
import 'package:dnd_rolls_app/model/weapon.dart';
import 'package:dnd_rolls_app/services/weapon_service.dart';
import 'package:dnd_rolls_app/weapon/bloc/weapon_bloc.dart';
import 'package:dnd_rolls_app/weapon/widgets/update_weapon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WeaponScreen extends StatelessWidget {
  const WeaponScreen({Key? key}) : super(key: key);

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
        create: (context) =>
            WeaponBloc(RepositoryProvider.of<WeaponService>(context))
              ..add(RegisterServiceEvent()),
        child: BlocBuilder<WeaponBloc, WeaponState>(
          builder: ((context, state) {
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
                                onPressed: ((newContext) async => {
                                      BlocProvider.of<WeaponBloc>(context)
                                          .add(RemoveWeaponEvent(weapon.name))
                                    }),
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: '??????????????',
                              ),
                              SlidableAction(
                                onPressed: (((newContext) async =>
                                    {update(context, weapon)})),
                                backgroundColor: Colors.blue.shade200,
                                foregroundColor: Colors.white,
                                icon: Icons.create,
                                label: '??????????????????',
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                                '${weapon.name} ${getDamageName(weapon.damage)} ${getCharacteristicName(weapon.mainCharacteristic)}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('?????????????? ?????????? ????????????'),
                    trailing: const Icon(Icons.add_box_outlined),
                    onTap: () async {
                      List<dynamic> result = await showDialog(
                          context: context,
                          builder: (context) => const Dialog(
                                child: UpdateWeapon(),
                              ));
                      if (result.isNotEmpty) {
                        BlocProvider.of<WeaponBloc>(context).add(AddWeaponEvent(
                          result[0],
                          result[1],
                          result[2],
                        ));
                      }
                    },
                  ),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
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
        return Strings.weaponDamageD4;
      case DamageCube.d6:
        return Strings.weaponDamageD6;
      case DamageCube.d8:
        return Strings.weaponDamageD8;
      case DamageCube.d10:
        return Strings.weaponDamageD10;
      case DamageCube.d12:
        return Strings.weaponDamageD12;
    }
  }

  Future<void> update(BuildContext context, Weapon weapon) async {
    List<dynamic> result = await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: UpdateWeapon(weapon: weapon),
            ));
    if (result.isNotEmpty) {
      BlocProvider.of<WeaponBloc>(context).add(UpdateWeaponEvent(
        result[0],
        result[1],
        result[2],
        result[3],
      ));
    }
  }
}
