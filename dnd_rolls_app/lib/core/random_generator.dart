import 'dart:math';

import 'package:dnd_rolls_app/core/constants/enums.dart';

class RandomGenerator {
  int rollD20() {
    return Random().nextInt(20) + 1;
  }

  int rollDamage(DamageCube damage) {
    switch (damage) {
      case DamageCube.d4:
        return Random().nextInt(4) + 1;
      case DamageCube.d6:
        return Random().nextInt(6) + 1;
      case DamageCube.d8:
        return Random().nextInt(8) + 1;
      case DamageCube.d10:
        return Random().nextInt(10) + 1;
      case DamageCube.d12:
        return Random().nextInt(12) + 1;
    }
  }
}
