import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/constants/app_routes.dart';
import 'package:flutter_ecommerce/core/constants/app_strings.dart';
import 'package:flutter_ecommerce/features/favourite_quotes/presentation/view/favourite_quotes_view.dart';
import 'package:flutter_ecommerce/features/random_quote/presentation/view/quotes_view.dart';

final routes = {
  Routes.initalRoutes: (_) => const QuotesView(),
  Routes.favouriteQuotesRoutes: (_) => const FavouriteQuotesView(),
};

class AppRoutes {
  static Route? onGenratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initalRoutes:
        return MaterialPageRoute(
          builder: (context) => const QuotesView(),
        );
      case Routes.favouriteQuotesRoutes:
        return MaterialPageRoute(
          builder: (context) => const FavouriteQuotesView(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
