

import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/services/rides_service.dart';

void main() {
  final results = RidesService.filterBy(
    departure: Location(
      name: "Dijon",
      country: Country.france,
    ),
    seatRequested: 2,
  );

  print("Number of rides found: ${results.length}");

  for (var ride in results) {
  
    print(ride);
  }
}
