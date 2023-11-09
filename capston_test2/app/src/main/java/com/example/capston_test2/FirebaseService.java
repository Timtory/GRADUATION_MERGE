package com.example.capston_test2;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.media.RingtoneManager;
import android.os.AsyncTask;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class FirebaseService extends FirebaseMessagingService {

    private static final String TAG = "FirebaseService";

    private String msg, title;

    @Override
    public void onNewToken(String token) {
        FirebaseMessaging.getInstance().getToken();

        Log.e(TAG,token);

        // If you want to send messages to this application instance or
        // manage this app's subscriptions on the server side, send the
        // Instance ID token to your app server.
        //sendRegistrationToServer(token);


    }

   /*// Assuming you have a way to send your token to your server
    private void sendRegistrationToServer(String token) {
        new AsyncTask<String, Void, Void>() {
            @Override
            protected Void doInBackground(String... params) {
                String token = params[0];
                HttpURLConnection connection = null;
                try {
                    URL url = new URL("http://shinhan-software.co.kr/token.jsp");
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                    connection.setDoOutput(true);
                    connection.setConnectTimeout(10000); // 10초 타임아웃
                    connection.setReadTimeout(10000); // 10초 타임아웃

                    // POST 데이터 구성
                    String postData = URLEncoder.encode(token, "UTF-8");

                    // 데이터 전송
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
                    writer.write(postData);
                    writer.flush();
                    writer.close();

                    int responseCode = connection.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        Log.e(TAG, "Token registration successful");
                        // 서버로부터 응답 내용 읽기
                        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        String line;
                        StringBuilder response = new StringBuilder();
                        while ((line = reader.readLine()) != null) {
                            response.append(line);
                        }
                        reader.close();
                        // 로그에 응답 내용 기록
                        Log.e(TAG, "Server Response: " + response.toString());
                    } else {
                        Log.e(TAG, "Token registration failed with code: " + responseCode);
                    }
                } catch (Exception e) {
                    Log.e(TAG, "Error sending FCM token to server", e);
                } finally {
                    if (connection != null) {
                        connection.disconnect();
                    }
                }
                return null;
            }
        }.execute(token);
    }*/


    @Override
    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {

        Log.e(TAG, "onMessageReceived");

        title = remoteMessage.getNotification().getTitle();
        msg = remoteMessage.getNotification().getBody();

        Intent intent = new Intent(this, MainActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);

        PendingIntent contentIntent = PendingIntent.getActivity(this, 0, new Intent(this, MainActivity.class), PendingIntent.FLAG_IMMUTABLE);

        NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle(title)
                .setContentText(msg)
                .setAutoCancel(true)
                .setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION))
                .setVibrate(new long[]{1, 1000});

        NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        mBuilder.setContentIntent(contentIntent);

        notificationManager.notify(0, mBuilder.build());
    }

}