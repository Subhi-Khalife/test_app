import 'package:flutter/material.dart';
import 'package:test_app/domain/core/failures.dart';
import 'package:test_app/presentation/custome_widgets/bloc_error/bloc_error.dart';

class ShowErrorScreenByFailure extends StatelessWidget {
  final Failure failure;
  final Function refreshFunction;
  const ShowErrorScreenByFailure({
    super.key,
    required this.failure,
    required this.refreshFunction,
  });

  @override
  Widget build(BuildContext context) {
    if (failure is TimeOutFailure) {
      return BlocError.timeLimit(clickActionFunction: refreshFunction, errorTitle: failure.message);
    } else if (failure is ServerFailure) {
      return BlocError.serverError(
          clickActionFunction: refreshFunction, errorTitle: failure.message);
    } else {
      return BlocError.unkownError(
          clickActionFunction: refreshFunction, errorTitle: failure.message);
    }
  }
}
