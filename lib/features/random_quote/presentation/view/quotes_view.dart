import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/constants/app_strings.dart';
import 'package:flutter_ecommerce/features/random_quote/domain/entities/quote.dart';
import 'package:flutter_ecommerce/features/random_quote/presentation/widgets/quotes_contenct.dart';
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
      body: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: Column(
          children: const [
            QuotesContent(
              quote: Quote(
                author: "author",
                id: 1,
                content: "content",
                permalink: "permalink",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
