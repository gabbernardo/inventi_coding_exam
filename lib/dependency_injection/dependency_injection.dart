import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/datasources/homepage_remote_datasource.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/repositories/homepage_repository_impl.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/repository/homepage_repository.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/usecases/homepage_usecase.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/presentation/bloc/homepage_bloc.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {
  /// Application Layer
  serviceLocator.registerFactory(() => HomepageBloc(homePageUseCase: serviceLocator()));


  /// Domain Layer
  serviceLocator.registerFactory(() => HomePageUseCase(homePageRepository: serviceLocator()));


  /// Data Layer
  serviceLocator.registerFactory<HomePageRepository>(() => HomePageRepositoryImpl(homePageRemoteDataSource: serviceLocator()));
  serviceLocator.registerFactory<HomePageRemoteDataSource>(() => HomePageRemoteDataSourceImpl(dio: serviceLocator()));


// ! externs
  serviceLocator.registerFactory(() => Dio());
}