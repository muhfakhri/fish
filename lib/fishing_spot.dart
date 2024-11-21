// lib/fishing_spot.dart
import 'dart:math';

class FishingSpot {
  String spotName;
  List<String> fishTypes;

  FishingSpot(this.spotName, this.fishTypes);

  Map<String, dynamic> throwDart() {
    Random random = Random();
    String fish = fishTypes[random.nextInt(fishTypes.length)];
    double weight =
        double.parse((1 + random.nextDouble() * 9).toStringAsFixed(2));
    return {'fish': fish, 'weight': weight};
  }
}
