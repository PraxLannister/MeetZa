package meet.controller;

import java.io.IOException;
import java.security.Security;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.bouncycastle.jce.provider.BouncyCastleProvider;

import meet.util.db.SisDbConnectionUtil;



/**
 * Servlet implementation class EmailVerifcation
 */
public class EmailVerifcation extends HttpServlet {
	private static final long serialVersionUID = 1L;
Connection con =null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("Email verification Controller init called");
		try {
			con  = SisDbConnectionUtil.getConnection();
		}catch(SQLException e){
			e.printStackTrace();
		}
		//TODO open connection
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("Emai verification destroy  called");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailVerifcation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailId = request.getParameter("emailid");
		boolean isEmailExist = true;;
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email ="";
		try {
			
			String sql = "select * from Meat_user where mail_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,emailId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				 email = rs.getString("mail_id");
			}
			else{
				isEmailExist=false;
				
			}
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		if(!(isEmailExist)){
				HttpSession session = request.getSession();
				
				
				
				final String senderEmailId = "MeatZaa12@gmail.com";
				final String senderPassword = "1234567890@Meat";
		
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
		
				Session email_session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(senderEmailId, senderPassword);
					}
				  });
				System.out.println("session created....."+email_session);
		
		
				try {
		
					Message message = new MimeMessage(email_session);
					//set who is sender
					message.setFrom(new InternetAddress(senderEmailId));
					//set who will get msg (Recipients)
					message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailId));
					
					//message.setSubject("Sis GREET(Happy Programming) "+Math.random());
					int Otp =new Random().nextInt(9999)+1000;
					// Creating testing otp for 
					String link="<a href='http://localhost:8088/MeetZa/OTP.jsp'>for succcessful login use this link</a>";
					
					message.setText("please click on link"+link+"\n otp is "+Otp);
					String otp=""+Otp;
				
					
					//for testing purpose
					otp= "shershaah";
					
					System.out.println(Otp);
					System.out.println(emailId);
					System.out.println(session.isNew());
					
					
					session.setAttribute("OTP",otp);
					session.setAttribute("email",emailId);
					Transport.send(message);
					
		
				} catch (MessagingException e) {
					e.printStackTrace();
					System.out.print(e.getMessage());
				}
				response.sendRedirect("OTP.jsp");
		}else{
			request.setAttribute("error","Email already exists");
			RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
		
			rd.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailId = request.getParameter("emailid");
		
		String password = "";
	
				final String senderEmailId = "MeatZaa12@gmail.com";
				final String senderPassword = "1234567890@Meat";
		
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
		
				Session email_session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(senderEmailId, senderPassword);
					}
				  });
				System.out.println("session created....."+email_session);
		
		
				try {
		
					Message message = new MimeMessage(email_session);
					//set who is sender
					message.setFrom(new InternetAddress(senderEmailId));
					//set who will get msg (Recipients)
					message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailId));
					
					//message.setSubject("Sis GREET(Happy Programming) "+Math.random());
					int Otp =new Random().nextInt(9999)+1000;
					String Message="Your New Password Is:";
					
					message.setText(Message+Otp);
					 password=""+Otp;
				
					
					System.out.println(Otp);
					System.out.println(emailId);
					
					
					
					
				
					Transport.send(message);
					
		
				} catch (MessagingException e) {
					e.printStackTrace();
					System.out.print(e.getMessage());
				}
		
	
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				 String sql =" update Meat_user set user_password=? where Mail_Id=?";
				 pstmt = con.prepareStatement(sql);
				 // Encryption //////////////////////////////////////
//				 byte[] input;
//				 byte[] keyBytes = "12345678".getBytes();
//				 byte[] ivBytes = "input123".getBytes();
//				 SecretKeySpec  key = new SecretKeySpec(keyBytes,"DES");
//				 IvParameterSpec ivSpec = new IvParameterSpec(ivBytes);
//				 
//				 Cipher cipher; // will hold encrypted password
//				 byte[] cypherText; 
//				 int ctLength;
// 				 
//				 
//				 try {
//					 Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
//					 
//					 
//				 }catch {
//					 
//				 }
				 
				 //////////////////////////////////////////////////
			
				 pstmt.setString(1, password);
				 pstmt.setString(2, emailId);
				
				 int update = pstmt.executeUpdate();
				 if(update ==1){
					 System.out.println("Updation Successfull");
				 }
			}catch(Exception e){
				
				e.printStackTrace();
			}
			response.sendRedirect("Login.jsp");
	}

}
