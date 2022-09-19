import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/shared/error_view.dart';
import '../../domain/entities/quote.dart';
import '../cubit/random_quote_cubit.dart';
import '../cubit/random_quotes_state.dart';
import '../widgets/quotes_contenct.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuotesView extends ConsumerStatefulWidget {
  const QuotesView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuotesViewState();
}

class _QuotesViewState extends ConsumerState<QuotesView> {
  @override
  void initState() {
    _getRandomQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: contentBody(),
      ),
    );
  }

  BlocBuilder<RandomQuotesCubit, RandomQuoteState> contentBody() {
    return BlocBuilder<RandomQuotesCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading) {
          return Center(
            child: SpinKitFadingCircle(color: AppColors.primary),
          );
        } else if (state is RandomQuoteError) {
          return ErrorView(onPress: () {});
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuotesContent(
                quote: state.quote,
              ),
            ],
          );
        }
        return ErrorView(onPress: () {});
      },
    );
  }

  _getRandomQuote() {
    BlocProvider.of<RandomQuotesCubit>(context).getRandomQuotes();
  }
}
