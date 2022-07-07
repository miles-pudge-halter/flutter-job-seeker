import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:job_seeker/Constants.dart';

import '../../../shared/buttons.dart';

class JobTab extends StatelessWidget {
  JobTab({Key? key}) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: double.infinity,
                  height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        buildingsEnabled: false,
                        zoomControlsEnabled: false,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
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
                SizedBox(height: 30),
                Text(
                  'Choose your location',
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 20),
                _buildAddressLayout('757 Ramblewood, Brox, NY, 10457')
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Container(
              height: 50,
              child: NFQPrimaryButton('Search by location', () {}),
            ),
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
