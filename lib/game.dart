// lib/game.dart
import 'dart:io';
import 'player.dart';
import 'fishing_spot.dart';

void runGame() {
  Player player = Player("Fisherman John");
  FishingSpot lake =
      FishingSpot("Lake Serenity", ["Goldfish", "Trout", "Bass", "Catfish"]);
  bool isRunning = true;

  while (isRunning) {
    print('--- Welcome to the RPG Fishing Game ---');
    print('1. Start Fishing');
    print('2. Show Inventory');
    print('3. Exit');
    print('Please select an option:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1': // Memulai memancing
        var catchResult = lake.throwDart();
        String fishCaught = catchResult['fish'];
        double fishWeight = catchResult['weight'];
        player.catchFish(fishCaught, fishWeight);
        break;
      case '2': // Menampilkan inventaris
        player.showInventory();
        break;
      case '3': // Keluar
        print('Goodbye!');
        isRunning = false;
        break;
      default:
        print('Invalid choice, please try again.');
    }
  }
}
