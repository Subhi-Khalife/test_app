import 'package:dartz/dartz.dart';
import 'package:test_app/common/unified_api/handling_exception.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/domain/core/failures.dart';
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories.dart';

class HomeScreenRepositoriesImpl implements HomeScreenRepositories {
  final GetTopRepositoriesRemote getTopRepositoriesRemote;
  HomeScreenRepositoriesImpl({required this.getTopRepositoriesRemote});
  @override
  Future<Either<Failure, List<Repository>>> getTopRepositories(
      GetTopRepositoriesParams params) async {
    return await HandlingExceptionManager.wrapHandling(tryCall: () async {
      final model = await getTopRepositoriesRemote.send(params);
      return Right(model);
    });
  }
}
