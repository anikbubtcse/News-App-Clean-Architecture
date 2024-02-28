import 'package:news_app_clean_architecture/features/news/domain/entities/news_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/failures.dart';

abstract class NewsRepositories {
  Future<Either<Failure, NewsEntity>> getAllNews();

  Future<Either<Failure, NewsEntity>> getPopularNews();

  Future<Either<Failure, NewsEntity>> getBreakingNews();

  Future<Either<Failure, NewsEntity>> getSportsNews();
}
