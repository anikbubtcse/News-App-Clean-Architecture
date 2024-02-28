import '../../../../core/failures.dart';
import '../entities/news_entity.dart';
import '../repositories/news_repositories.dart';
import 'package:fpdart/fpdart.dart';

class GetBreakingNewsUseCase {
  final NewsRepositories newsRepositories;

  GetBreakingNewsUseCase({required this.newsRepositories});

  Future<Either<Failure, NewsEntity>> call() async {
    return await newsRepositories.getBreakingNews();
  }
}
