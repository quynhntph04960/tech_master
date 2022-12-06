import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemLifecycleListener {
  static SystemLifecycleListener instance = SystemLifecycleListener();

  final _callbacks = Set<AppLifecycleCallback>();

  void _invokeCallbacks(AppLifecycle lifecycle) {
    for (final callback in _callbacks) {
      callback(lifecycle);
    }
  }

  void addCallback(AppLifecycleCallback callback) {
    _callbacks.add(callback);
  }

  void removeCallback(AppLifecycleCallback callback) {
    _callbacks.remove(callback);
  }

  SystemLifecycleListener() {
    setHandler();
  }

  void setHandler() {
    SystemChannels.lifecycle.setMessageHandler((message) async {
      if (message.toString() == AppLifecycleState.resumed.toString()) {
        _invokeCallbacks(AppLifecycle.onResume);
      } else if (message.toString() == AppLifecycleState.paused.toString()) {
        _invokeCallbacks(AppLifecycle.onPause);
      } else if (message.toString() == AppLifecycleState.inactive.toString()) {
        _invokeCallbacks(AppLifecycle.onInactive);
      }
    });
  }
}

enum AppLifecycle { onPause, onResume, onInactive }

typedef AppLifecycleCallback = void Function(AppLifecycle lifecycle);
