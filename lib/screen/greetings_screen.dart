import 'package:flutter/material.dart';
import 'package:ads_prototype/utils/screen_transitions.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({Key? key}) : super(key: key);

  static Route route() {
    return ScreenTransitions.getTransition(
        ScreenTransitionType.fadeIn,
        const RouteSettings(name: "ResourcesListScreen"),
        const GreetingsScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
