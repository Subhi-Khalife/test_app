import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_app/application/home/home_bloc.dart';
import 'package:test_app/common/constent/apis.dart';
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart';
import 'package:test_app/infrastructure/home/home_screen_repositories_impl.dart';

final serviceLocator = GetIt.instance;

class Injection {
  Future<void> init() async => appDependencies();

  Future<void> appDependencies() async {
    serviceLocator.registerLazySingleton(() => getNetworkObj());
    // HomeBloc
    serviceLocator.registerFactory<HomeBloc>(
        () => HomeBloc(homeScreenRepositories: serviceLocator<HomeScreenRepositoriesImpl>()));
    serviceLocator.registerFactory<HomeScreenRepositoriesImpl>(() => HomeScreenRepositoriesImpl(
        getTopRepositoriesRemote: serviceLocator<GetTopRepositoriesRemote>()));
    serviceLocator.registerFactory<GetTopRepositoriesRemote>(() => GetTopRepositoriesRemote());
  }

  Dio getNetworkObj() {
    BaseOptions options = BaseOptions(
      baseUrl: Apis.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    Dio dio = Dio(options);

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
    return dio;
  }
}
