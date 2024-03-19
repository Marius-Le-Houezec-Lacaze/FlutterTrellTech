import 'package:flutter/material.dart';
import 'package:trelltech/features/auth/presentation/pages/auth.dart';
import 'package:trelltech/features/boards/presentation/pages/boards_index.dart';
import 'package:trelltech/features/organization/presentation/pages/organization.dart';
import 'package:trelltech/features/shared/presentation/pages/app.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings)  {
    switch (settings.name) {
      case '/':
        return _materialRoute(Auth());
      case '/app':
        return _materialRoute(App());
        case '/boards':
        // return _materialRoute(const Boards());
      default:
        return _materialRoute(Auth());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}