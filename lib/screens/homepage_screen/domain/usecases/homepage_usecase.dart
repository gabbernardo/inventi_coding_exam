
import 'package:dartz/dartz.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/repository/homepage_repository.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';

class HomePageUseCase {
  HomePageUseCase({required this.homePageRepository});

  final HomePageRepository homePageRepository;

  Future<Either<Failure, HomePageModel>> getRandomString() async {
    return homePageRepository.getRandomStringFromRemoteDataSource();
  }
}