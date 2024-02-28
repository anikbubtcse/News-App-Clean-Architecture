import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/news_entity.dart';
import '../../domain/usecases/get_all_news_use_case.dart';
import '../../domain/usecases/get_breaking_news_use_case.dart';
import '../../domain/usecases/get_popular_news_use_case.dart';
import '../../domain/usecases/get_sports_news_use_case.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetAllNewsUseCase getAllNewsUseCase;
  final GetPopularNewsUseCase getPopularNewsUseCase;
  final GetSportsNewsUseCase getSportsNewsUseCase;
  final GetBreakingNewsUseCase getBreakingNewsUseCase;

  NewsBloc(
      {required this.getAllNewsUseCase,
      required this.getPopularNewsUseCase,
      required this.getBreakingNewsUseCase,
      required this.getSportsNewsUseCase})
      : super(NewsInitial()) {
    on<AllNewsEvent>(_onAllNewsEvent);
    on<BreakingNewsEvent>(_onBreakingNewsEvent);
    on<PopularNewsEvent>(_onPopularNewsEvent);
    on<SportsNewsEvent>(_onSportsNewsEvent);
  }

  _onAllNewsEvent(AllNewsEvent event, Emitter<NewsState> state) async {
    emit(NewsLoading());

    final data = await getAllNewsUseCase.call();

    data.fold((l) {
      emit(NewsError(message: l.message));
    }, (r) {
      emit(NewsLoaded(newsEntity: r));
    });
  }

  _onBreakingNewsEvent(
      BreakingNewsEvent event, Emitter<NewsState> state) async {
    emit(NewsLoading());

    final data = await getBreakingNewsUseCase.call();

    data.fold((l) {
      emit(NewsError(message: l.message));
    }, (r) {
      emit(NewsLoaded(newsEntity: r));
    });
  }

  _onPopularNewsEvent(PopularNewsEvent event, Emitter<NewsState> state) async {
    emit(NewsLoading());

    final data = await getPopularNewsUseCase.call();

    data.fold((l) {
      emit(NewsError(message: l.message));
    }, (r) {
      emit(NewsLoaded(newsEntity: r));
    });
  }

  _onSportsNewsEvent(SportsNewsEvent event, Emitter<NewsState> state) async {
    emit(NewsLoading());

    final data = await getSportsNewsUseCase.call();

    data.fold((l) {
      emit(NewsError(message: l.message));
    }, (r) {
      emit(NewsLoaded(newsEntity: r));
    });
  }
}
