import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/ui/widgets/actions/BlaButton.dart';
import 'package:week_3_blabla_project/ui/widgets/inputs/location_picker.dart';


///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;


  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();

  
  
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    if (widget.initRidePref != null) {
      departure = widget.initRidePref?.departure;
      arrival = widget.initRidePref?.arrival;
      departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
      requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
    } else {
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  void switchLocations() {
  setState(() {
    final temp = departure;
    departure = arrival;
    arrival = temp;
  });
}
  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          departureDate = selectedDate;
        });
      }
    }); 
  }

  void openDeparturePicker() {
    showModalBottomSheet<Location>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return LocationPicker(
          selectedLocation: departure,
        );
      },
    ).then((location) {
      if (location != null) {
        setState(() => departure = location);
      }
    });
  }

  void openArrivalPicker() {
    showModalBottomSheet<Location>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return LocationPicker(
          selectedLocation: arrival,
        );
      },
    ).then((location) {
      if (location != null) {
        setState(() => arrival = location);
      }
    });
  }
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------

  // ----------------------------------
// Build the widgets
// ----------------------------------
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    
      children: [
        // Departure field
        
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.circle),
            hintText: departure?.name ?? "Toulouse",
            border: UnderlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.swap_vert_sharp),
              onPressed: switchLocations,
            ),
          ),
           onTap: openDeparturePicker,
        ),
        SizedBox(height: 15),
    
        // Arrival field
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.location_on),
            hintText: arrival?.name ?? "Paris",
            border: UnderlineInputBorder(),
          ),
           onTap: openArrivalPicker,
        ),
        SizedBox(height: 15),
    
        // Date field
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.calendar_today),
            hintText: DateFormat('EEE dd MMM').format(departureDate),
            border: UnderlineInputBorder(),
          ),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: departureDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  departureDate = selectedDate; 
                });
              }
            });
          },
        ),
        SizedBox(height: 16),
    
        // Seats field
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.people),
            hintText: "5",
            border: UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          initialValue: requestedSeats.toString(),
          onChanged: (value) {
            setState(() {
              requestedSeats = int.tryParse(value) ?? 1;
            });
          },
        ),
        SizedBox(height: 16),
    
        // Search button
        BlaButton(
          isPrimary: true,
          text: "Search",
          enable: true,
          onPressed: () {
            
          },
        ),
      ],
    ),
  );
}

}
