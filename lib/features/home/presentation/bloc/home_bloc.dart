import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InitialState()) {
    on<NavigateToPage>((event, emit) {
      emit(PageLoaded(event.index));
    });
  }
}
