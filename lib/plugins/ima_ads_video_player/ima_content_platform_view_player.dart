import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImaContentPlatformViewPlayerWidget extends StatelessWidget {
  const ImaContentPlatformViewPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
