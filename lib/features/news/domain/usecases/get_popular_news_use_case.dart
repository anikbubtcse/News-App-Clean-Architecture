import '../../../../core/failures.dart';
import '../entities/news_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/news_repositories.dart';

class GetPopularNewsUseCase {
  final NewsRepositories newsRepositories;

  GetPopularNewsUseCase({required this.newsRepositories});

  Future<Either<Failure, NewsEntity>> call() async {
    return await newsRepositories.getPopularNews();
  }
}
