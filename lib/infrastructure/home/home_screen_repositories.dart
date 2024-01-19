import 'package:dartz/dartz.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/domain/core/failures.dart';
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart';

abstract class HomeScreenRepositories {
  Future<Either<Failure, List<Repository>>> getTopRepositories(GetTopRepositoriesParams params);
}
