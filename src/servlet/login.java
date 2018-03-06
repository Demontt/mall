package servlet;

import dao.LoginDao;
import model.User;
import util.ErrorCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("login_username");
            String password = request.getParameter("login_password");
            String code = request.getParameter("login_code");
            String verify = (String) request.getSession().getAttribute("code");
            request.getSession().setAttribute("errorCode", ErrorCode.UNKOWN);
            if (!code.equals(verify)) {
                request.getSession().setAttribute("errorCode", ErrorCode.VERIFY_CODE_WRONG);
                throw new Exception();
            } else {
                User user = new User(username, password);
                LoginDao loginDao = new LoginDao(user);
                if (loginDao.check()) {
                    request.getSession().setAttribute("errorCode", ErrorCode.SCUCCESS);
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect("index.jsp");
                } else {
                    request.getSession().setAttribute("errorCode", ErrorCode.LOGIN_FAIL);
                    throw new Exception();
                }
            }
        } catch (Exception e) {
            request.getSession().setAttribute("target", "login.jsp");
            response.sendRedirect("error.jsp");
        }
    }
}
