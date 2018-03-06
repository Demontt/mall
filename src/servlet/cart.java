package servlet;

import dao.GoodDao;
import model.Cart;
import model.Good;
import util.ErrorCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            if (request.getSession().getAttribute("user") == null) {
                request.getSession().setAttribute("cart", null);
                response.sendRedirect("cart.jsp");
                return;
            }
            if (request.getParameter("id") == null) {
                throw new Exception();
            }
            int id = Integer.valueOf(request.getParameter("id"));
            Good good = new GoodDao().getGood(id);
            if (good == null) {
                request.getSession().setAttribute("errorCode", ErrorCode.GOOD_NOT_FOUND);
                request.getSession().setAttribute("target", "index.jsp");
                response.sendRedirect("error.jsp");
                return;
            }
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            if (request.getParameter("amount") != null) {
                int amount = Integer.valueOf(request.getParameter("amount"));
                cart.updateGood(id, amount);
            } else if (request.getParameter("update") != null){
                int update = Integer.valueOf(request.getParameter("update"));
                cart.updateGood(id, update);
            } else if (request.getParameter("del") != null) {
                int del = Integer.valueOf(request.getParameter("del"));
                cart.delGood(id);
            }
            request.getSession().setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            request.getSession().setAttribute("errorCode", ErrorCode.UNKOWN);
            request.getSession().setAttribute("target", "index.jsp");
            response.sendRedirect("error.jsp");
        }
    }
}
