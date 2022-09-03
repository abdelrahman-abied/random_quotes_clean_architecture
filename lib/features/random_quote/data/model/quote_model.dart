import '../../domain/entities/quote.dart';
import 'dart:convert';

List<QuoteModel> quoteFromJson(String str) =>
    List<QuoteModel>.from(json.decode(str).map((x) => QuoteModel.fromJson(x)));

String quoteToMap(List<QuoteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteModel extends Quote {
  const QuoteModel({
    required super.author,
    required super.id,
    required super.content,
    required super.permalink,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        content: json["quote"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "quote": content,
        "permalink": permalink,
      };
}
