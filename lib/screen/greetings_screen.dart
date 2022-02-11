import 'package:ads_prototype/bloc/greetings/greetings_cubit.dart';
import 'package:ads_prototype/bloc/greetings/greetings_state.dart';
import 'package:ads_prototype/core/locator.dart';
import 'package:ads_prototype/utils/screen_transitions.dart';
import 'package:ads_prototype/widgets/greetings_label.dart';
import 'package:ads_prototype/widgets/play_ads_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GreetingsScreen extends StatelessWidget {
  static const name = "GreetingsScreen";

  const GreetingsScreen({Key? key}) : super(key: key);

  static Route route() {
    return ScreenTransitions.getTransition(
      ScreenTransitionType.fadeIn,
      const RouteSettings(name: name),
      const GreetingsScreen(),
    );
  }

  void _onTapPlayAds() {
    locator.get<GreetingsCubit>().onTapPlayAds();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 148),
              child: const GreetingsLabelWidget(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 148),
              child: BlocBuilder<GreetingsCubit, GreetingsState>(
                bloc: locator.get<GreetingsCubit>(),
                builder: (context, state) {
                  return AnimatedOpacity(
                    opacity: state.isPlayAdsButtonShown ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: PlayAdsButton(
                      onTap: _onTapPlayAds,
                    ),
                  );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
