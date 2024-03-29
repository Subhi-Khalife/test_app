import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/application/home/home_bloc.dart';
import 'package:test_app/injection.dart';
import 'package:test_app/presentation/custome_widgets/bloc_error/bloc_error.dart';
import 'package:test_app/presentation/custome_widgets/bloc_error/show_error_screen_by_failure.dart';
import 'package:test_app/presentation/custome_widgets/loading_bloc/loading_bloc.dart';
import 'package:test_app/presentation/screens/home/widgets/repositories_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    homeBloc = serviceLocator<HomeBloc>();
    homeBloc.add(GetHomeScreenTopRepositoriesEvent());
    scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc.close();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Repositories"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocProvider<HomeBloc>(
          create: (context) => homeBloc,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.repositories.isEmpty) {
                if (state.getHomeInfoStatus == GetHomeInfoStatus.loading ||
                    state.getHomeInfoStatus == GetHomeInfoStatus.init) {
                  return const LoadingBloc();
                } else if (state.getHomeInfoStatus == GetHomeInfoStatus.failed) {
                  return ShowErrorScreenByFailure(
                    failure: state.failure!,
                    refreshFunction: () {
                      homeBloc.add(GetHomeScreenTopRepositoriesEvent());
                    },
                  );
                }
                return BlocError.noItems(clickActionFunction: () {
                  homeBloc.add(GetHomeScreenTopRepositoriesEvent());
                });
              }
              return CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: RepostioriesListItem(repository: state.repositories[index]),
                        );
                      },
                      childCount: state.repositories.length,
                    ),
                  ),
                  if (!state.hasReachedMax)
                    const SliverPadding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      sliver: SliverToBoxAdapter(child: LoadingBloc()),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      homeBloc.add(GetHomeScreenTopRepositoriesEvent());
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.93);
  }
}
