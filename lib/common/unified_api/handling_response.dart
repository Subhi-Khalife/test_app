import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_app/domain/core/exception.dart';

mixin HandlingResponse {
  Exception getException(int statusCode) {
    if (statusCode == 330) {
      return DataDuplicatesException();
    } else if (statusCode == 400 || statusCode == 422) {
      return MissingParamException();
    } else if (statusCode == 430) {
      return NotAuthenticatedException();
    } else if (statusCode == 460 || statusCode == 550) {
      return UserNotAllowedToAccessException();
    } else if (statusCode == 560) {
      return OperationFailedException();
    } else if (statusCode == 499) {
      return TokenMisMatchException();
    } else if (statusCode == 401) {
      return DataNotFoundException();
    } else if (statusCode == 522) {
      return InvalidEmailException();
    } else if (statusCode == 450) {
      return InvalidPhoneException();
    } else if (statusCode == 200) {
      return ApiException();
    } else {
      return ServerException(message: "Something went wrong");
    }
  }

  Exception getExceptionFromDio(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutException('Connection timeout check your internet connection');
      case DioExceptionType.sendTimeout:
        return SendTimeoutException(message: 'Send timeout check your internet connection');
      case DioExceptionType.receiveTimeout:
        return TimeoutException("Receive timeout check your internet connection");
      case DioExceptionType.cancel:
        return ServerException(message: "Something went wrong ");
      default:
        return ServerException(message: "Something went wrong");
    }
  }
}
