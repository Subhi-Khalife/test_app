import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test_app/domain/core/exception.dart';
import 'package:test_app/domain/core/failures.dart';

class HandlingExceptionManager<T> {
  static Future<Either<Failure, T>> wrapHandling<T>(
      {required Future<Right<Failure, T>> Function() tryCall}) async {
    try {
      final right = await tryCall();
      return right;
    } on ServerException catch (e) {
      log("<< ServerException >> ");
      return Left(ServerFailure(message: e.message));
    } on DataDuplicatesException catch (e) {
      log("<< DataDuplicatesException >> ");
      return Left(DataDuplicatesFailure(message: e.message));
    } on MissingParamException catch (e) {
      log("<< MissingParamException >> ");
      return Left(MissingParamFailure(message: e.message));
    } on UserNotAllowedToAccessException catch (e) {
      log("<< UserNotAllowedToAccessException >> ");
      return Left(UserNotAllowedToAccessFailure(message: e.message));
    } on OperationFailedException catch (e) {
      log("<< OperationFailedException >> ");
      return Left(OperationFailedFailure(message: e.message));
    } on TokenMisMatchException catch (e) {
      log("<< TokenMisMatchException >> ");
      return Left(TokenMisMatchFailure(message: e.message));
    } on DataNotFoundException catch (e) {
      log("<< DataNotFoundException >> ");
      return Left(DataNotFoundFailure(message: e.message));
    } on InvalidEmailException catch (e) {
      log("<< InvalidEmailException >> ");
      return Left(InvalidEmailFailure(message: e.message));
    } on InvalidPhoneException catch (e) {
      log("<< InvalidPhoneException >> ");
      return Left(InvalidPhoneFailure(message: e.message));
    } on NotAuthenticatedException catch (e) {
      log("<< NotAuthenticatedException >> ");
      return Left(NotAuthenticatedFailure(message: e.message));
    } on TimeoutException catch (e) {
      log("<< TimeoutException >> ");
      return Left(TimeOutFailure(message: e.message));
    } on SendTimeoutException catch (e) {
      return Left(SendTimeoutFailure(message: e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(message: e.message));
    } on ApiException catch (e) {
      log("<< ApiException >> ");
      return Left(ApiFailure(message: e.message));
    } catch (e) {
      log("<< catch >> error is $e");
      return Left(ServerFailure(message: ""));
    }
  }
}
