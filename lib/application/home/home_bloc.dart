import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/common/helper.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/domain/core/failures.dart';
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeScreenRepositories homeScreenRepositories;
  HomeBloc({required this.homeScreenRepositories}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeScreenTopRepositoriesEvent>(_mapGetHomeScreenEvent);
  }

  _mapGetHomeScreenEvent(GetHomeScreenTopRepositoriesEvent event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;
    if (state.getHomeInfoStatus == GetHomeInfoStatus.loading && state.repositories.isNotEmpty) {
      return;
    }
    emit(state.copyWith(getHomeInfoStatus: GetHomeInfoStatus.loading));
    final result = await homeScreenRepositories.getTopRepositories(GetTopRepositoriesParams(
        pageNumber: (state.repositories.length / DesignHelper.maxPaginationNumber).ceil()));
    emit(
      result.fold(
        (l) => state.copyWith(getHomeInfoStatus: GetHomeInfoStatus.failed, failure: l),
        (r) => state.copyWith(
          getHomeInfoStatus: GetHomeInfoStatus.success,
          repositories: List.of(state.repositories)..addAll(r),
          hasReachedMax: r.length < DesignHelper.maxPaginationNumber,
        ),
      ),
    );
  }
}
