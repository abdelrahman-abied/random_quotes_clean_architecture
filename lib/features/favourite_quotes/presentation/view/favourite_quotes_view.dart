import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';

class FavouriteQuotesView extends ConsumerStatefulWidget {
  const FavouriteQuotesView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteQuotesViewState();
}

class _FavouriteQuotesViewState extends ConsumerState<FavouriteQuotesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
            onTap: () => Constants.showErrorDialog(
                context: context, msg: "Error Happened"),
            child: Text("data")),
      ),
    );
  }
}
