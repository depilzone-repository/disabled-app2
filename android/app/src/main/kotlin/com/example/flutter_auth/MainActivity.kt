package com.example.flutter_auth

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

//    override fun onCreate(savedInstanceState: Bundle?) {
//        // Aligns the Flutter view vertically with the window.
//        WindowCompat.setDecorFitsSystemWindows(getWindow(), false)
//
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
//            // Disable the Android splash screen fade out animation to avoid
//            // a flicker before the similar frame is drawn in Flutter.
//            splashScreen.setOnExitAnimationListener { splashScreenView -> splashScreenView.remove() }
//        }
//
//        super.onCreate(savedInstanceState)
//    }
}
