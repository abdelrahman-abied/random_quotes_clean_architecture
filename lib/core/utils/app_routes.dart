import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_routes.dart';
import '../constants/app_strings.dart';
import '../../features/favourite_quotes/presentation/view/favourite_quotes_view.dart';
import '../../features/random_quote/presentation/cubit/random_quote_cubit.dart';
import '../../features/random_quote/presentation/view/quotes_view.dart';
import '../../injection_container.dart' as di;

final routes = {
  Routes.initialRoute: (_) => const QuotesView(),
};

class AppRoutes {
  static Route? onGenratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<RandomQuotesCubit>(),
            child: QuotesView(),
          ),
        );
      // case Routes.favouriteQuotesRoutes:
      //   return MaterialPageRoute(
      //     builder: (context) => const FavouriteQuotesView(),
      //   );
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
