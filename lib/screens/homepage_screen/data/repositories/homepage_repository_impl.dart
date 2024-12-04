
import 'package:dartz/dartz.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/datasources/homepage_remote_datasource.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/exceptions/exceptions.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/repository/homepage_repository.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  HomePageRepositoryImpl({required this.homePageRemoteDataSource});
  final HomePageRemoteDataSource homePageRemoteDataSource;
  @override
  Future<Either<Failure, HomePageModel>> getRandomStringFromRemoteDataSource() async{
    try {
      final result = await homePageRemoteDataSource.getRandomString();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}