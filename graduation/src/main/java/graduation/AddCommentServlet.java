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
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/addcomment.do")
@MultipartConfig
public class AddCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String ftpHost = "www.shinhan-software.co.kr";
         int ftpPort = 21;
         String ftpUsername = "shinhan2023";
         String ftpPassword = "tmdcks15!";
         
         String jdbcURL = "jdbc:mariadb://localhost:3306/shinhan2023?useUnicode=true&characterEncoding=UTF-8";
         String jdbcUsername = "shinhan2023";
         String jdbcPassword = "tmdcks15!";
         Connection conn = null;
         
         FTPClient ftpClient = new FTPClient();
         ftpClient.setControlEncoding("UTF-8");
         request.setCharacterEncoding("UTF-8");
         response.setCharacterEncoding("UTF-8");
         InputStream fileInputStream = null;
         
        String uploadDirectory = "/tomcat/webapps/reply"; // 실제 파일을 저장할 경로로 변경
        
        String post_id = request.getParameter("post_id");
        String reauthor = request.getParameter("reauthor");
        String retitle = request.getParameter("retitle");
        String recontents = request.getParameter("recontents");
       

        try {
            Part filePart = request.getPart("refile");
            
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
                    conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "INSERT INTO reply(post_id, retitle, recontents, reauthor, created_at, refilelocation) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, post_id);
                    statement.setString(2, retitle);
                    statement.setString(3, recontents);
                    statement.setString(4, reauthor);
                    Date currentDate = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String created_at = dateFormat.format(currentDate);
                    statement.setString(5, created_at);                    
                    statement.setString(6, uploadDirectory + "/" + fileName);
                   
                    statement.executeUpdate();
                
                } else {
                    System.out.println("Failed to upload file to FTP server.");
                }
            } else {
                // 파일을 첨부하지 않은 경우
                String fileName = null; // 또는 fileName = ""
                
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "INSERT INTO reply(post_id, retitle, recontents, reauthor, created_at) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, post_id);
                statement.setString(2, retitle);
                statement.setString(3, recontents);
                statement.setString(4, reauthor);
                Date currentDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String created_at = dateFormat.format(currentDate);
                statement.setString(5, created_at);                 
                statement.executeUpdate();
                
             
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
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        String targetURL = "postlook.jsp?post_id=" + post_id;
        response.sendRedirect(targetURL);
    
        }
}
