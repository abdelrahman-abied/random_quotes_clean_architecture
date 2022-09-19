import 'dart:convert';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exceptions.dart';
import '../model/quote_model.dart';
import '../../domain/entities/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocal {
  Future<Quote> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalImpl implements RandomQuoteLocal {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        Constants.cachedQuoteKey, json.encode(quoteModel));
  }

  @override
  Future<QuoteModel> getLastRandomQuote() async {
    final jsonString = sharedPreferences.getString(Constants.cachedQuoteKey);
    if (jsonString != null) {
      final cacheRandomQuote = QuoteModel.fromJson(json.decode(jsonString));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
