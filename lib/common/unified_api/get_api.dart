import 'dart:async';
import 'package:dio/dio.dart';
import 'package:test_app/common/unified_api/initial_api.dart';
import 'package:test_app/injection.dart';

typedef _FromJson<T> = T Function(Map<String, dynamic> body);

class GetApi<T> extends InitialApi<T> {
  GetApi({
    required String url,
    required this.fromJson,
    required String requestName,
    this.queryText,
    this.param,
  }) : super(requestName: requestName, url: url);

  // ignore: library_private_types_in_public_api
  _FromJson<T> fromJson;

  Map<String, dynamic>? param;

  String? queryText;

  @override
  Future<T> callRequest() async {
    try {
      Dio dio = serviceLocator<Dio>();
      final response = await dio.get(url, queryParameters: param);
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        Exception exception = getException(response.statusCode ?? 0);
        throw (exception);
      }
    } on DioException catch (e) {
      Exception exception = getExceptionFromDio(e);
      throw (exception);
    } catch (_) {
      rethrow;
    }
  }
}
