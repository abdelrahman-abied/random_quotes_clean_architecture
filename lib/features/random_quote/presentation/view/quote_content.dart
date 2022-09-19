import 'package:flutter/material.dart';

import '../../domain/entities/quote.dart';
import '../widgets/quotes_contenct.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
