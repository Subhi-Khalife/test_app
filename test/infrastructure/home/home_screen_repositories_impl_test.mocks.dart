// Mocks generated by Mockito 5.4.4 from annotations
// in test_app/test/infrastructure/home/home_screen_repositories_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:test_app/domain/Entities/home/repository.dart' as _i4;
import 'package:test_app/infrastructure/home/caller/get_top_repositories_remote.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [GetTopRepositoriesRemote].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRepositoriesRemote extends _i1.Mock
    implements _i2.GetTopRepositoriesRemote {
  MockGetTopRepositoriesRemote() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Repository>> send(_i2.GetTopRepositoriesParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [params],
        ),
        returnValue: _i3.Future<List<_i4.Repository>>.value(<_i4.Repository>[]),
      ) as _i3.Future<List<_i4.Repository>>);
}
