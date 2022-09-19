import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce/core/api/api_conusmer.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../model/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemote {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteImpl implements RandomQuoteRemote {
  // final http.Client client;

  // RandomQuoteRemoteImpl({required this.client});
  final ApiConsumer client;
  RandomQuoteRemoteImpl({required this.client});

  // @override
  // Future<QuoteModel> getRandomQuote() async {
  //   try {
  //     final response = await client.get(
  //       Uri.parse(ApiEndpoint.randomQuote),
  //       headers: {"Content-type": "application/json"},
  //     );
  //     if (response.statusCode == 200) {
  //       return quoteFromJson(response.body)[0];
  //     } else {
  //       throw ServerException();
  //     }
  //   } on ServerException {
  //     throw ServerException();
  //   }
  // }
  @override
  Future<QuoteModel> getRandomQuote() async {
    final Response response = await client.get(ApiEndpoint.randomQuote);

    return quoteFromJson(response.data)[0];
  }
}
