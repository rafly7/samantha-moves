package net.smm.autorunweb

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.provider.Settings
import android.content.Intent;
import android.net.Uri;

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var REQUEST_OVERLAY_PERMISSIONS = 100
        if (!Settings.canDrawOverlays(getApplicationContext())) {
            val myIntent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)
            val uri: Uri = Uri.fromParts("package", getPackageName(), null)
            myIntent.setData(uri)
            startActivityForResult(myIntent, REQUEST_OVERLAY_PERMISSIONS)
            return
        }
    }
}
