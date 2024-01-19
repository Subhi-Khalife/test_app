part of 'home_bloc.dart';

enum GetHomeInfoStatus { init, loading, success, failed }

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.getHomeInfoStatus = GetHomeInfoStatus.init,
    this.repositories = const <Repository>[],
    this.hasReachedMax = false,
    this.failure,
  });

  final Failure? failure;
  final List<Repository> repositories;
  final GetHomeInfoStatus getHomeInfoStatus;
  final bool hasReachedMax;
  HomeState copyWith({
    List<Repository>? repositories,
    GetHomeInfoStatus? getHomeInfoStatus,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return HomeState(
      failure: failure ?? this.failure,
      repositories: repositories ?? this.repositories,
      getHomeInfoStatus: getHomeInfoStatus ?? this.getHomeInfoStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [repositories, getHomeInfoStatus, hasReachedMax];
}
