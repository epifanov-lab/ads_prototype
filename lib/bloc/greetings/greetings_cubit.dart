import 'package:ads_prototype/bloc/greetings/greetings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GreetingsCubit extends Cubit<GreetingsState> {

  GreetingsCubit() : super(const GreetingsState.initial()) {
    Future.delayed(const Duration(milliseconds: 7500))
        .then((_) => emit(state.copyWith(isPlayAdsButtonShown: true)));
  }

  void onTapPlayAds() {

  }

}
