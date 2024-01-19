import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart';
import 'package:test_app/infrastructure/home/dto/repository_dto.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories_impl.dart';

import 'home_screen_repositories_impl_test.mocks.dart';

@GenerateMocks([GetTopRepositoriesRemote])
void main() {
  late HomeScreenRepositoriesImpl repositories;
  late MockGetTopRepositoriesRemote mockGetTopRepositoriesRemote;

  setUp(() {
    mockGetTopRepositoriesRemote = MockGetTopRepositoriesRemote();
    repositories =
        HomeScreenRepositoriesImpl(getTopRepositoriesRemote: mockGetTopRepositoriesRemote);
  });

  group("description", () {
    final model = List<Repository>.of([])..addAll([RepositoryDto().convertToDomain()]);
    test(
      'Should return List<Repository> type when the data source is successful',
      () async {
        when(mockGetTopRepositoriesRemote.send(any)).thenAnswer((realInvocation) async => model);
        final result =
            await repositories.getTopRepositories(GetTopRepositoriesParams(pageNumber: 1));
        verify(mockGetTopRepositoriesRemote.send(any)).called(1);
        expect(result, Right(model));
      },
    );

    test(
      'Should return Failure when the data source throw exception',
      () async {
        when(mockGetTopRepositoriesRemote.send(any)).thenThrow(Exception());
        final result =
            await repositories.getTopRepositories(GetTopRepositoriesParams(pageNumber: 1));
        verify(mockGetTopRepositoriesRemote.send(any)).called(1);
        expect(result, isA<Left>());
      },
    );
  });
}
