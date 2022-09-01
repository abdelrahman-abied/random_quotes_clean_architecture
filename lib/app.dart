import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/constants/app_strings.dart';
import 'package:flutter_ecommerce/features/random_quote/presentation/view/quotes_view.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: appTheme(),
      // initialRoute: Routes.initalRoutes,
      // routes: routes,

      home: const QuotesView(),
      // onGenerateRoute: AppRoutes.onGenratedRoute,
    );
  }
}
