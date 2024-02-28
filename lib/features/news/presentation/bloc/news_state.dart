part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsError extends NewsState {
  final String message;

  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}

class NewsLoaded extends NewsState {
  final NewsEntity newsEntity;

  const NewsLoaded({required this.newsEntity});

  @override
  List<Object> get props => [newsEntity];
}
