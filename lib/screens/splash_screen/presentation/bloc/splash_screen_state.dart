part of 'splash_screen_bloc.dart';

@immutable
sealed class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoadingState extends SplashScreenState {}

class SplashScreenLoadedState extends SplashScreenState {}

class SplashScreenErrorState extends SplashScreenState {}
