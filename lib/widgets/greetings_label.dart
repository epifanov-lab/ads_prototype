import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GreetingsLabelWidget extends StatelessWidget {
  const GreetingsLabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        animatedTexts: [
          TypewriterAnimatedText(
            'Greetings, Snibble!',
            speed: const Duration(milliseconds: 100),
            textAlign: TextAlign.start,
            textStyle: const TextStyle(
              fontSize: 28.0,
              fontFamily: 'Minecraft',
              color: Colors.white,
            ),
          ),
          TypewriterAnimatedText(
            'Please tap a button below to watch ads.',
            speed: const Duration(milliseconds: 100),
            textAlign: TextAlign.start,
            textStyle: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Minecraft',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
