import 'package:flutter/material.dart';
import 'package:ads_prototype/utils/screen_transitions.dart';

class AdsViewerScreen extends StatelessWidget {
  static const name = "AdsViewerScreen";
  const AdsViewerScreen({Key? key}) : super(key: key);

  static Route route() {
    return ScreenTransitions.getTransition(
        ScreenTransitionType.fadeIn,
        const RouteSettings(name: name),
        const AdsViewerScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
