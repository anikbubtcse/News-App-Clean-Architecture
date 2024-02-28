import 'package:fpdart/src/either.dart';
import 'package:news_app_clean_architecture/core/exceptions.dart';
import 'package:news_app_clean_architecture/core/failures.dart';
import 'package:news_app_clean_architecture/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:news_app_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:news_app_clean_architecture/features/news/domain/repositories/news_repositories.dart';

class NewsRepositoriesImpl extends NewsRepositories {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoriesImpl({required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, NewsEntity>> getAllNews() async {
    try {
      final result = await newsRemoteDataSource.getAllNews();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Opps! Server failed."));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getBreakingNews() async {
    try {
      final result = await newsRemoteDataSource.getBreakingNews();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Opps! Server failed."));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getPopularNews() async {
    try {
      final result = await newsRemoteDataSource.getPopularNews();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Opps! Server failed."));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getSportsNews() async {
    try {
      final result = await newsRemoteDataSource.getSportsNews();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(message: "Opps! Server failed."));
    }
  }
}
