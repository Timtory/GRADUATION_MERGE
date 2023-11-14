package com.example.capston_test2;

import android.Manifest;
import android.app.Activity;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.webkit.MimeTypeMap;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.core.app.ActivityCompat;
import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;


public class BoardActivity2 extends Activity {

    private Button button18; // 파일 제출하기 버튼
    private TextView textViewBoardTitle; //게시글 내용 이라는 타이틀
    private WebView webViewPostContent; //내용 나오는 웹 뷰
    /*--------------------------------------------------------------------*/
    private Button buttonDownload2;//파일 다운로드 버튼
    private String postId;
    private String fileName; // 파일 이름을 저장할 변수 추가
    private static final int REQUEST_EXTERNAL_STORAGE = 1;
    private static final int REQUEST_PERMISSIONS = 123;
    private static final int REQUEST_CODE_SAVE_FILE = 2;
    private static String[] PERMISSIONS_STORAGE = {
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE
    };
    private TextView textView9;

    private void fetchFileNameAndDownload() {
        // 파일 이름을 서버로부터 가져오는 로직
        new FetchFileNameTask().execute("http://shinhan-software.co.kr/mobile_filedownload2.jsp?post_id=" + postId);
    }




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list_2); // 해당 layout 파일을 생성해야 합니다.
        textViewBoardTitle = findViewById(R.id.textViewBoardTitle);

        textViewBoardTitle.setText("게시글 내용");
        textView9 = findViewById(R.id.textView9);

        button18 = findViewById(R.id.button18);

        webViewPostContent = findViewById(R.id.webViewPostContent); // 레이아웃에서 WebView를 찾습니다.

        buttonDownload2 = findViewById(R.id.buttonDownload2); // 레이아웃에서 Button을 찾습니다.


        // WebView 설정
        webViewPostContent.getSettings().setJavaScriptEnabled(true); // 자바스크립트를 활성화합니다.
        webViewPostContent.setWebViewClient(new WebViewClient()); // 새로운 WebViewClient를 설정하여 기본 웹 브라우저에서 열리는 것을 방지합니다.


        // Intent로부터 post_id 가져오기
        Intent intent = getIntent();
        postId = intent.getStringExtra("post_id");

        // 서버의 웹 페이지 URL을 WebView에 로드합니다. URL에 post_id 파라미터를 포함시킵니다.
        webViewPostContent.loadUrl("http://shinhan-software.co.kr/mobile_contents2.jsp?post_id=" + postId);



        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    // API URL 준비
                    URL url = new URL("http://shinhan-software.co.kr/mobile_filedownload2.jsp?post_id=" + postId);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");

                    // 응답 받기
                    int responseCode = conn.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                        // 응답으로부터 데이터 받기
                        InputStream inputStream = conn.getInputStream();
                        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                        String line;
                        StringBuilder response = new StringBuilder();
                        while ((line = reader.readLine()) != null) {
                            response.append(line);
                        }
                        reader.close();

                        // JSON 형식의 응답으로부터 filelocation 값 추출
                        JSONObject jsonResponse = new JSONObject(response.toString());
                        String filelocation = jsonResponse.isNull("filelocation") ? "" : jsonResponse.getString("filelocation");

                        // 경로에서 파일 이름만 추출
                        final String filename;
                        if (filelocation.isEmpty()) {
                            filename = "첨부된 파일 없음";
                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    buttonDownload2.setVisibility(View.INVISIBLE);
                                }
                            });
                        } else {
                            int lastSlashIndex = filelocation.lastIndexOf('/');
                            filename = filelocation.substring(lastSlashIndex + 1);
                        }

                        // UI 업데이트 (UI는 메인 스레드에서만 업데이트 가능)
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                textView9.setText(filename);
                            }
                        });
                    } else { // 에러 응답
                        // 에러 처리
                    }
                    conn.disconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();



        // 버튼 클릭 이벤트 설정
        buttonDownload2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 권한 요
                fetchFileNameAndDownload();
            }
        });

        //파일 제출하기 버튼
        button18.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(BoardActivity2.this, Suggestion2.class);
                intent.putExtra("hw_postId", postId);
                startActivity(intent);
            }
        });
    }
    private static final AtomicInteger counter = new AtomicInteger();
    private String createUniqueFileName(String originalFileName) {
        String baseName;
        String extension = "";

        // 파일 확장자가 있는 경우, 확장자 분리
        int dotIndex = originalFileName.lastIndexOf(".");
        if (dotIndex > 0) {
            baseName = originalFileName.substring(0, dotIndex);
            extension = originalFileName.substring(dotIndex); // 포함하여 '.' 분리
        } else {
            baseName = originalFileName;
        }

        // 2자리 무작위 문자열 생성
        String uniqueId = generateRandomString(2);
        return baseName + "_" + uniqueId + extension;
    }

    private String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(rnd.nextInt(characters.length())));
        }
        return sb.toString();
    }



    private void openFilePicker(String defaultFileName) {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        fileName = defaultFileName; // 파일 이름 설정
        intent.putExtra(Intent.EXTRA_TITLE, fileName); // 기본 파일 이름으로 받은 파라미터 사용
        startActivityForResult(intent, REQUEST_CODE_SAVE_FILE);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_PERMISSIONS) {
            if (grantResults.length > 0) {
                for (int i = 0; i < grantResults.length; i++) {
                    if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                        Toast.makeText(this, "Permission Denied: " + permissions[i], Toast.LENGTH_SHORT).show();
                        return;
                    }
                }
                // 모든 권한이 부여되었을 경우 파일 저장 위치 선택
                fetchFileNameAndDownload();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE_SAVE_FILE && resultCode == Activity.RESULT_OK) {
            if (data != null) {
                Uri uri = data.getData();
                // 파일 다운로드 및 저장 시작
                new DownloadFileTask(uri).execute("http://shinhan-software.co.kr/mobile_filedownload2.jsp?post_id=" + postId);
            }
        }
    }

    private class DownloadFileTask extends AsyncTask<String, Void, String> {
        private Uri fileUri;

        public DownloadFileTask(Uri fileUri) {
            this.fileUri = fileUri;
        }

        @Override
        protected String doInBackground(String... params) {
            String fileLocationUrl = params[0];
            String fileLocation = "";

            try {
                // 파일 위치 정보를 가져오는 HTTP 요청
                HttpURLConnection conn = (HttpURLConnection) new URL(fileLocationUrl).openConnection();
                conn.setRequestMethod("GET");

                int responseCode = conn.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    StringBuilder responseBuilder = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        responseBuilder.append(line);
                    }
                    fileLocation = responseBuilder.toString();
                    reader.close();

                    // 로그에 fileLocation 값 출력
                    Log.d("DownloadFileTask", "Received file location: " + fileLocation);

                    if (fileLocation.isEmpty()) {
                        // 서버 응답이 비어 있을 경우
                        Log.e("DownloadFileTask", "Empty response from server");
                        return "Error: Empty response from server";
                    }

                    // JSON에서 파일 경로 추출
                    JSONObject jsonObject = new JSONObject(fileLocation);
                    String filePath = jsonObject.getString("filelocation");
                    fileName = new File(filePath).getName();

                    // FTP 연결 및 파일 다운로드
                    String ftpHost = "www.shinhan-software.co.kr";
                    int ftpPort = 21;
                    String ftpUsername = "shinhan2023";
                    String ftpPassword = "tmdcks15!";

                    FTPClient ftpClient = new FTPClient();
                    ftpClient.setControlEncoding("UTF-8");
                    ftpClient.connect(ftpHost, ftpPort);
                    ftpClient.login(ftpUsername, ftpPassword);
                    ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                    ftpClient.enterLocalPassiveMode();

                    InputStream inputStream = ftpClient.retrieveFileStream(filePath);

                    if (inputStream != null) {
                        try (OutputStream outputStream = getContentResolver().openOutputStream(fileUri)) {
                            if (outputStream != null) {
                                byte[] buffer = new byte[1024];
                                int bytesRead;
                                while ((bytesRead = inputStream.read(buffer)) != -1) {
                                    outputStream.write(buffer, 0, bytesRead);
                                }
                            }
                        } catch (IOException e) {
                            Log.e("DownloadFileTask", "File write failed: " + e.toString());
                            return "Error: File write failed: " + e.toString();
                        } finally {
                            inputStream.close();
                            ftpClient.logout();
                            ftpClient.disconnect();
                        }
                    } else {
                        Log.e("DownloadFileTask", "Could not retrieve file from FTP server");
                        return "Error: Could not retrieve file from FTP server";
                    }
                } else {
                    Log.e("DownloadFileTask", "HTTP response code: " + responseCode);
                    return "Error: Server returned HTTP response code: " + responseCode;
                }
            } catch (IOException | JSONException e) {
                Log.e("DownloadFileTask", "Exception: " + e.toString());
                return "Error: Exception: " + e.toString();
            }

            return "Downloaded: " + fileUri.getPath();
        }

        @Override
        protected void onPostExecute(String result) {
            Toast.makeText(BoardActivity2.this, result, Toast.LENGTH_LONG).show();
            showDownloadCompleteNotification(fileUri, fileName);

        }
    }

    private void showDownloadCompleteNotification(Uri fileUri, String fileName) {
        NotificationManager notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel("download_complete", "Download Notifications", NotificationManager.IMPORTANCE_HIGH);
            channel.setDescription("Channel for download notifications");
            notificationManager.createNotificationChannel(channel);
        }

        // 파일 확장자에 기반한 MIME 타입 얻기
        String mimeType = getMimeType(fileUri);

        // 파일을 여는 인텐트 생성
        Intent intent = new Intent(Intent.ACTION_VIEW);
        if (mimeType != null) {
            intent.setDataAndType(fileUri, mimeType);
        } else {
            intent.setData(fileUri);
        }
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

        // PendingIntent 생성
        PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);

        // 알림 빌더에 PendingIntent 추가
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this, "download_complete")
                .setSmallIcon(R.drawable.ic_launcher_foreground) // 아이콘 설정
                .setContentTitle("다운로드 완료")
                .setContentText(fileName + " 다운로드가 완료되었습니다.")
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setAutoCancel(true)
                .setContentIntent(pendingIntent); // 여기에 PendingIntent 추가

        notificationManager.notify(1, builder.build());
    }

    private String getMimeType(Uri uri) {
        String mimeType = null;
        if (uri.getScheme().equals(ContentResolver.SCHEME_CONTENT)) {
            ContentResolver cr = getContentResolver();
            mimeType = cr.getType(uri);
        } else {
            String fileExtension = MimeTypeMap.getFileExtensionFromUrl(uri.toString());
            mimeType = MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtension.toLowerCase());
        }
        return mimeType;
    }
    // 파일 이름을 가져오는 메소드

    private class FetchFileNameTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            String fileLocationUrl = params[0];
            String fileLocation = "";

            try {
                // 파일 위치 정보를 가져오는 HTTP 요청
                HttpURLConnection conn = (HttpURLConnection) new URL(fileLocationUrl).openConnection();
                conn.setRequestMethod("GET");

                int responseCode = conn.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    StringBuilder responseBuilder = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        responseBuilder.append(line);
                    }
                    fileLocation = responseBuilder.toString();
                    reader.close();

                    // 로그에 fileLocation 값 출력
                    Log.d("FetchFileNameTask", "Received file location: " + fileLocation);

                    if (fileLocation.isEmpty()) {
                        // 서버 응답이 비어 있을 경우
                        Log.e("FetchFileNameTask", "Empty response from server");
                        return null;
                    }

                    // JSON에서 파일 경로 추출
                    JSONObject jsonObject = new JSONObject(fileLocation);
                    String filePath = jsonObject.getString("filelocation");
                    fileName = new File(filePath).getName();

                    return fileName;
                } else {
                    Log.e("FetchFileNameTask", "HTTP response code: " + responseCode);
                    return null;
                }
            } catch (IOException | JSONException e) {
                Log.e("FetchFileNameTask", "Exception: " + e.toString());
                return null;
            }
        }

        @Override
        protected void onPostExecute(String result) {
            if (result != null) {
                // 파일 이름을 받아오고 나면 사용자가 파일을 저장할 위치를 선택하도록 요청
                String uniqueFileName = createUniqueFileName(result);
                openFilePicker(uniqueFileName);
            } else {
                Toast.makeText(BoardActivity2.this, "Error fetching file name", Toast.LENGTH_LONG).show();
            }
        }
    }




    // 추가: 사용자가 뒤로 버튼을 누르면 WebView의 브라우징 기록에서 뒤로 갑니다.
    @Override
    public void onBackPressed() {
        if (webViewPostContent.canGoBack()) {
            webViewPostContent.goBack();
        } else {
            super.onBackPressed();
        }
    }
}
