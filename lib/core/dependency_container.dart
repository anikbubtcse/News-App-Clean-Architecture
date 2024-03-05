import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/core/log.dart';
import 'package:news_app_clean_architecture/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:news_app_clean_architecture/features/news/domain/usecases/get_all_news_use_case.dart';
import 'package:news_app_clean_architecture/features/news/domain/usecases/get_breaking_news_use_case.dart';
import 'package:news_app_clean_architecture/features/news/domain/usecases/get_popular_news_use_case.dart';
import 'package:news_app_clean_architecture/features/news/domain/usecases/get_sports_news_use_case.dart';
import 'package:news_app_clean_architecture/features/news/presentation/bloc/news_bloc.dart';
import 'package:http/http.dart' as http;

import '../features/news/data/repositories/news_repositories_impl.dart';
import '../features/news/domain/repositories/news_repositories.dart';

final locator = GetIt.instance;

void setupLocator() {
  //bloc

  locator.registerFactory(() => NewsBloc(
      getAllNewsUseCase: locator(),
      getPopularNewsUseCase: locator(),
      getBreakingNewsUseCase: locator(),
      getSportsNewsUseCase: locator()));

  //usecase

  locator.registerLazySingleton(
      () => GetAllNewsUseCase(newsRepositories: locator()));
  locator.registerLazySingleton(
      () => GetBreakingNewsUseCase(newsRepositories: locator()));
  locator.registerLazySingleton(
      () => GetPopularNewsUseCase(newsRepositories: locator()));
  locator.registerLazySingleton(
      () => GetSportsNewsUseCase(newsRepositories: locator()));

  //repository

  locator.registerLazySingleton<NewsRepositories>(
      () => NewsRepositoriesImpl(newsRemoteDataSource: locator()));

  //datasource

  locator.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: locator(), log: locator()));

  //core

  locator.registerLazySingleton<Log>(() => LogImpl());

  //external

  locator.registerLazySingleton(() => http.Client());
}
