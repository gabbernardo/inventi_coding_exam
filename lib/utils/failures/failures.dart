import 'package:equatable/equatable.dart';

const generalFailureMessage = 'Something went wrong. Please try again!';
const serverFailureMessage = 'Connection timed out. Please try again!';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class GeneralFailure extends Failure {}
