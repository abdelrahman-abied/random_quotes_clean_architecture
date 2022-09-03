import 'package:flutter_ecommerce/core/constants/api_endpoints.dart';
import 'package:flutter_ecommerce/core/error/exceptions.dart';
import 'package:flutter_ecommerce/features/random_quote/data/model/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemote {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteImpl implements RandomQuoteRemote {
  final http.Client client;

  RandomQuoteRemoteImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async {
    try {
      final response = await client.get(
        Uri.parse(ApiEndpoint.randomQuote),
        headers: {"Content-type": "application/json"},
      );
      if (response.statusCode == 200) {
        return quoteFromJson(response.body)[0];
      } else {
        throw ServerException();
      }
    } on ServerException {
      throw ServerException();
    }
  }
}
