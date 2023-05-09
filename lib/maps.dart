import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

bool _isEventFormVisible = false;
bool _isCurrentLocation = false;
DateTime _selectedDate = DateTime.now();
final TextEditingController _dateController = TextEditingController();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // Define a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  // Define a TextEditingController to get the text input from the form
  final TextEditingController _eventController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enregistrer un événement',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _eventController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer un événement';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Entrer le nom',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       _registerEvent();
                  //     }
                  //   },
                  //   child: const Text('Enregistrer un événement'),
                  // ),
                ],
              ),
            ),
          ),
          Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Visibility(
      visible: _isEventFormVisible,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date début',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date fin',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                maxLines: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Position actuelle'),
                Radio(
                  value: true,
                  groupValue: _isCurrentLocation,
                  onChanged: (value) {
                    setState(() {
                      _isCurrentLocation = value as bool;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ajouter des photos"),
                IconButton(
                  onPressed: () {
                    // TODO: Add photo upload functionality
                  },
                  icon: const Icon(Icons.photo),
                  tooltip: 'Add photo',
                ),
                  ],
                )
          ],
        ),
      ),
    ),
    FloatingActionButton.extended(
      onPressed: _registerEventDetails,
      label: const Text('Register'),
      icon: const Icon(Icons.event),
    ),
  ],
),

        ],
      ),
      
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

void _registerEvent() async {
  final LatLng currentLocation = _kGooglePlex.target;
  final String eventName = _eventController.text;
  final String url = 'https://example.com/register-event';
  print("register Event" + currentLocation.toString() + eventName.toString() + url.toString());
  // final response = await http.post(
  //   Uri.parse(url),
  //   body: {
  //     'latitude': currentLocation.latitude.toString(),
  //     'longitude': currentLocation.longitude.toString(),
  //     'event_name': eventName,
  //   },
  // );
  // if (response.statusCode == 200) {
  //   // Event registered successfully
  // } else {
  //   // Error registering the event
  // }
}

void _registerEventDetails() {
  // Save the event details here
  setState(() {
    _isEventFormVisible = !_isEventFormVisible;
  });
}
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != _selectedDate)
    setState(() {
      _selectedDate = picked;
      _dateController.text = picked.toString();
    });
}


}
