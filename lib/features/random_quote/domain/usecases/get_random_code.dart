import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quotes_repository.dart';

import '../../../../core/error/failure.dart';

class GetRandomQuoteUseCase implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepo;

  GetRandomQuoteUseCase({required this.quoteRepo});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepo.getRandomQuote();
}
