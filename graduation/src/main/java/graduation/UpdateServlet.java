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

@WebServlet("/update.do")
@MultipartConfig
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ftpHost = "www.shinhan-software.co.kr";
        int ftpPort = 21;
        String ftpUsername = "shinhan2023";
        String ftpPassword = "tmdcks15!";

        String jdbcURL = "jdbc:mariadb://localhost:3306/shinhan2023";
        String jdbcUsername = "shinhan2023";
        String jdbcPassword = "tmdcks15!";
        Connection connection = null;

        FTPClient ftpClient = new FTPClient();
        ftpClient.setControlEncoding("UTF-8");
        InputStream fileInputStream = null;

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String uploadDirectory = "/tomcat/webapps/upload";

        // 폼에서 전송된 데이터 가져오기
        String postId = request.getParameter("post_id");
        String title = request.getParameter("new_title");
        String contents = request.getParameter("new_contents");
        String tag = request.getParameter("new_tag");
        String grade1 = request.getParameter("new_grade1");
        String grade2 = request.getParameter("new_grade2");
        String grade3 = request.getParameter("new_grade3");
        String grade4 = request.getParameter("new_grade4");
        String gradeall = request.getParameter("new_gradeall");
        String alert = request.getParameter("alert");

        // 파일 업로드 부분 수정
        try {
            Part filePart = request.getPart("uploadFile");
            String fileName = filePart.getSubmittedFileName();
            
            if (fileName != null && !fileName.isEmpty()) {
                // Set up the FTP connection
                ftpClient.connect(ftpHost, ftpPort);
                ftpClient.login(ftpUsername, ftpPassword);
                ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                ftpClient.enterLocalPassiveMode();

                // Upload the new file to the FTP server
                boolean uploaded = ftpClient.storeFile(uploadDirectory + "/" + fileName, filePart.getInputStream());

                if (uploaded) {
                    // 파일 업로드 후 데이터베이스에 파일 정보 업데이트
                    Class.forName("org.mariadb.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "UPDATE jdbc_test SET title=?, contents=?, tag=?, grade1=?, grade2=?, grade3=?, grade4=?, gradeall=?, filelocation=?, alert=? WHERE post_id=?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, title);
                    statement.setString(2, contents);
                    statement.setString(3, tag);
                    statement.setString(4, grade1);
                    statement.setString(5, grade2);
                    statement.setString(6, grade3);
                    statement.setString(7, grade4);
                    statement.setString(8, gradeall);
                    statement.setString(9, uploadDirectory + "/" + fileName);
                    statement.setString(10, alert);
                    statement.setString(11, postId);
                    statement.executeUpdate();
                } else {
                    System.out.println("Failed to upload the new file.");
                }
            } else {
                // 파일을 업로드하지 않은 경우에 대한 업데이트
                Class.forName("org.mariadb.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "UPDATE jdbc_test SET title=?, contents=?, tag=?, grade1=?, grade2=?, grade3=?, grade4=?, gradeall=?, alert=? WHERE post_id=?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, contents);
                statement.setString(3, tag);
                statement.setString(4, grade1);
                statement.setString(5, grade2);
                statement.setString(6, grade3);
                statement.setString(7, grade4);
                statement.setString(8, gradeall);
                statement.setString(9, alert);
                statement.setString(10, postId);
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
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        response.sendRedirect("total_list.jsp");
    }
}