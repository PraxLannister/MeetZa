package meet.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OtpVerifyController
 */
public class OtpVerifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpVerifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String VerifyOtp = (String)session.getAttribute("OTP");
		String otp = request.getParameter("otp");
		response.getWriter().print(otp);
		response.getWriter().print(VerifyOtp);
		if(otp.equals(VerifyOtp)){
			response.sendRedirect("Register.jsp");
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("OTP.jsp");
			request.setAttribute("error","Your Otp is invalid");
			rd.forward(request, response);
		}
	}

}
