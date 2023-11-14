package graduation;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // 현재 요청의 세션을 가져옵니다.
            HttpSession session = request.getSession(false);

            // 세션이 존재하면 세션을 무효화하여 로그아웃 처리합니다.
            if (session != null) {
                session.invalidate();
            }

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace(); // 오류 메시지를 출력하여 디버깅합니다.
        }
    }
}
