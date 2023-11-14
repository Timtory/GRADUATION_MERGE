package graduation;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/upload2.do") // 서블릿 URL을 변경
@MultipartConfig
public class UploadServlet12 extends HttpServlet {
	
	public void init() throws ServletException {
        // 서블릿 초기화 시 Firebase Admin SDK 초기화
        try {
            InputStream refreshToken = UploadServlet12.class.getClassLoader().getResourceAsStream("/service-account-file.json");
            FirebaseOptions options = FirebaseOptions.builder()
                .setCredentials(GoogleCredentials.fromStream(refreshToken))
                .build();
            FirebaseApp.initializeApp(options);
        } catch (IOException e) {
            throw new ServletException("Firebase Admin SDK initialization failed", e);
        }
    }
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
        String ftpHost = "www.shinhan-software.co.kr";
        int ftpPort = 21;
        String ftpUsername = "shinhan2023";
        String ftpPassword = "tmdcks15!";
        
        String jdbcURL = "jdbc:mariadb://localhost:3306/shinhan2023?useUnicode=true&characterEncoding=UTF-8";
        String jdbcUsername = "shinhan2023";
        String jdbcPassword = "tmdcks15!";
        Connection connection = null;
        
        FTPClient ftpClient = new FTPClient();
        ftpClient.setControlEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        InputStream fileInputStream = null;
        

        String uploadDirectory = "/tomcat/webapps/upload";

        String title = request.getParameter("title");
        String contents = request.getParameter("contents");
        if (contents != null) {
     	   contents = contents.replaceAll("<p>", "").replaceAll("</p>", "\n");  // <p> 태그를 제거하고 </p> 태그를 줄바꿈으로 대체합니다.
     		}
        String author = request.getParameter("author");
        String tag = request.getParameter("tag");
        String grade1 = request.getParameter("grade1");
        String grade2 = request.getParameter("grade2");
        String grade3 = request.getParameter("grade3");
        String grade4 = request.getParameter("grade4");
        String gradeall = request.getParameter("gradeall");
        String alert = request.getParameter("alert");
        
        try {
            Part filePart = request.getPart("uploadFile");
            
            if (filePart != null && filePart.getSize() > 0) {
                fileInputStream = filePart.getInputStream();
             
                // Set up the FTP connection
                ftpClient.connect(ftpHost, ftpPort);
                ftpClient.login(ftpUsername, ftpPassword);
                ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                ftpClient.enterLocalPassiveMode();
                String fileName = filePart.getSubmittedFileName();
               
                
                boolean uploaded = ftpClient.storeFile(uploadDirectory + "/" + fileName, fileInputStream);

                if (uploaded) {
                    System.out.println("File uploaded successfully to FTP server.");
                    
                    // 파일 업로드 후 데이터베이스에 파일 정보 저장
                    Class.forName("org.mariadb.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "INSERT INTO jdbc_test(title, contents, author, ctime, tag, grade1, grade2, grade3, grade4, gradeall, filelocation, alert) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, title);
                    statement.setString(2, contents);
                    statement.setString(3, author);
                    Date currentDate = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String formattedDate = dateFormat.format(currentDate);
                    statement.setString(4, formattedDate);
                    statement.setString(5, tag);
                    statement.setString(6, grade1);
                    statement.setString(7, grade2);
                    statement.setString(8, grade3);
                    statement.setString(9, grade4);
                    statement.setString(10, gradeall);
                    
                    statement.setString(11, uploadDirectory + "/" + fileName);
                    statement.setString(12, alert);
                    statement.executeUpdate();
                    
                 // alert 값이 'true'인 경우 FCM 메시지 보내기
                    if ("true".equalsIgnoreCase(alert)) {
                        // FCM 메시지 보내는 코드를 추가
                        sendFCMNotification(title);
                    }
                    
                } else {
                    System.out.println("Failed to upload file to FTP server.");
                }
            } else {
                // 파일을 첨부하지 않은 경우
                String fileName = null; // 또는 fileName = ""
                
                Class.forName("org.mariadb.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "INSERT INTO jdbc_test(title, contents, author, ctime, tag, grade1, grade2, grade3, grade4, gradeall, filelocation, alert) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, contents);
                statement.setString(3, author);
                Date currentDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String formattedDate = dateFormat.format(currentDate);
                statement.setString(4, formattedDate);
                statement.setString(5, tag);
                statement.setString(6, grade1);
                statement.setString(7, grade2);
                statement.setString(8, grade3);
                statement.setString(9, grade4);
                statement.setString(10, gradeall);
                statement.setString(11, fileName);
                statement.setString(12, alert);
                statement.executeUpdate();
                
             // alert 값이 'true'인 경우 FCM 메시지 보내기
                if ("true".equalsIgnoreCase(alert)) {
                    // FCM 메시지 보내는 코드를 추가
                    sendFCMNotification(title);
                }
                
            }
        } catch (IOException | ServletException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (ftpClient.isConnected()) {
                try {
                    ftpClient.logout();
                    ftpClient.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                }
                catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("total_list.jsp");
    
        }
    
    
    
    
    private void sendFCMNotification(String message) {
        // FCM 메시지를 보내는 코드를 작성
        // Firebase Admin SDK를 사용하여 FCM 메시지를 보낼 수 있습니다
        // 이 부분에서 Firebase Admin SDK를 초기화하고 FCM 메시지를 생성하여 보내는 코드를 작성해야 합니다
        // 이전 질문에서 Firebase Admin SDK를 사용하여 FCM 메시지를 보내는 방법을 설명했습니다.
        // 해당 코드를 참고하여 FCM 메시지를 보내세요.
    	
    	
    	// JSON 키 파일의 경로
    	// String jsonKeyPath = "json/service-account-file.json";
    	
    	
    		
            // Firebase Admin SDK 초기화
    		//String filePath = getServletContext().getRealPath("/service-account-file.json");
    		//InputStream serviceAccount = new FileInputStream(filePath);

    		//InputStream serviceAccount = UploadServlet12.class.getClassLoader().getResourceAsStream("service-account-file.json");
            
    		
    		//FileInputStream refreshToken = new FileInputStream("service-account-file.json");
    		//InputStream refreshToken = UploadServlet12.class.getClassLoader().getResourceAsStream("/service-account-file.json");

    		//FirebaseOptions options = FirebaseOptions.builder()
    		//    .setCredentials(GoogleCredentials.fromStream(refreshToken))
    		//    .setProjectId("748400387190")
    		//    .build();

    		//FirebaseApp.initializeApp(options);
		
            // FCM 알림 생성
    	// 데이터베이스 연결 정보 설정
        String url = "jdbc:mariadb://localhost:3306/shinhan2023";
        String username = "shinhan2023";
        String password = "tmdcks15!";

        try {
            Connection connection = DriverManager.getConnection(url, username, password);

            // 토큰을 가져올 쿼리 작성
            String query = "SELECT tokenid FROM token";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();

            // 결과를 이용하여 FCM 알림 생성 및 전송
            while (resultSet.next()) {
                String token = resultSet.getString("tokenid");

                Message message1 = Message.builder()
                        .setToken(token)
                        .setNotification(Notification.builder()
                                .setTitle("공지사항")
                                .setBody(message)
                                .build())
                        .build();

                try {
                    String response = FirebaseMessaging.getInstance().send(message1);
                    System.out.println("fcm alert send complete: " + response);
                } catch (FirebaseMessagingException e) {
                    System.err.println("fcm alert send fail: " + e.getMessage());
                }
            }

            // 연결 종료
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
    }
