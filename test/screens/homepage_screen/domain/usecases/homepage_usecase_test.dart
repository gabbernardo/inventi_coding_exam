import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/repositories/homepage_repository_impl.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/usecases/homepage_usecase.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'homepage_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomePageRepositoryImpl>()])
void main() {
  group('HomePageUseCase', () {
    group('should return HomePageModel', () {
      test('when HomePageRepoImpl returns a HomePageModel', () async {
        final mockHomePageRepositoryImpl = MockHomePageRepositoryImpl();
        final homepageUseCaseUnderTest = HomePageUseCase(
            homePageRepository: mockHomePageRepositoryImpl);

        when(mockHomePageRepositoryImpl.getRandomStringFromRemoteDataSource()).thenAnswer((
            realInvocation) => Future.value(Right(HomePageModel(randomString: 'random123'))));

        final result = await homepageUseCaseUnderTest.getRandomString();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HomePageModel>(HomePageModel(randomString: 'random123')));
        verify(mockHomePageRepositoryImpl.getRandomStringFromRemoteDataSource()).called(1);
        });
    });

    group('should return the Failure', () {
      test('return a ServerFailure', () async {
        final mockHomePageRepositoryImpl = MockHomePageRepositoryImpl();
        final homepageUseCaseUnderTest = HomePageUseCase(
            homePageRepository: mockHomePageRepositoryImpl);

        when(mockHomePageRepositoryImpl.getRandomStringFromRemoteDataSource())
            .thenAnswer((realInvocation) => Future.value(Left(ServerFailure())));

        final result = await homepageUseCaseUnderTest.getRandomString();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HomePageModel>(ServerFailure()));
        verify(mockHomePageRepositoryImpl.getRandomStringFromRemoteDataSource()).called(1);
      });
    });
  });
}