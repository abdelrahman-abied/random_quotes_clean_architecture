import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/usecase.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_random_code.dart';
import 'random_quotes_state.dart';

class RandomQuotesCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;
  RandomQuotesCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteIntial());
  Future<void> getRandomQuotes() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(
      response.fold(
        (failure) => RandomQuoteError(_mapFailureToMessage(failure)),
        (quote) => RandomQuoteLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
