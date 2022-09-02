import 'package:equatable/equatable.dart';

// class Quote extends Equatable {
//   final String author;
//   final int id;
//   final String content;
//   final String permalink;

//   const Quote(
//       {required this.author,
//       required this.id,
//       required this.content,
//       required this.permalink});

//   @override
//   List<Object?> get props => [author, id, content, permalink];
// }
class Quote extends Equatable {
  const Quote({
    required this.author,
    required this.id,
    required this.content,
    required this.permalink,
  });

  final String author;
  final int id;
  final String content;
  final String permalink;

  @override
  List<Object?> get props => [id, author, content, permalink];
}
