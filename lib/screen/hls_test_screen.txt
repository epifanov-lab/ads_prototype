import 'package:ads_prototype/utils/screen_transitions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HlsTestScreen extends StatefulWidget {

  const HlsTestScreen({Key? key}) : super(key: key);

  static Route route() {
    var screen = const HlsTestScreen();
    return ScreenTransitions.getTransition(
      ScreenTransitionType.fadeIn,
      RouteSettings(name: screen.runtimeType.toString()),
      screen,
    );
  }

  @override
  State<HlsTestScreen> createState() => _HlsTestScreenState();
}

class _HlsTestScreenState extends State<HlsTestScreen> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8')
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: _controller?.value.isInitialized == true
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
