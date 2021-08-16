import 'package:flutter_memory_game_app/data/card/kids_activities_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late KidsActivitiesDataSouce kidsActivitiesDataSouce;

  setUpAll(() {
    kidsActivitiesDataSouce = KidsActivitiesDataSouce();
  });

  test(
    "Should return a list of 10 children's activities",
    () {
      final kidsActivitiesList = kidsActivitiesDataSouce.create();
      expect(kidsActivitiesList.length, equals(10));
    },
  );

  test(
    "Should check for repeated children's activities",
    () {
      final kidsActivitiesList = kidsActivitiesDataSouce.create();
      final uniqueName = kidsActivitiesList.map((activity) => activity.name).toSet();
      final uniqueImage = kidsActivitiesList.map((activity) => activity.image).toSet();
      expect(uniqueName.length, equals(10));
      expect(uniqueImage.length, equals(10));
    },
  );
}
