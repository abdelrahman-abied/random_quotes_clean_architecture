import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/utils/media_query_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/quote.dart';

class QuotesContent extends ConsumerStatefulWidget {
  final Quote quote;
  const QuotesContent({Key? key, required this.quote}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuotesContentState();
}

class _QuotesContentState extends ConsumerState<QuotesContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: context.width,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(widget.quote.content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(widget.quote.author,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
