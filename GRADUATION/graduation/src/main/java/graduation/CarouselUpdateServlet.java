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



@WebServlet("/carousel.do") // 서블릿 URL을 변경
@MultipartConfig
public class CarouselUpdateServlet extends HttpServlet {
    @SuppressWarnings("resource")
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
        InputStream fileInputStream1 = null;
        InputStream fileInputStream2 = null;
        InputStream fileInputStream3 = null;
        InputStream fileInputStream4 = null;
        
        
        

        String uploadDirectory = "/tomcat/webapps/ROOT/picture";

        
        try {
        	Part filePart1 = request.getPart("carouselfile1");
                if(filePart1 != null && filePart1.getSize() > 0) {
                	fileInputStream1 = filePart1.getInputStream();
                	 ftpClient.connect(ftpHost, ftpPort);
                     ftpClient.login(ftpUsername, ftpPassword);
                     ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                     ftpClient.enterLocalPassiveMode();
                     
                     if (!ftpClient.changeWorkingDirectory(uploadDirectory)) {
                         // 디렉토리가 존재하지 않으면 생성
                         createDirectory(ftpClient, uploadDirectory);
                     }
                     String fileName1 = filePart1.getSubmittedFileName();
                     boolean uploaded1 = ftpClient.storeFile(uploadDirectory + "/" + fileName1, fileInputStream1);
                     if(uploaded1) {
                    	 System.out.println("ca1 upload complete");
                    	 Class.forName("org.mariadb.jdbc.Driver");
                         connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                         String fileName5 = filePart1.getSubmittedFileName();
                         String sql = "UPDATE carousel SET ca1=? WHERE num=1";
                         PreparedStatement statement = connection.prepareStatement(sql);
                         statement.setString(1, "picture/" + fileName5);
                         statement.executeUpdate();
                     }
                }
                     
                     
                     
                     Part filePart2 = request.getPart("carouselfile2");
                if(filePart2 != null && filePart2.getSize() > 0) {
                	fileInputStream2 = filePart2.getInputStream();
                	 ftpClient.connect(ftpHost, ftpPort);
                     ftpClient.login(ftpUsername, ftpPassword);
                     ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                     ftpClient.enterLocalPassiveMode();
                     if (!ftpClient.changeWorkingDirectory(uploadDirectory)) {
                         // 디렉토리가 존재하지 않으면 생성
                         createDirectory(ftpClient, uploadDirectory);
                     }
                     
                     String fileName2 = filePart2.getSubmittedFileName();
                     boolean uploaded2 = ftpClient.storeFile(uploadDirectory + "/" + fileName2, fileInputStream2);
                     if(uploaded2) {
                    	 System.out.println("ca2 upload complete");
                    	 Class.forName("org.mariadb.jdbc.Driver");
                         connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                         String fileName6 = filePart2.getSubmittedFileName();
                         String sql = "UPDATE carousel SET ca2=? WHERE num=1";
                         PreparedStatement statement = connection.prepareStatement(sql);
                         statement.setString(1, "picture/" + fileName6);
                         statement.executeUpdate();
                     }
                }
                
                Part filePart3 = request.getPart("carouselfile3");
              
                
                if(filePart3 != null && filePart3.getSize() > 0) {
                	fileInputStream3 = filePart3.getInputStream();
                	ftpClient.connect(ftpHost, ftpPort);
                    ftpClient.login(ftpUsername, ftpPassword);
                    ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                    ftpClient.enterLocalPassiveMode();
                    if (!ftpClient.changeWorkingDirectory(uploadDirectory)) {
                        // 디렉토리가 존재하지 않으면 생성
                        createDirectory(ftpClient, uploadDirectory);
                    }
                    
                    String fileName3 = filePart3.getSubmittedFileName();
                    boolean uploaded3 = ftpClient.storeFile(uploadDirectory + "/" + fileName3, fileInputStream3);
                    if(uploaded3) {
                    	System.out.println("ca3 upload complete");
                   	 Class.forName("org.mariadb.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                        String fileName7 = filePart3.getSubmittedFileName();
                        String sql = "UPDATE carousel SET ca3=? WHERE num=1";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setString(1, "picture/" + fileName7);
                        statement.executeUpdate();
                    }
                }
                
                Part filePart4 = request.getPart("carouselfile4");
                if(filePart4 != null && filePart4.getSize() > 0) {
                	fileInputStream4 = filePart4.getInputStream();
                	ftpClient.connect(ftpHost, ftpPort);
                    ftpClient.login(ftpUsername, ftpPassword);
                    ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
                    ftpClient.enterLocalPassiveMode();
                    if (!ftpClient.changeWorkingDirectory(uploadDirectory)) {
                        // 디렉토리가 존재하지 않으면 생성
                        createDirectory(ftpClient, uploadDirectory);
                    }
                    
                    String fileName4 = filePart4.getSubmittedFileName();
                    boolean uploaded4 = ftpClient.storeFile(uploadDirectory + "/" + fileName4, fileInputStream4);
                    if(uploaded4) {
                    	System.out.println("ca4 upload complete");
                      	 Class.forName("org.mariadb.jdbc.Driver");
                         connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                         String fileName8 = filePart4.getSubmittedFileName();
                         String sql = "UPDATE carousel SET ca4=? WHERE num=1";
                         PreparedStatement statement = connection.prepareStatement(sql);
                         statement.setString(1, "picture/" + fileName8);
                         statement.executeUpdate();
                    }
                
                
              
                } else {
                    System.out.println("Failed to upload file to FTP server.");
                }
            
        } catch (IOException | ServletException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (fileInputStream1 != null) {
                try {
                    fileInputStream1.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } 
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } 
            if (fileInputStream3 != null) {
                try {
                    fileInputStream3.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } 
            if (fileInputStream4 != null) {
                try {
                    fileInputStream4.close();
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

        response.sendRedirect("carouselSetting.jsp");
    
        }
 // 디렉토리 생성 함수
    private void createDirectory(FTPClient ftpClient, String directoryPath) throws IOException {
        if (!ftpClient.changeWorkingDirectory(directoryPath)) {
            boolean created = ftpClient.makeDirectory(directoryPath);
            if (created) {
                System.out.println("Created directory: " + directoryPath);
            } else {
                System.out.println("Failed to create directory: " + directoryPath);
            }
        }
    }
    }