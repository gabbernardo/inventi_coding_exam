import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/data/model/homepage_model.dart';
import 'package:inventi_coding_exam/screens/homepage_screen/domain/usecases/homepage_usecase.dart';
import 'package:inventi_coding_exam/utils/failures/failures.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';

part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc({required this.homePageUseCase}) : super(HomepageInitial()) {
    on<GetRandomStringEvent>(getRandomString);
  }

  final HomePageUseCase homePageUseCase;

  Future<void> getRandomString(GetRandomStringEvent event,
      Emitter<HomepageState> emit) async {
    emit(HomepageLoadingState());
    final result = await homePageUseCase.getRandomString();
    result.fold(
        (error) => emit(HomepageErrorState(errorMessage: _mapFailureToMessage(error))),
        (data) => emit(HomepageLoadedState(data: data)));
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
