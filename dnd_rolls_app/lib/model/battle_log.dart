import 'package:dnd_rolls_app/model/damage.dart';

class BattleLog {
  final String logs;
  final List<Damage>? damage;

  BattleLog(this.logs, {this.damage});
}
