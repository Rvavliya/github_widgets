import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  final Connectivity _connectivity = Connectivity();
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;

  ConnectivityCubit() : super(ConnectivityResult.wifi) {
    _connectivity.checkConnectivity().then(emit);
    _connectivity.onConnectivityChanged.listen(emit);
  }

  bool get isConnected =>
      state == ConnectivityResult.wifi || state == ConnectivityResult.mobile;

  void chcekConnectivity(ConnectivityResult result, BuildContext context) {
    if (result != ConnectivityResult.none) {
      {
        if (overlayEntry != null) {
          overlayEntry?.remove();
          overlayEntry = null;
        }
        emit(ConnectivityResult.mobile);
      }
    } else {
      showOverlay(context);
      emit(ConnectivityResult.none);
    }
  }

  showOverlay(BuildContext context) {
    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 110.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Material(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.sizeOf(context).width - 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200.withOpacity(0.5),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                      child: const Text(
                        'No Internet Connection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    overlayState?.insert(overlayEntry!);
  }
}
