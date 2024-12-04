

import 'package:equatable/equatable.dart';

class HomePageEntity extends Equatable {
  const HomePageEntity({required this.randomString});

  final String randomString;

  @override
  List<Object?> get props => [randomString];
}