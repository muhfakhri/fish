import 'player.dart';

class Mission {
  String missionName;
  int fishRequired;
  bool completed = false;

  Mission(this.missionName, this.fishRequired);

  bool completeMission(Player player) {
    if (player.fishCaught >= fishRequired) {
      completed = true;
      print("Mission '${missionName}' completed!");
      return true;
    }
    return false;
  }
}
