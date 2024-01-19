import 'package:test_app/common/constent/apis.dart';
import 'package:test_app/common/unified_api/get_api.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/infrastructure/home/dto/repository_dto.dart';

class GetTopRepositoriesRemote {
  Future<List<Repository>> send(GetTopRepositoriesParams params) async {
    final GetApi<List<Repository>> getApi = GetApi(
      url: Apis.topRepositories,
      fromJson: (body) {
        final List<dynamic> jsonList = body['items'];
        return jsonList.map<Repository>(
          (json) {
            return RepositoryDto.fromJson(json as Map<String, dynamic>).convertToDomain();
          },
        ).toList();
      },
      requestName: "Get Top Repositories Remote",
      param: params.getParam(),
    );

    return getApi.callRequest();
  }
}

class GetTopRepositoriesParams {
  GetTopRepositoriesParams({required this.pageNumber});
  int pageNumber;

  Map<String, dynamic> getParam() => {
        "page": pageNumber.toString(),
        "q": "created:>2024-01-18",
      };
}
