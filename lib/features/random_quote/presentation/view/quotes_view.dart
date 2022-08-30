import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/constants/app_routes.dart';
import 'package:flutter_ecommerce/core/constants/constants.dart';
import 'package:flutter_ecommerce/core/utils/image_manager.dart';
import 'package:flutter_ecommerce/features/favourite_quotes/presentation/view/favourite_quotes_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesView extends ConsumerStatefulWidget {
  const QuotesView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuotesViewState();
}

class _QuotesViewState extends ConsumerState<QuotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => Constants.showToast(msg: "name"),
          // Navigator.pushNamed(context, Routes.favouriteQuotesRoutes),
          child: const Text(
            "Facebook",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
