// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class ConnectivityProvider extends ChangeNotifier {
//   bool _isConnected = true;
//   bool get isConnected => _isConnected;

//   StreamSubscription<ConnectivityResult>? _subscription;

//   ConnectivityProvider() {
//     _subscription = Connectivity().onConnectivityChanged.listen((result) {
//       _isConnected = (result != ConnectivityResult.none);
//       notifyListeners();
//     });
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
// }
