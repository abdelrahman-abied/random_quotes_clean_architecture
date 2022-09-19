

// final randomQuote = ChangeNotifierProvider<RandomQuote>(
//   (ref) => RandomQuote(
//     getRandomQuoteUseCase: GetRandomQuote(
//       quoteRepo: QuoteRepoImpl(
//         localQuote: RandomQuoteLocalImpl(
//             sharedPreferences: SharedPreferences.getInstance()),
//         networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
//         remoteQuote: RandomQuoteRemoteImpl(client: Client()),
//       ),
//     ),
//   ),
// );

// class RandomQuote with ChangeNotifier {
//   final GetRandomQuote getRandomQuoteUseCase;
//   late Quote quote;
//   RandomQuote({required this.getRandomQuoteUseCase});
//   late Either<Failure, Quote> response;
//   Future<void> getRandomQuote() async {
//     response = await getRandomQuoteUseCase(NoParams());
//     response.fold(
//       (failure) => mapFailure(failure),
//       (quotes) => emitQuoteState(quotes),
//     );
//   }

//   String mapFailure(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return AppStrings.serverFailure;
//       case CacheFailure:
//         return AppStrings.cacheFailure;
//       default:
//         return AppStrings.unexpectedError;
//     }
//   }

//   emitQuoteState(Quote quotes) {
//     quote = quotes;
//     notifyListeners();
//   }
// }
