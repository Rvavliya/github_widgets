// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/utils/permistion/permistion_handaler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  State<UserCurrentLocation> createState() => UserCurrentLocationState();
}

class UserCurrentLocationState extends State<UserCurrentLocation>
    with WidgetsBindingObserver {
  bool isDialogShown = false;
  GoogleMapController? _googleMapController;
  // Position? _currentPosition;
  LocationData? _locationData;
  bool _permissionGranted = false;
  final bool _permissionPermanentlyDenied = false;
  @override
  void initState() {
    super.initState();
    GetPermistion.checkLocationPermission();
    WidgetsBinding.instance.addObserver(this);
    // _checkLocationPermission();
    _checkPermission();
    _getLocation();
  }

  /// check location permistion
  // void _checkLocationPermission() async {
  //   PermissionStatus status = await Permission.location.status;
  //   if (status == PermissionStatus.granted) {
  //     _getCurrentLocation();
  //   } else {
  //     await GetPermistion.checkLocationPermission();
  //   }
  // }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _googleMapController = controller;
    });
  }

  /// get current latitude and longitude
  // void _getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition();
  //   setState(() {
  //     _currentPosition = position;
  //   });
  // }

  /// add google api key in manifacet and info.plist
  Future<void> _getLocation() async {
    try {
      var location = Location();
      LocationData currentLocation = await location.getLocation();

      setState(() {
        _locationData = currentLocation;
      });
    } catch (e) {
      log("Error getting location: $e");
    }
  }

  Future<void> _checkPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      _permissionGranted = true;
      _getLocation();
    } else if (status.isPermanentlyDenied) {
      // _permissionPermanentlyDenied = true;
      openAppSettings();
      // Handle permanent denial (show a message or navigate to settings)
    } else {
      _permissionGranted = false;
      await Permission.location.request();
      status = await Permission.location.status;
      if (status.isGranted) {
        _permissionGranted = true;
        _getLocation();
      }
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // if(state == AppLifecycleState.)
    // print("----$state");
    if (state == AppLifecycleState.resumed) {
      if (!isDialogShown) {
        isDialogShown = true;
      }
      // print("Lifecycle: Resumed");
      // await Future.delayed(const Duration(milliseconds: 200));
    }
    // if (state == AppLifecycleState.paused) {
    //   print("Lifecycle: Paused");
    // }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("User Current Location"),
        ),
        body: GoogleMap(
          // liteModeEnabled: true, /// liteModeEnabled is use if you can not give change maps form the user.
          fortyFiveDegreeImageryEnabled: true,

          /// myLocationEnabled is use if you can show your current location.
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          // mapType: MapType.hybrid,  /// chaneg map types
          // compassEnabled: true,
          myLocationButtonEnabled: true,
          tiltGesturesEnabled: true,
          trafficEnabled: true,
          zoomControlsEnabled: false,
          buildingsEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                _locationData?.latitude ?? 0, _locationData?.longitude ?? 0),
            zoom: 15.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('user_location'),
              position: LatLng(
                  _locationData?.latitude ?? 0, _locationData?.longitude ?? 0),
              infoWindow: const InfoWindow(title: 'Your Location'),
            ),
          },
        ));
  }

  Future<void> checkPermission() async {
    if (await GetPermistion.checkLocationPermission() == false) {
      log('hello');
      await showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            title: const Text("Location Permission"),
            content: const Text(
                "Grant access to your location services to use the app."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  openAppSettings();
                },
                child: const Text('Open App Settings'),
              ),
            ],
          );
        },
      );
    }
    isDialogShown = false;
  }
}
