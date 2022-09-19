import 'package:flutter/material.dart';
import 'core/constants/app_strings.dart';
import 'features/random_quote/presentation/view/quotes_view.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      // initialRoute: Routes.initalRoutes,
      // routes: routes,

      onGenerateRoute: AppRoutes.onGenratedRoute,
    );
  }
}
