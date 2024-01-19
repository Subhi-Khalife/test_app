import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/application/home/home_bloc.dart';
import 'package:test_app/common/helper.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/domain/core/failures.dart';
import 'package:test_app/infrastructure/home/dto/repository_dto.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories_impl.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeScreenRepositories, HomeScreenRepositoriesImpl])
void main() {
  late HomeBloc homeBloc;
  late MockHomeScreenRepositoriesImpl mockHomeScreenRepositoriesImpl;

  setUp(() {
    mockHomeScreenRepositoriesImpl = MockHomeScreenRepositoriesImpl();
    homeBloc = HomeBloc(homeScreenRepositories: mockHomeScreenRepositoriesImpl);
  });

  tearDown(() {
    homeBloc.close();
  });
  test('initial state is correct', () {
    expect(homeBloc.state, const HomeState());
  });

  group('Get Home Screen Top Repositories Event', () {
    List<Repository> expectedList = [RepositoryDto().convertToDomain()];
    final expectedSuccessResponse = [
      const HomeState(getHomeInfoStatus: GetHomeInfoStatus.loading, repositories: []),
      HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.success,
          hasReachedMax: true,
          repositories: expectedList),
    ];

    blocTest('emit success with reached max',
        build: () => homeBloc,
        act: (HomeBloc bloc) => bloc.add(GetHomeScreenTopRepositoriesEvent()),
        expect: () => expectedSuccessResponse,
        setUp: () {
          when(mockHomeScreenRepositoriesImpl.getTopRepositories(any))
              .thenAnswer((realInvocation) async => Future.value(Right(expectedList)));
        },
        verify: (_) => verify(mockHomeScreenRepositoriesImpl.getTopRepositories(any)).called(1));

    final expectedPaginationList = List<Repository>.generate(
        DesignHelper.maxPaginationNumber, (index) => RepositoryDto().convertToDomain());
    final expectedPaginationStates = [
      const HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.loading, repositories: [], hasReachedMax: false),
      HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.success,
          repositories: expectedPaginationList,
          hasReachedMax: false),
      HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.loading,
          repositories: expectedPaginationList,
          hasReachedMax: false),
      HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.success,
          repositories: List.of(expectedPaginationList)..addAll(expectedPaginationList),
          hasReachedMax: false),
    ];

    blocTest(
      'testing pagination',
      build: () => homeBloc,
      act: (HomeBloc bloc) async {
        bloc.add(GetHomeScreenTopRepositoriesEvent());
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(GetHomeScreenTopRepositoriesEvent());
      },
      expect: () => expectedPaginationStates,
      setUp: () {
        when(mockHomeScreenRepositoriesImpl.getTopRepositories(any))
            .thenAnswer((_) async => Right(expectedPaginationList));
      },
      verify: (bloc) {
        verify(mockHomeScreenRepositoriesImpl.getTopRepositories(any)).called(2);
      },
    );

    final expectedFailedStates = [
      const HomeState(getHomeInfoStatus: GetHomeInfoStatus.loading),
      const HomeState(getHomeInfoStatus: GetHomeInfoStatus.failed)
    ];
    blocTest(
      'testing failed',
      build: () => homeBloc,
      act: (HomeBloc bloc) async {
        bloc.add(GetHomeScreenTopRepositoriesEvent());
      },
      expect: () => expectedFailedStates,
      setUp: () {
        when(mockHomeScreenRepositoriesImpl.getTopRepositories(any))
            .thenAnswer((_) async => Left(ServerFailure()));
      },
      verify: (bloc) {
        verify(mockHomeScreenRepositoriesImpl.getTopRepositories(any)).called(1);
      },
    );

    final newList = List<Repository>.generate(
        DesignHelper.maxPaginationNumber, (index) => RepositoryDto().convertToDomain());
    newList.removeAt(0);
    final expectedPaginationStatesWhenReachedMax = [
      const HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.loading, repositories: [], hasReachedMax: false),
      HomeState(
          getHomeInfoStatus: GetHomeInfoStatus.success, repositories: newList, hasReachedMax: true),
    ];
    // List<Either<Failure, List<Repository>>> expectAnswer = [
    //   Right(expectedPaginationList),
    // ];
    blocTest(
      'when reached max will not call api',
      build: () => homeBloc,
      act: (HomeBloc bloc) async {
        bloc.add(GetHomeScreenTopRepositoriesEvent());
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(GetHomeScreenTopRepositoriesEvent());
        await Future.delayed(const Duration(seconds: 1));
        bloc.add(GetHomeScreenTopRepositoriesEvent());
      },
      expect: () => expectedPaginationStatesWhenReachedMax,
      setUp: () {
        when(mockHomeScreenRepositoriesImpl.getTopRepositories(any)).thenAnswer(
          (_) async => Right(newList),
        );
      },
      verify: (bloc) {
        verify(mockHomeScreenRepositoriesImpl.getTopRepositories(any)).called(1);
      },
    );
  });
}
