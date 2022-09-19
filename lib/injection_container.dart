import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/core/api/api_conusmer.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/random_quote/data/data_source/random_quote_local.dart';
import 'features/random_quote/data/data_source/random_quote_remote.dart';
import 'features/random_quote/data/model/quote_model.dart';
import 'features/random_quote/data/repositories/quote_repo_impl.dart';
import 'features/random_quote/domain/repositories/quotes_repository.dart';
import 'features/random_quote/domain/usecases/get_random_code.dart';
import 'features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/api/app_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features
  /// Bloc
  sl.registerFactory(() => RandomQuotesCubit(getRandomQuoteUseCase: sl()));

  ///use case
  sl.registerLazySingleton(() => GetRandomQuoteUseCase(quoteRepo: sl()));

  ///repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepoImpl(
        remoteQuote: sl(),
        localQuote: sl(),
        networkInfo: sl(),
      ));

  /// data source
  sl.registerLazySingleton<RandomQuoteRemote>(
      () => RandomQuoteRemoteImpl(client: sl()));
  sl.registerLazySingleton<RandomQuoteLocal>(
      () => RandomQuoteLocalImpl(sharedPreferences: sl()));

  /// Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  sl.registerLazySingleton(() => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  final sharedPregerence = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPregerence);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptor());
  if (kDebugMode) {
    sl.registerLazySingleton(() => LogInterceptor(
          responseBody: true,
          error: true,
          requestBody: true,
          request: true,
        ));
  }
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
