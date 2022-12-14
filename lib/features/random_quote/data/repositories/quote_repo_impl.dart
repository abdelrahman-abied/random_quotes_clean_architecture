import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quotes_repository.dart';
import '../data_source/random_quote_local.dart';
import '../data_source/random_quote_remote.dart';

class QuoteRepoImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemote remoteQuote;
  final RandomQuoteLocal localQuote;

  QuoteRepoImpl({
    required this.remoteQuote,
    required this.localQuote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final remoteRandomQuotes = await remoteQuote.getRandomQuote();
        // When [isConnected] true cache data to local
        localQuote.cacheQuote(remoteRandomQuotes);
        return Right(remoteRandomQuotes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheQuotes = await localQuote.getLastRandomQuote();
        return Right(cacheQuotes);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
