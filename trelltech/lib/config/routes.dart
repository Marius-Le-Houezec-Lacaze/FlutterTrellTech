import 'package:flutter/material.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';
import 'package:trelltech/features/boards/presentation/pages/boards.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings)  {
    switch (settings.name) {
      case '/':
        return _materialRoute(Auth());
      case '/organization':
        return _materialRoute(Organization());
      case '/boards':
        return _materialRoute(Boards());
      default:
        return _materialRoute(Auth());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}