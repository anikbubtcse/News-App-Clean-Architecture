part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class AllNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class BreakingNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class PopularNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class SportsNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
