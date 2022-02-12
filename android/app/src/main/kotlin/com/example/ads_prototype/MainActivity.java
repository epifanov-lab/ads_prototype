package com.example.ads_prototype;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
   @Override
   public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
      flutterEngine
        .getPlatformViewsController()
        .getRegistry()
        .registerViewFactory("<platform-view-type>", new NativeViewFactory());
   }
}
