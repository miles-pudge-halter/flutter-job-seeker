import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:job_seeker/Constants.dart';

import '../../../../shared/buttons.dart';

class JobTab extends StatefulWidget {
  const JobTab({Key? key}) : super(key: key);

  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> {
  final Completer<GoogleMapController> _controller = Completer();
  Timer? _debounce;

  String? address;

  String? _mapStyle;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition? currentLocation = null;

  CameraPosition? mapCenter = null;

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var location = await Geolocator.getCurrentPosition();
    currentLocation = CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 15,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentLocation!));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void updateMapController(GoogleMapController controller) async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
  }

  void updateMapCenterPosition(CameraPosition position) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      mapCenter = position;
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.target.latitude, position.target.longitude);
      print(placemarks.toString());
      if (placemarks.isNotEmpty) {
        setState(() {
          address = placemarks.first.country;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 100,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    buildingsEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: currentLocation ?? _kGooglePlex,
                    onMapCreated: updateMapController,
                    onCameraMove: updateMapCenterPosition,
                  ),
                  Positioned(
                    child: Icon(
                      Icons.location_pin,
                      color: ThemeColor().yellow,
                      size: 50,
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 30),
              Text(
                'Choose your location',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 20),
              _buildAddressLayout(address ?? ''),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                child: NFQPrimaryButton('Search by location', () {
                  Get.toNamed('/job/list', arguments: {'country': address, 'keyword': null});
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildAddressLayout(String address) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.location_pin,
                size: 30,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                address,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
