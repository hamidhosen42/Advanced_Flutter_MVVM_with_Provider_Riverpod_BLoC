import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) {
    return navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => widget));
  }

  navigateReplace(Widget widget) {
    return navigatorKey.currentState
        ?.pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  Future<void> showDialog(Widget widget) async {
    await showAdaptiveDialog(
        barrierDismissible: true,
        context: navigatorKey.currentContext!,
        builder: (context) => widget);
  }

  void showSnackbar() {
    final context = navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

    const snakbarWidget = SnackBar(
        content: Text(
      "Hello Hamid",
      style: TextStyle(color: Colors.white),
    ));

    ScaffoldMessenger.of(context).showSnackBar(snakbarWidget);
  }
}