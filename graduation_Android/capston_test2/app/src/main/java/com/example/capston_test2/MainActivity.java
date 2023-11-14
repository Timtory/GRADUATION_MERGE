package com.example.capston_test2;

import android.Manifest;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.TextView;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.firebase.FirebaseApp;
import com.google.firebase.messaging.FirebaseMessaging;

import org.json.JSONArray;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


public class MainActivity extends AppCompatActivity {
    private static final int REQ_PERMISSION_PUSH = 1; // 권한 요청 코드

    private static final int REQUEST_PERMISSIONS = 123;
    private static final int REQUEST_CODE_SAVE_FILE = 2;
    private static String[] PERMISSIONS_STORAGE = {
            android.Manifest.permission.READ_EXTERNAL_STORAGE,
            android.Manifest.permission.WRITE_EXTERNAL_STORAGE
    };

    private WebView webView; // WebView 선언

    private Button button1;
    private Button button2;
    private Button button3;
    private Button button4;
    private Button button5;
    private Button button6;
    private Button button7;
    private Button button8;
    private Button button9;
    private Button button10;
    private Button button11;
    private Button button12;
    private Button button13;
    private Button button15;

    private Button button19;
    private FloatingActionButton fabMain; // FloatingActionButton 선언
    private ExtendedFloatingActionButton  fabHw; // FloatingActionButton 선언
    private ExtendedFloatingActionButton  fabChatbot; // FloatingActionButton 선언
    private ExtendedFloatingActionButton fabEdit; // FloatingActionButton 선언

    //버튼 상태 변화 담을 변수
    private boolean isButtonsVisible = false;

    private static final String TAG = "MainActivity";

    private boolean fabMain_status = false;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_page);

        // WebView 초기화 및 설정
        webView = findViewById(R.id.webView);
        webView.getSettings().setLoadWithOverviewMode(true);
        webView.getSettings().setUseWideViewPort(true);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient());


        // 초기 화면 로딩할 URL 설정 (예: https://shinhan-software.co.kr/)
        String initialURL = "http://shinhan2023.cafe24.com/carousel.jsp";
        webView.loadUrl(initialURL);

        // FirebaseApp 초기화
        //FirebaseApp.initializeApp(this);

        // FCM 토큰 가져오기
        FirebaseMessaging.getInstance().getToken().addOnCompleteListener(task -> {
            if (!task.isSuccessful()) {
                Toast.makeText(getApplicationContext(), "FCM 토큰 가져오기 실패", Toast.LENGTH_SHORT).show();
                return;
            }

            // FCM 토큰 가져오기 성공
            String token = task.getResult();

            // 서버로 토큰 전송
            sendRegistrationToServer(token);
        });


        // 플로팅 버튼 초기화
        fabMain = findViewById(R.id.fabMain);
        fabEdit = findViewById(R.id.fabEdit);
        fabChatbot = findViewById(R.id.fabChatbot);
        fabHw = findViewById(R.id.fabHw);

        // 플로팅 버튼 클릭 시 파일제출, 챗봇, 건의사항 버튼 나온다
        fabMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggleFab();
            }
        });

        //건의사항 프로팅 버튼
        fabEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "건의사항 작성 페이지로 이동합니다.", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(MainActivity.this, Suggestion.class);
                // 새 액티비티 시작
                startActivity(intent);

            }
        });
        //챗봇 플로팅버튼
        fabChatbot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "쳇봇 페이지로 이동합니다.", Toast.LENGTH_SHORT).show();

                // 웹 사이트 URL 설정
                String websiteURL = "https://frogue.danbee.ai/?chatbot_id=fa4ad435-48dc-4bed-ba40-b02848ed6ffd"; // 원하는 웹 사이트 주소로 변경

                // 웹 사이트 열기
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(websiteURL));
                startActivity(intent);


            }
        });
        //파일제출 플로팅버튼
        fabHw.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(MainActivity.this, "파일제출 게시판으로 이동합니다.", Toast.LENGTH_SHORT).show();
                String buttonText = fabHw.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity2.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);

            }
        });

        //공지사항버튼
        button19 = findViewById(R.id.button19); // 버튼의 ID를 찾습니다.
        button19.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button19.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼 1(전체게시판 버튼)
        button1 = findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button1.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //인기게시판
        button15 = findViewById(R.id.button15);
        button15.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button15.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼13 (학과게시판 버튼)
        button13 = findViewById(R.id.button13); // 버튼의 ID를 찾습니다.
        button13.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 여기서 SoftwareBoardActivity는 당신이 이동하길 원하는 대상 액티비티입니다.
                // 이 클래스가 실제로 존재하고, AndroidManifest.xml에 정의되어 있어야 합니다.
                Intent intent = new Intent(MainActivity.this, majorboard.class);

                // 새 액티비티 시작
                startActivity(intent);
            }
        });

        //버튼5 (학사 버튼)
        button5 = findViewById(R.id.button5);
        button5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button5.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼 2(장학 버튼)
        button2 = findViewById(R.id.button2);
        button2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button2.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼6 (학생회, 동아리 버튼)
        button6 = findViewById(R.id.button6);
        button6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button6.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼 3(휴복학 버튼)
        button3 = findViewById(R.id.button3);
        button3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button3.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼7 (취창업 버튼)
        button7 = findViewById(R.id.button7);
        button7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button7.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼4 (교육행사 버튼)
        button4 = findViewById(R.id.button4);
        button4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button4.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        //버튼8 (전체학년 버튼)
        button8 = findViewById(R.id.button8);

        button9 = findViewById(R.id.button9);
        button10 = findViewById(R.id.button10);
        button11 = findViewById(R.id.button11);
        button12 = findViewById(R.id.button12);

        //버튼 8 눌렀을 때 효과
        button8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isButtonsVisible) {
                    // 버튼 8 클릭 시 버튼 9, 10, 11, 12를 부드럽게 사라지게 설정
                    fadeOut(button9);
                    fadeOut(button10);
                    fadeOut(button11);
                    fadeOut(button12);
                    isButtonsVisible = false;
                } else {
                    // 버튼 8 클릭 시 버튼 9, 10, 11, 12를 부드럽게 나타나게 설정
                    fadeIn(button9);
                    fadeIn(button10);
                    fadeIn(button11);
                    fadeIn(button12);
                    isButtonsVisible = true;
                }
            }
        });

        button9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button9.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        button10.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button10.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        button11.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button11.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });

        button12.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 클릭된 버튼의 텍스트 가져오기
                String buttonText = button12.getText().toString();

                // Intent를 통해 ListActivity로 이동하고 텍스트 데이터 전달
                Intent intent = new Intent(MainActivity.this, ListActivity.class);
                intent.putExtra("buttonText", buttonText);
                startActivity(intent);
            }
        });



        // AsyncTask를 사용하여 JSP 페이지에서 데이터를 비동기적으로 가져옵니다.
        new RetrieveDataFromJSP().execute();

    }//onCreate() 끝


    // 플로팅 액션 버튼 클릭시 애니메이션 효과
    public void toggleFab() {
        if(fabMain_status) {
            // 플로팅 액션 버튼 닫기
            // 애니메이션 추가
            ObjectAnimator fc_animation = ObjectAnimator.ofFloat(fabHw, "translationY", 0f);
            fc_animation.start();
            ObjectAnimator fe_animation = ObjectAnimator.ofFloat(fabEdit, "translationY", 0f);
            fe_animation.start();
            ObjectAnimator fd_animation = ObjectAnimator.ofFloat(fabChatbot, "translationY", 0f);
            fd_animation.start();
            // 메인 플로팅 이미지 변경
            fabMain.setImageResource(R.drawable.round_add_circle_24);

            // 버튼들 부드럽게 감추기
            fadeOut(fabHw);
            fadeOut(fabChatbot);
            fadeOut(fabEdit);

        } else {
            // 플로팅 액션 버튼 열기
            ObjectAnimator fc_animation = ObjectAnimator.ofFloat(fabHw, "translationY", -200f);
            fc_animation.start();
            ObjectAnimator fe_animation = ObjectAnimator.ofFloat(fabEdit, "translationY", -400f);
            fe_animation.start();
            ObjectAnimator fd_animation = ObjectAnimator.ofFloat(fabChatbot, "translationY", -600f);
            fd_animation.start();
            // 메인 플로팅 이미지 변경
            fabMain.setImageResource(R.drawable.sharp_cancel_24);

            // 버튼들 부드럽게 보이기
            fadeIn(fabHw);
            fadeIn(fabChatbot);
            fadeIn(fabEdit);
        }

        // 플로팅 버튼 상태 변경
        fabMain_status = !fabMain_status;
        fabMain.setCompatElevation(0);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            fabHw.setElevation(0);
            fabEdit.setElevation(0);
            fabChatbot.setElevation(0);
        }
    }




    //토큰 값 보내기
    @SuppressLint("StaticFieldLeak")
    private void sendRegistrationToServer(String token) {
        new AsyncTask<String, Void, Void>() {
            @Override
            protected Void doInBackground(String... params) {
                String token = params[0];
                HttpURLConnection connection = null;
                try {
                    URL url = new URL("http://shinhan-software.co.kr/mobile_token.jsp");
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                    connection.setDoOutput(true);
                    connection.setConnectTimeout(10000); // 10초 타임아웃
                    connection.setReadTimeout(10000); // 10초 타임아웃

                    // POST 데이터 구성
                    String postData = URLEncoder.encode("token", "UTF-8") + "=" + URLEncoder.encode(token, "UTF-8");

                    // 데이터 전송
                    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(connection.getOutputStream()));
                    writer.write(postData);
                    writer.flush();
                    writer.close();

                    int responseCode = connection.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        Log.d(TAG, "Token registration successful");
                    } else {
                        Log.d(TAG, "Token registration failed with code: " + responseCode);
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
    }




    // 부드럽게 나타나게 하는 함수 정의 (onCreate 메서드 밖에서 정의)
    private void fadeIn(View view) {
        view.setVisibility(View.VISIBLE); // 뷰를 먼저 보이게 설정
        AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        alphaAnimation.setDuration(500); // 애니메이션 지속 시간 (1초)
        view.startAnimation(alphaAnimation);
    }

    private void fadeOut(View view) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setDuration(500); // 애니메이션 지속 시간 (0.5초)
        alphaAnimation.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationStart(Animation animation) {}

            @Override
            public void onAnimationEnd(Animation animation) {
                view.setVisibility(View.INVISIBLE);
            }

            @Override
            public void onAnimationRepeat(Animation animation) {}
        });
        view.startAnimation(alphaAnimation);
    }


    // 이번주 3줄 요약 작성 칸
    private class RetrieveDataFromJSP extends AsyncTask<Void, Void, ArrayList<String>> {
        @Override
        protected ArrayList<String> doInBackground(Void... params) {
            ArrayList<String> data = new ArrayList<>();

            try {
                String jspUrl = "http://www.shinhan-software.co.kr/mobile_3line.jsp";
                URL url = new URL(jspUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();

                int responseCode = connection.getResponseCode();

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    StringBuilder response = new StringBuilder();
                    String line;

                    while ((line = reader.readLine()) != null) {
                        response.append(line);
                    }

                    JSONArray jsonArray = new JSONArray(response.toString());

                    for (int i = 0; i < jsonArray.length(); i++) {
                        String s1 = jsonArray.getJSONObject(i).getString("s1");
                        String s2 = jsonArray.getJSONObject(i).getString("s2");
                        String s3 = jsonArray.getJSONObject(i).getString("s3");
                        data.add(s1 + ", " + s2 + ", " + s3);
                    }
                }

                connection.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }

            return data;
        }

        @Override
        protected void onPostExecute(ArrayList<String> result) {
            if (result.size() >= 1) {
                String s1S2S3 = result.get(0);

                // Split the s1S2S3 string into separate s1, s2, and s3 values
                String[] s1S2S3Array = s1S2S3.split(", ");

                if (s1S2S3Array.length >= 3) {
                    String s1 = s1S2S3Array[0];
                    String s2 = s1S2S3Array[1];
                    String s3 = s1S2S3Array[2];

                    // TextViews
                    TextView textView3 = findViewById(R.id.textView3);
                    TextView textView4 = findViewById(R.id.textView4);
                    TextView textView5 = findViewById(R.id.textView5);

                    // Set values
                    textView3.setText(s1);
                    textView4.setText(s2);
                    textView5.setText(s3);
                }
            }
        }
    }

}

