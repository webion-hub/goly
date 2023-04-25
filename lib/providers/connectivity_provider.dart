import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectivityProvider extends ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  Timer? _timer;

  ConnectivityProvider() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    try {
      final response = await http.get(Uri.parse('https://example.com'));
      final bool previousConnectionStatus = _isConnected;
      _isConnected = (response.statusCode == 200);

      if (previousConnectionStatus != _isConnected) {
        notifyListeners();
      }
    } catch (_) {
      if (_isConnected) {
        _isConnected = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}