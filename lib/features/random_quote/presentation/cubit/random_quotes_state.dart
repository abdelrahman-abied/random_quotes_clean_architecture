import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/quote.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();
  @override
  List<Object> get props => [];
}

class RandomQuoteIntial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  RandomQuoteLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String errorMessage;

  RandomQuoteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
