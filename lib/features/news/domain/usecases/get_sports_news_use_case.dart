import '../../../../core/failures.dart';
import '../entities/news_entity.dart';
import '../repositories/news_repositories.dart';
import 'package:fpdart/fpdart.dart';

class GetSportsNewsUseCase {
  final NewsRepositories newsRepositories;

  GetSportsNewsUseCase({required this.newsRepositories});

  Future<Either<Failure, NewsEntity>> call() async {
    return await newsRepositories.getSportsNews();
  }
}
