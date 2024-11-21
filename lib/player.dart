// lib/player.dart
class Player {
  String name;
  int level = 1;
  int fishCaught = 0;
  int money = 0;
  List<Map<String, dynamic>> inventory = [];

  Player(this.name);

  void catchFish(String fishType, double weight) {
    fishCaught++;
    inventory.add({'fish': fishType, 'weight': weight});
    money += (weight * 2).toInt();
    print('You caught a $fishType weighing $weight kg! Money: \$${money}');
  }

  void levelUp() {
    if (fishCaught >= 10) {
      level++;
      fishCaught = 0;
      print('Congratulations, $name! You leveled up to level $level!');
    }
  }

  void showInventory() {
    print('--- Inventory ---');
    for (var item in inventory) {
      print('${item['fish']} - ${item['weight']} kg');
    }
    print('-----------------');
  }
}
