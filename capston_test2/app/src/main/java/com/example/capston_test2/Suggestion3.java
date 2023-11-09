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


public class Suggestion3 extends AppCompatActivity {

    private EditText editTextContents, editTextAuthor;
    private Button submitButton;
    private static final int PICK_FILE_REQUEST_CODE = 1;
    private static final int PERMISSION_REQUEST_STORAGE = 2;
    private String postId;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.suggestion2);

        Intent intent = getIntent();
        postId = intent.getStringExtra("postId");


        editTextContents = findViewById(R.id.editTextPostContent);
        editTextAuthor = findViewById(R.id.editTextAuthor);
        submitButton = findViewById(R.id.buttonSubmitPost);

        submitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String recontents = editTextContents.getText().toString().trim();
                String reauthor = editTextAuthor.getText().toString().trim();


                if (recontents.isEmpty()) {
                    Toast.makeText(Suggestion3.this, "내용을 입력해주세요.", Toast.LENGTH_SHORT).show();
                    // 내용 필드로 포커스 이동
                    editTextContents.requestFocus();
                    return; // 검사에 실패하면 여기서 메서드 종료
                }

                if (reauthor.isEmpty()) {
                    Toast.makeText(Suggestion3.this, "작성자를 입력해주세요.", Toast.LENGTH_SHORT).show();
                    // 작성자 필드로 포커스 이동
                    editTextAuthor.requestFocus();
                    return; // 검사에 실패하면 여기서 메서드 종료
                }

                // 모든 검증이 통과되면 서버로 데이터를 전송합니다.
                new SendPostDataTask().execute(postId, reauthor,  recontents);
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


    private class SendPostDataTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... params) {
            try {
                String postId = params[0];
                String reauthor = params[1];
                String recontents = params[2];



                //이거 수정해야함
                URL url = new URL("http://shinhan-software.co.kr/mobile_suggest3.jsp"); // 실제 URL로 변경 필요
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);


                OutputStream os = conn.getOutputStream();
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));

                // 서버로 전송할 POST 데이터 구성
                String postData =URLEncoder.encode("postId", "UTF-8") + "=" + URLEncoder.encode(postId, "UTF-8") +
                        "&" + URLEncoder.encode("reauthor", "UTF-8") + "=" + URLEncoder.encode(reauthor, "UTF-8") +
                        "&" + URLEncoder.encode("recontents", "UTF-8") + "=" + URLEncoder.encode(recontents, "UTF-8");
                /* "&" + URLEncoder.encode("filelocation", "UTF-8") + "=" + URLEncoder.encode(selectedFileName, "UTF-8"); // 파일 이름을 'filelocation' 파라미터로 전송*/



                writer.write(postData);
                writer.flush();
                writer.close();
                os.close();

                int responseCode = conn.getResponseCode(); // 이 위치로 이동했습니다.




                return "Server's response: " + responseCode + "; ";
            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }

        }


        @Override
        protected void onPostExecute(String result) {
            super.onPostExecute(result);

            // 서버 응답이 성공적인지 확인합니다. 여기서는 예를 들어 응답 코드가 200인지 확인합니다.
            if (result.contains("Server's response: 200")) { // HTTP 상태 코드 200은 성공을 의미합니다.
                // 성공 메시지를 표시하고 메인 액티비티로 이동합니다.
                Toast.makeText(Suggestion3.this, "댓글이 등록되었습니다.", Toast.LENGTH_LONG).show();
                // postId 값을 인텐트에 추가
                Intent intent = new Intent(Suggestion3.this, ReplyListActivity.class);
                intent.putExtra("re_postId", postId); // postId 값을 전달
                startActivity(intent);
                finish();
            } else {
                // 서버 응답이 실패하면 오류 메시지를 표시합니다.
                Toast.makeText(Suggestion3.this, "오류 발생: " + result, Toast.LENGTH_LONG).show();
            }
        }
    }
}