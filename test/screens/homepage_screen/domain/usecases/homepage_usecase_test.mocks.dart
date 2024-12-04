// Mocks generated by Mockito 5.4.4 from annotations
// in inventi_coding_exam/test/screens/homepage_screen/domain/usecases/homepage_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:inventi_coding_exam/screens/homepage_screen/data/datasources/homepage_remote_datasource.dart'
    as _i2;
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart'
    as _i7;
import 'package:inventi_coding_exam/screens/homepage_screen/data/repositories/homepage_repository_impl.dart'
    as _i4;
import 'package:inventi_coding_exam/utils/failures/failures.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeHomePageRemoteDataSource_0 extends _i1.SmartFake
    implements _i2.HomePageRemoteDataSource {
  _FakeHomePageRemoteDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomePageRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomePageRepositoryImpl extends _i1.Mock
    implements _i4.HomePageRepositoryImpl {
  @override
  _i2.HomePageRemoteDataSource get homePageRemoteDataSource =>
      (super.noSuchMethod(
        Invocation.getter(#homePageRemoteDataSource),
        returnValue: _FakeHomePageRemoteDataSource_0(
          this,
          Invocation.getter(#homePageRemoteDataSource),
        ),
        returnValueForMissingStub: _FakeHomePageRemoteDataSource_0(
          this,
          Invocation.getter(#homePageRemoteDataSource),
        ),
      ) as _i2.HomePageRemoteDataSource);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.HomePageModel>>
      getRandomStringFromRemoteDataSource() => (super.noSuchMethod(
            Invocation.method(
              #getRandomStringFromRemoteDataSource,
              [],
            ),
            returnValue:
                _i5.Future<_i3.Either<_i6.Failure, _i7.HomePageModel>>.value(
                    _FakeEither_1<_i6.Failure, _i7.HomePageModel>(
              this,
              Invocation.method(
                #getRandomStringFromRemoteDataSource,
                [],
              ),
            )),
            returnValueForMissingStub:
                _i5.Future<_i3.Either<_i6.Failure, _i7.HomePageModel>>.value(
                    _FakeEither_1<_i6.Failure, _i7.HomePageModel>(
              this,
              Invocation.method(
                #getRandomStringFromRemoteDataSource,
                [],
              ),
            )),
          ) as _i5.Future<_i3.Either<_i6.Failure, _i7.HomePageModel>>);
}
