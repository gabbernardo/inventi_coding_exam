import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/usecases/homepage_usecase.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/presentation/bloc/homepage_bloc.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';

import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockHomePageUseCase extends Mock implements HomePageUseCase {}

void main() {
  group('HomePageBloc', () {
    group(
      'should emit',
      () {
        MockHomePageUseCase mockHomePageUseCase = MockHomePageUseCase();

        blocTest<HomepageBloc, HomepageState>(
            'show nothing when no event is triggered',
            build: () => HomepageBloc(homePageUseCase: mockHomePageUseCase),
            expect: () => const <HomepageState>[]);

        blocTest<HomepageBloc, HomepageState>(
            '[HomepageLoadingState, HomepageLoadedState]',
            setUp: () =>
                when(() => mockHomePageUseCase.getRandomString()).thenAnswer(
                  (realInvocation) => Future.value(
                    Right<Failure, HomePageModel>(
                      HomePageModel(
                        randomString: 'random123',
                      ),
                    ),
                  ),
                ),
            build: () => HomepageBloc(homePageUseCase: mockHomePageUseCase),
            act: (bloc) => bloc.add(GetRandomStringEvent()),
            expect: () => <HomepageState>[
                  HomepageLoadingState(),
                  HomepageLoadedState(
                      data: HomePageModel(randomString: 'random123'))
                ]);

        blocTest<HomepageBloc, HomepageState>(
            '[HomepageLoadingState, HomePageErrorState]',
            setUp: () =>
                when(() => mockHomePageUseCase.getRandomString()).thenAnswer(
                  (realInvocation) => Future.value(
                    Left<Failure, HomePageModel>(ServerFailure()),
                  ),
                ),
            build: () => HomepageBloc(homePageUseCase: mockHomePageUseCase),
            act: (bloc) => bloc.add(GetRandomStringEvent()),
            expect: () => <HomepageState>[
                  HomepageLoadingState(),
                  HomepageErrorState(errorMessage: serverFailureMessage)
                ]);
      },
    );
  });
}
