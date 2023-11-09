package com.example.capston_test2;

import android.app.DownloadManager;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.DownloadListener;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebSettings;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class majorboard extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.majorboard);

        WebView webView = findViewById(R.id.webViewPostContent);
        WebSettings webSettings = webView.getSettings();

        // JavaScript를 활성화 (선택 사항)
        webSettings.setJavaScriptEnabled(true);

        // 웹 페이지가 웹 뷰 안에서 열리도록 설정
        webView.setWebViewClient(new WebViewClient());

        // 웹 뷰에 웹 페이지 로드
        webView.loadUrl("https://www.shinhan.ac.kr/bbs/ce/727/artclList.do");

        // 수평 스크롤 활성화
        webSettings.setUseWideViewPort(true);
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setBuiltInZoomControls(true);
        webSettings.setSupportZoom(true);

        // 스크롤바 표시
        webView.setHorizontalScrollBarEnabled(true);

    }


}
