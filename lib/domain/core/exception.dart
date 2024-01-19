class ServerException implements Exception {
  ServerException({this.message});

  final String? message;
}

class CacheException implements Exception {
  CacheException({this.message});

  final String? message;
}

class DataDuplicatesException implements Exception {
  DataDuplicatesException({this.message});

  final String? message;
}

class MissingParamException implements Exception {
  MissingParamException({this.message});

  final String? message;
}

class UserNotAllowedToAccessException implements Exception {
  UserNotAllowedToAccessException({this.message});

  final String? message;
}

class OperationFailedException implements Exception {
  OperationFailedException({this.message});

  final String? message;
}

class TokenMisMatchException implements Exception {
  TokenMisMatchException({this.message});

  final String? message;
}

class DataNotFoundException implements Exception {
  DataNotFoundException({this.message});

  final String? message;
}

class InvalidEmailException implements Exception {
  InvalidEmailException({this.message});

  final String? message;
}

class InvalidPhoneException implements Exception {
  InvalidPhoneException({this.message});

  final String? message;
}

class NotAuthenticatedException implements Exception {
  NotAuthenticatedException({this.message});

  final String? message;
}

class ApiException implements Exception {
  ApiException({this.message});

  final String? message;
}

class UnknownError implements Exception {
  UnknownError({this.message});

  final String? message;
}

class SendTimeoutException implements Exception {
  SendTimeoutException({this.message});

  final String? message;
}

class ReceiveTimeoutException implements Exception {
  ReceiveTimeoutException({this.message});

  final String? message;
}
