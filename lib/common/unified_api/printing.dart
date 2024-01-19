import 'dart:developer';

import 'package:http/http.dart';

enum RequestType { post, get, delete, put }

class Printing {
  Printing({required this.requestName});
  String requestName;

  void printResponse(Response response) {
    // ignore: avoid_print
    log("The << status code >> into $requestName -> ${response.statusCode}");
    // ignore: avoid_print
    log("The << Response Body >> into $requestName -> \n ${response.body}");
  }

  void printRequest({
    required RequestType requestType,
    required Uri uri,
    dynamic param,
    required Map<String, String> header,
  }) {
    log("Header : $header");
    // ignore: avoid_print
    log("${requestType.name} request .......");
    // ignore: avoid_print
    log("The << requestedLink >> ${uri.toString()}");
    if (param != null) log('The << Request body >> is: \n$param');
  }
}
