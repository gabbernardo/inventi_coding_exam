import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/datasources/homepage_remote_datasource.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/exceptions/exceptions.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/repositories/homepage_repository_impl.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'homepage_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomePageRemoteDataSourceImpl>()])
void main() {
  group('HomePageRepositoryImpl', () {
    group('should return HomePageModel', () {
      test('when the remote datasource return a response', () async {
        final mockHomePageRemoteDataSource = MockHomePageRemoteDataSourceImpl();
        final homePageRepositoryImplUnderTest = HomePageRepositoryImpl(
            homePageRemoteDataSource: mockHomePageRemoteDataSource);

        when(mockHomePageRemoteDataSource.getRandomString()).thenAnswer(
          (realInvocation) =>
              Future.value(HomePageModel(randomString: 'random123')),
        );

        final result = await homePageRepositoryImplUnderTest.getRandomStringFromRemoteDataSource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HomePageModel> (HomePageModel(randomString: 'random123')));
        verify(mockHomePageRemoteDataSource.getRandomString()).called(1);
      });
    });
    
    group('should return the Failure', () {
      test('should return a ServerFailure when ServerException happened', () async {
        final mockHomePageRemoteDataSource = MockHomePageRemoteDataSourceImpl();
        final homePageRepositoryImplUnderTest = HomePageRepositoryImpl(
            homePageRemoteDataSource: mockHomePageRemoteDataSource);
        
        when(mockHomePageRemoteDataSource.getRandomString()).thenThrow(ServerException());

        final result = await homePageRepositoryImplUnderTest.getRandomStringFromRemoteDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HomePageModel> (ServerFailure()));
      });
    });
  });
}
