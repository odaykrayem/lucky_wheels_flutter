//package com.example.lucky_wheels_flutter;
//
//import android.app.NotificationManager;
//import android.app.Service;
//import android.content.Intent;
//import android.os.Build;
//import android.os.IBinder;
//
//import androidx.annotation.Nullable;
//import androidx.core.app.NotificationCompat;
//
//
//public class MyService extends Service {
//
//    @Override
//    public void onCreate() {
//        super.onCreate();
//        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            NotificationCompat.Builder builder = new NotificationCompat.Builder(this, "messages")
//                    .setContentText("This is background")
//                    .setContentTitle("flutter background")
//                    .setSmallIcon(R.drawable.launch_background);
//
//            startForeground(101, builder.build());
//        }
//    }
//
//    @Nullable
//    @Override
//    public IBinder onBind(Intent intent) {
//        return null;
//    }
//}
