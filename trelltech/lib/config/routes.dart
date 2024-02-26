


import 'package:flutter/material.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute( Auth());
      default:
        return _materialRoute( Auth());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}