import 'package:test_app/common/unified_api/handling_response.dart';

import 'printing.dart';

abstract class InitialApi<T> extends Printing with HandlingResponse {
  InitialApi(
      {required this.url, required String requestName, this.header, bool withSessionId = true})
      : super(requestName: requestName) {}
  String url;
  final String baseURL = "";
  Map<String, String>? header;
  Future<T> callRequest();
}
