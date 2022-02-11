import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackButtonWidget extends StatelessWidget {

  final Function? onTap;

  const BackButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      customBorder: const CircleBorder(),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}
