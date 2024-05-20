import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class GetPermistion {
  static PermissionStatus? locationPermissionStatus;

  /// reqvest to get location permistion
  // static Future<bool> checkLocationPermission() async {
  //   // Check for location permission
  //   var status = await Permission.location.status;

  //   if (status == PermissionStatus.granted) {
  //     log("Permission already granted");
  //     return true;
  //   } else {
  //     log("Request permission");
  //     var requestStatus = await Permission.location.request();

  //     if (requestStatus == PermissionStatus.granted) {
  //       return true;
  //     } else {
  //       log("Permission denied");
  //       return false;
  //     }
  //   }
  // }

  static Future<bool> checkLocationPermission() async {
    try {
      locationPermissionStatus ??= await Permission.location.status;

      if (locationPermissionStatus == PermissionStatus.granted) {
        log("Permission already granted");
        return true;
      } else {
        var requestStatus = await Permission.location.request();

        if (requestStatus == PermissionStatus.granted) {
          locationPermissionStatus = PermissionStatus.granted;
          return true;
        } else if (requestStatus.isDenied) {
          // No need to request again, as it's already requested above.
          locationPermissionStatus = PermissionStatus.denied;
          return false;
        } else if (requestStatus.isPermanentlyDenied) {
          log("Permission permanently denied. Please enable it in app settings.");
          locationPermissionStatus = PermissionStatus.permanentlyDenied;
          return false;
        } else {
          log("Permission request failed");
          locationPermissionStatus = PermissionStatus.denied;
          return false;
        }
      }
    } catch (e) {
      // Handle the specific exception related to denied location permission.
      log("Error: User denied location permission");
      locationPermissionStatus = PermissionStatus.denied;
      return false;
    }
  }
}
