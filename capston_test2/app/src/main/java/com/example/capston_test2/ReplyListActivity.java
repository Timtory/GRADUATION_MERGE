package com.example.capston_test2;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.view.View;
import android.widget.AdapterView;
import android.widget.TextView;
import android.widget.Toast;
import android.os.AsyncTask;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import android.util.Log;

public class ReplyListActivity extends Activity {
    private TextView textView;
    private final ArrayList<PostItem> listItems = new ArrayList<>();
    private ArrayAdapter<PostItem> adapter;
    private String postId;
    private Button commentButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reply_list);

        commentButton = findViewById(R.id.commentButton);
        textView = findViewById(R.id.TextView);
        ListView listView = findViewById(R.id.listView);
        adapter = new ArrayAdapter<>(this, R.layout.custom_list_item2, listItems);
        listView.setAdapter(adapter);

        Intent intent = getIntent();
        postId = intent.getStringExtra("re_postId");


        new RetrieveFeedTask().execute("http://shinhan-software.co.kr/mobile_reply_list.jsp?post_id=" + postId); // 수정된 URL을 사용하여 데이터를 가져옵니다.


        commentButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ReplyListActivity.this, Suggestion3.class);
                intent.putExtra("postId", postId);
                startActivity(intent);
            }
        });


    }



    private class PostItem {
        private final String displayText;
        private final String postId;

        public PostItem(String displayText, String postId) {
            this.displayText = displayText;
            this.postId = postId;
        }

        public String getDisplayText() {
            return displayText;
        }

        public String getPostId() {
            return postId;
        }

        @Override
        public String toString() {
            return displayText;
        }
    }

    private class RetrieveFeedTask extends AsyncTask<String, Void, String> {

        @Override
        protected String doInBackground(String... urls) {
            try {
                URL url = new URL(urls[0]);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");

                int responseCode = connection.getResponseCode();
                if (responseCode != HttpURLConnection.HTTP_OK) {
                    // 서버 오류 로깅 및 오류 문자열 반환
                    Log.e("RetrieveFeedTask", "HTTP error code: " + responseCode);
                    return "Server returned HTTP error code: " + responseCode;
                }

                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder stringBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    stringBuilder.append(line).append('\n'); // 개행 문자 추가
                }
                reader.close();
                return stringBuilder.toString();

            } catch (Exception e) {
                Log.e("RetrieveFeedTask", "Error ", e);
                return null; // null 반환시 처리 로직에 따라 사용자에게 알림
            }
        }

        @Override
        protected void onPostExecute(String result) {
            if (result == null) {
                Log.e("MyApp", "Result from server is null.");
                return;
            }

            try {
                JSONArray jsonArray = new JSONArray(result);
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);

                    String displayText = "작성자 : " + jsonObject.getString("reauthor") + " \n " +
                            "내용 : " + jsonObject.getString("recontents");

                    PostItem item = new PostItem(displayText, postId); // postId 사용
                    listItems.add(item);
                }
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        adapter.notifyDataSetChanged(); // UI 스레드에서 갱신
                    }
                });
            } catch (JSONException e) {
                e.printStackTrace();
                Log.e("MyApp", "Error parsing JSON", e);
                // 사용자에게 JSON 파싱 오류를 알릴 수 있음
            }


        }
    }


}