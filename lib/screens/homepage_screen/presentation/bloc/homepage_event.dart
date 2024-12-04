part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}

class GetRandomStringEvent extends HomepageEvent {}
