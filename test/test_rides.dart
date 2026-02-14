import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/services/rides_service.dart';

void main() {
  final results = RidesService.filterBy(
    departure: Location(
      name: "Dijon",
      country: Country.france,
    ),
    seatRequested: 1,
  );

  final results1 = RidesService.filterBy(
    departure: Location(
      name: "London",
      country: Country.uk,
    ),
    seatRequested: 2,
  );
  

  print("Number of rides found: ${results.length}");

  for (var ride in results) {
    print("Departure: ${ride.departure}");
    print(ride);
  }
}
