part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomepageLoadingState extends HomepageState {}

class HomepageLoadedState extends HomepageState {
  HomepageLoadedState({required this.data});

  final HomePageModel data;

  @override
  List<Object?> get props => [data];

}

class HomepageErrorState extends HomepageState {
  HomepageErrorState({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

