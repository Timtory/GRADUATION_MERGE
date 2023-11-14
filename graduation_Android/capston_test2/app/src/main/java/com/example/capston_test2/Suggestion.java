package com.example.capston_test2;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.OpenableColumns;
import android.provider.Settings;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.jetbrains.annotations.NotNull;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import android.Manifest;


//그냥 건의사항.java
public class Suggestion extends AppCompatActivity {

    private EditText editTextTitle, editTextContents, editTextAuthor;
    private Button submitButton, buttonChooseFile;
    private TextView textViewFilePath;
    private Uri selectedFileUri = null;
    private String selectedFileName = ""; // 추가: 파일 이름을 저장할 문자열 변수

    private Button buttonRemoveFile; // 파일 제거 버튼
    private static final int PICK_FILE_REQUEST_CODE = 1;
    private static final int PERMISSION_REQUEST_STORAGE = 2;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.suggestion);

        editTextTitle = findViewById(R.id.editTextPostTitle);
        editTextContents = findViewById(R.id.editTextPostContent);
        editTextAuthor = findViewById(R.id.editTextAuthor);
        submitButton = findViewById(R.id.buttonSubmitPost);
        buttonChooseFile = findViewById(R.id.buttonChooseFile);
        textViewFilePath = findViewById(R.id.textViewFilePath);
        buttonRemoveFile = findViewById(R.id.buttonRemoveFile);

        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String title = editTextTitle.getText().toString().trim(); // trim()을 사용하여 불필요한 공백 제거
                String contents = editTextContents.getText().toString().trim();
                String author = editTextAuthor.getText().toString().trim();

                if (title.isEmpty()) {
                    Toast.makeText(Suggestion.this, "제목을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    // 제목 필드로 포커스 이동
                    editTextTitle.requestFocus();
                    return; // 검사에 실패하면 여기서 메서드 종료
                }

                if (contents.isEmpty()) {
                    Toast.makeText(Suggestion.this, "내용을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    // 내용 필드로 포커스 이동
                    editTextContents.requestFocus();
                    return; // 검사에 실패하면 여기서 메서드 종료
                }

                if (author.isEmpty()) {
                    Toast.makeText(Suggestion.this, "작성자를 입력해주세요.", Toast.LENGTH_SHORT).show();
                    // 작성자 필드로 포커스 이동
                    editTextAuthor.requestFocus();
                    return; // 검사에 실패하면 여기서 메서드 종료
                }

                // 모든 검증이 통과되면 서버로 데이터를 전송합니다.
                new SendPostDataTask().execute(title, contents, author);
            }
        });

        buttonChooseFile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (Build.VERSION.SDK_INT >= 31) {
                    // Android 13 (API level 31) 이상인 경우 새로운 권한 요청 방식을 사용합니다.
                    if (!Environment.isExternalStorageManager()) {
                        // MANAGE_EXTERNAL_STORAGE 권한을 요청합니다.
                        Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
                        Uri uri = Uri.fromParts("package", getPackageName(), null);
                        intent.setData(uri);
                        startActivity(intent);
                    } else {
                        // 이미 권한이 있으면 파일 선택기를 여는 기존 메서드를 호출합니다.
                        openFilePicker();
                    }
                } else {
                    // Android 13 미만인 경우 기존의 권한 확인 로직을 실행합니다.
                    if (ContextCompat.checkSelfPermission(Suggestion.this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
                        ActivityCompat.requestPermissions(Suggestion.this, new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, PERMISSION_REQUEST_STORAGE);
                    } else {
                        openFilePicker();
                    }
                }
            }
        });
        buttonRemoveFile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 첨부된 파일 정보 및 URI 초기화
                selectedFileUri = null; // 이 부분이 중요합니다. 파일 참조를 null로 변경하여 실제로 파일 선택이 해제되도록 합니다.
                selectedFileName = ""; // 파일 이름도 초기화합니다.

                textViewFilePath.setText("선택된 파일 없음");

                // 파일 제거 버튼 숨기기
                buttonRemoveFile.setVisibility(View.GONE);
            }
        });
    }

    private void openFilePicker() {
        Intent chooseFileIntent = new Intent(Intent.ACTION_GET_CONTENT);
        chooseFileIntent.setType("*/*");
        chooseFileIntent.addCategory(Intent.CATEGORY_OPENABLE);
        try {
            startActivityForResult(
                    Intent.createChooser(chooseFileIntent, "Select a File to Upload"),
                    PICK_FILE_REQUEST_CODE);
        } catch (android.content.ActivityNotFoundException ex) {
            // Potentially handle the exception here
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NotNull String[] permissions, @NotNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSION_REQUEST_STORAGE) {
            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // 권한이 허용됨
                openFilePicker();
            } else {
                // 권한 거부됨
                Toast.makeText(this, "Permission Denied!", Toast.LENGTH_SHORT).show();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == PICK_FILE_REQUEST_CODE && resultCode == RESULT_OK && data != null && data.getData() != null) {
            selectedFileUri = data.getData();
            // 파일 제거 버튼을 사용자에게 보이게 합니다.
            buttonRemoveFile.setVisibility(View.VISIBLE);
            Cursor cursor = null;
            try {
                cursor = getContentResolver().query(selectedFileUri, null, null, null, null);
                if (cursor != null && cursor.moveToFirst()) {
                    int nameIndex = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                    if (nameIndex != -1) {
                        selectedFileName = cursor.getString(nameIndex);  // 파일 이름 저장
                        textViewFilePath.setText("Selected File: " + selectedFileName);
                    }
                }
            } finally {
                if (cursor != null) {
                    cursor.close();
                }
            }
        }
    }

    private class SendPostDataTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            try {
                String title = params[0];
                String contents = params[1];
                String author = params[2];



                URL url = new URL("http://shinhan-software.co.kr/mobile_suggest.jsp"); // 실제 URL로 변경 필요
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);


                OutputStream os = conn.getOutputStream();
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));

                // 서버로 전송할 POST 데이터 구성
                String postData = URLEncoder.encode("title", "UTF-8") + "=" + URLEncoder.encode(title, "UTF-8") +
                        "&" + URLEncoder.encode("contents", "UTF-8") + "=" + URLEncoder.encode(contents, "UTF-8") +
                        "&" + URLEncoder.encode("author", "UTF-8") + "=" + URLEncoder.encode(author, "UTF-8") ;
                /* "&" + URLEncoder.encode("filelocation", "UTF-8") + "=" + URLEncoder.encode(selectedFileName, "UTF-8"); // 파일 이름을 'filelocation' 파라미터로 전송*/

                if (selectedFileUri != null) {
                    postData += "&" + URLEncoder.encode("filelocation", "UTF-8") + "=" + URLEncoder.encode(selectedFileName, "UTF-8");
                } else {
                    postData += "&" + URLEncoder.encode("filelocation", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8");
                }


                writer.write(postData);
                writer.flush();
                writer.close();
                os.close();

                int responseCode = conn.getResponseCode(); // 이 위치로 이동했습니다.

                String ftpUploadResult = "File not selected"; // 파일이 선택되지 않았다는 기본 메시지

                // 파일이 선택되었다면 업로드를 시도합니다.
                if (selectedFileUri != null) {
                    try {
                        ftpUploadResult = uploadFileViaFTP(selectedFileName, selectedFileUri);
                    } catch (Exception e) {
                        ftpUploadResult = "FTP upload failed: " + e.getMessage();
                    }
                }


                return "Server's response: " + responseCode + "; " + ftpUploadResult;
            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }

        }
        private String uploadFileViaFTP(String fileName, Uri fileUri) throws IOException {
            String server = "www.shinhan-software.co.kr"; // FTP 서버 주소
            int port = 21; // 포트 번호, 기본은 21번
            String user = "shinhan2023"; // FTP 사용자명
            String pass = "tmdcks15!"; // FTP 비밀번호

            FTPClient ftpClient = new FTPClient();

            try {
                ftpClient.connect(server, port);
                ftpClient.login(user, pass);
                ftpClient.enterLocalPassiveMode(); // 중요: 몇몇 네트워크에서 필요한 설정

                // UTF-8을 사용하도록 FTP 클라이언트 설정
                ftpClient.setControlEncoding("UTF-8");
                // 서버에 UTF-8을 사용할 것임을 알립니다. 이 명령이 실패하면 서버가 UTF-8을 지원하지 않는 것일 수 있습니다.
                ftpClient.sendCommand("OPTS UTF8 ON");

                ftpClient.setFileType(FTP.BINARY_FILE_TYPE); // 바이너리 파일로 설정

                InputStream inputStream = getContentResolver().openInputStream(fileUri);

                // 파일 이름을 UTF-8로 인코딩합니다.
                // 서버가 UTF-8을 정확히 지원하는지 확인해야 합니다. 일부 서버는 이 설정을 무시할 수 있습니다.
                String encodedFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");

                boolean result = ftpClient.storeFile("/tomcat/webapps/upload/" + encodedFileName, inputStream); // FTP 서버 내 저장될 경로
                inputStream.close();

                if (result) {
                    return "File is uploaded successfully";
                } else {
                    return "Failed to upload the file";
                }
            } finally {
                try {
                    if (ftpClient.isConnected()) {
                        ftpClient.logout();
                        ftpClient.disconnect();
                    }
                } catch (IOException ex) {
                    // do nothing
                }
            }
        }

        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            // 서버 응답이 성공적인지 확인합니다. 여기서는 예를 들어 응답 코드가 200인지 확인합니다.
            if (result.contains("Server's response: 200")) { // HTTP 상태 코드 200은 성공을 의미합니다.
                // 성공 메시지를 표시하고 메인 액티비티로 이동합니다.
                Toast.makeText(Suggestion.this, "건의사항이 등록되었습니다.", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(Suggestion.this, MainActivity.class);
                startActivity(intent);
                finish();
            } else {
                // 서버 응답이 실패하면 오류 메시지를 표시합니다.
                Toast.makeText(Suggestion.this, "오류 발생: " + result, Toast.LENGTH_LONG).show();
            }
        }
    }
}