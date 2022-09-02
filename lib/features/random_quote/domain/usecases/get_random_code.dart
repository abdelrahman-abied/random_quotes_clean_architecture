import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce/core/use_cases/usecase.dart';
import 'package:flutter_ecommerce/features/random_quote/domain/entities/quote.dart';
import 'package:flutter_ecommerce/features/random_quote/domain/repositories/quotes_repository.dart';

import '../../../../core/error/failure.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepo;

  GetRandomQuote({required this.quoteRepo});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepo.getRandomQuote();
}
