import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/datasources/homepage_remote_datasource.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/exceptions/exceptions.dart';
import 'package:inventi_coding_exam/utils/api_constants/api_constants.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'homepage_remote_datasource_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  final requestOptions = RequestOptions(path: baseURL);

  group('HomePageRemoteDataSource', () {
    group('should return HomePageModel', () {
      test('when the response status code is 200', () async {
        final mockDio = MockDio();
        final homePageRemoteDataSourceUnderTest =
            HomePageRemoteDataSourceImpl(dio: mockDio);
        const responseBody = {"randomString": "random123"};

        when(mockDio.get(baseURL)).thenAnswer(
          (realInvocation) => Future.value(
            Response(
                data: responseBody,
                statusCode: 200,
                requestOptions: requestOptions),
          ),
        );

        final result =
            await homePageRemoteDataSourceUnderTest.getRandomString();

        expect(result.randomString, 'random123');
      });
    });

    group('should throw an Exception', () {
      test('ServerException when the status code is not 200', () {
        final mockDio = MockDio();
        final homePageRemoteDataSourceUnderTest =
            HomePageRemoteDataSourceImpl(dio: mockDio);

        when(mockDio.get(baseURL)).thenAnswer(
          (realInvocation) => Future.value(
            Response(data: '', statusCode: 201, requestOptions: requestOptions),
          ),
        );

        expect(() => homePageRemoteDataSourceUnderTest.getRandomString(),
            throwsA(isA<ServerException>()));
      });
    });
  });
}
