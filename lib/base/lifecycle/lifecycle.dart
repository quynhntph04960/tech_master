import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../main.dart';
import 'system_lifecycle_listener.dart';

abstract class LifecycleState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void initState() {
    super.initState();

    SystemLifecycleListener.instance.addCallback(handleLifecycleCallback);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      onFirstFrame();
    });
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    SystemLifecycleListener.instance.removeCallback(handleLifecycleCallback);
    super.dispose();
  }

  void handleLifecycleCallback(AppLifecycle lifecycle) {
    if (lifecycle == AppLifecycle.onResume) {
      onResume();
    } else if (lifecycle == AppLifecycle.onPause) {
      onPause();
    }
  }

  void onResume() {}

  void onPause() {}

  void onFirstFrame() {}

  @override
  void didPopNext() {
    super.didPopNext();

    // SystemLifecycleListener.instance.addCallback(handleLifecycleCallback);
    // hideKeyboard();
    // onResume();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    // SystemLifecycleListener.instance.removeCallback(handleLifecycleCallback);
    // hideKeyboard();
    // onPause();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPush() {
    super.didPush();
  }
}
