package br.com.fiap.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class Autenticacao extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("autenticacao.jsp");
		dispatcher.forward(request, response);
	}
	
}
