<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.net.ftp.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 다운로드</title>
</head>
<body>
    <h1>파일 다운로드 페이지</h1>

<%
String filelocation = request.getParameter("refilelocation");

if (filelocation != null && !filelocation.isEmpty()) {
    String fileName = new File(filelocation).getName();
    
    // FTP 서버 연결 정보
    String ftpHost = "www.shinhan-software.co.kr";
    int ftpPort = 21;
    String ftpUsername = "shinhan2023";
    String ftpPassword = "tmdcks15!";
    
    FTPClient ftpClient = new FTPClient();
    ftpClient.setControlEncoding("UTF-8");

    try {
        // FTP 서버에 연결
        ftpClient.connect(ftpHost, ftpPort);
        ftpClient.login(ftpUsername, ftpPassword);
        ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
        ftpClient.enterLocalPassiveMode();

        // 파일 다운로드
        String remoteFilePath = filelocation;
        InputStream inputStream = ftpClient.retrieveFileStream(remoteFilePath);

        if (inputStream != null) {
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            // 파일을 클라이언트로 전송
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outputStream.close();
        }
    } catch (IOException e) {
        e.printStackTrace();
        response.getWriter().write("파일 다운로드 중 오류가 발생했습니다.");
    } finally {
        try {
            ftpClient.logout();
            ftpClient.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
} else {
    response.getWriter().write("다운로드할 파일이 존재하지 않습니다.");
}
%>
</body>
</html>
