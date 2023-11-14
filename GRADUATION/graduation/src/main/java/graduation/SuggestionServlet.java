package graduation;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/suggestup.do") // 서블릿 URL을 변경
@MultipartConfig
public class SuggestionServlet extends HttpServlet {
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
        
        try {
            Part filePart = request.getPart("suggestionfile");
            
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

                    String sql = "INSERT INTO suggestion(title, contents, author, ctime, filelocation) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, title);
                    statement.setString(2, contents);
                    statement.setString(3, author);
                    Date currentDate = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                    String formattedDate = dateFormat.format(currentDate);
                    statement.setString(4, formattedDate);
                    statement.setString(5, uploadDirectory + "/" + fileName);         
                    statement.executeUpdate();
                } else {
                    System.out.println("Failed to upload file to FTP server.");
                }
            } else {
                // 파일을 첨부하지 않은 경우
                String fileName = null; // 또는 fileName = ""
                
             // 파일 업로드 후 데이터베이스에 파일 정보 저장
                Class.forName("org.mariadb.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "INSERT INTO suggestion(title, contents, author, ctime, filelocation) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, contents);
                statement.setString(3, author);
                Date currentDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String formattedDate = dateFormat.format(currentDate);
                statement.setString(4, formattedDate);
                statement.setString(5, fileName);         
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
            if (connection != null) {
                try {
                    connection.close();
                }
                catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("total_list_Student.jsp");
    }
}
