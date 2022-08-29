import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/image_manager.dart';
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
        child: Image.asset(ImageAssets.ministry),
      ),
    );
  }
}
