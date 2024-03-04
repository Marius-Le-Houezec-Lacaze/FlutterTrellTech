import 'package:flutter/material.dart';

import '../features/organization/presentation/pages/organization.dart';

class AuthenticatedAppRoutes {
  static Route onGenerateRoutes(RouteSettings settings)  {
    switch (settings.name) {
      case '/':
        return _materialRoute( Organization());
      default:
        return _materialRoute( Organization());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}