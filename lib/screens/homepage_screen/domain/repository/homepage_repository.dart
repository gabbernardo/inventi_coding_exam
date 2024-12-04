
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomePageRepository {

  Future<Either<Failure,HomePageModel>> getRandomStringFromRemoteDataSource();
}