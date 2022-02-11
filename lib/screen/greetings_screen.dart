import 'package:ads_prototype/utils/screen_transitions.dart';
import 'package:ads_prototype/widgets/greetings_label.dart';
import 'package:flutter/material.dart';

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
    return Container(
      color: const Color(0xFF333333),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          GreetingsLabelWidget(),
          SizedBox(height: 64),
        ],
      ),
    );
  }

}
