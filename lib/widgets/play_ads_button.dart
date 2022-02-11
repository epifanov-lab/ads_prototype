import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayAdsButton extends StatelessWidget {

  final Function? onTap;

  const PlayAdsButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onTap?.call(),
      elevation: 4,
      fillColor: const Color.fromRGBO(255, 8, 198, 1),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        "PLAY AD",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "Minecraft",
        ),
      ),
    );
  }
}
