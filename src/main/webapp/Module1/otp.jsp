<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.net.URL,java.net.URLEncoder,javax.net.ssl.HttpsURLConnection" %>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String address = request.getParameter("address");
	String regNo = request.getParameter("regno");
	String phoneNo = (String)request.getParameter("phoneNo");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Ritvik@0507");
	Statement state = connect.createStatement();
	ResultSet otp_result;
	String otp_store = "";
	boolean check;
	
	do {
		Random rnd = new Random();
		otp_store = "" + rnd.nextInt(999999);
		
		otp_result = state.executeQuery("SELECT * FROM registration WHERE otp = '" +  otp_store + "';"  );
		check = otp_result.next();
		if(!check) {
			int a = state.executeUpdate("INSERT INTO `registration` (`username`, `password`, `first_name`, `last_name`, `address`, `reg_no`, `email`, `phone_no`, `otp`) VALUES ('"+username+"', '"+password+"', '"+firstName+"', '"+lastName+"', '"+address+"', '"+regNo+"', '"+email+"', '"+phoneNo+"', '"+otp_store+"');");	
		}
	} while(check);
	
	String API_KEY = "dJbosnBC5FuG9OIH0vpieh32wq6fxVMa7QKXSALTygRWjcZY4PCnH3Q2kRNZaoq0T19yAJeSVrpFKGDh";
	String requestURL="https://www.fast2sms.com/dev/bulkV2?authorization="+ API_KEY +"&variables_values=" + otp_store +"&route=otp&numbers=" + phoneNo;
	URL url = null ;
	
	try {
        url = new URL(requestURL);
    } catch (Exception e) {
        e.printStackTrace();	 
    }
	
	HttpsURLConnection connection = (HttpsURLConnection)url.openConnection();
	String message = URLEncoder.encode("","UTF-8");
	
	connection.setRequestMethod("GET");
	connection.setRequestProperty("User-Agent", "Chrome");
	connection.setRequestProperty("cache-control","no-cache");
	int responseCode = connection.getResponseCode();
	
	StringBuffer res = new StringBuffer();
	BufferedReader br = new BufferedReader (new InputStreamReader(connection.getInputStream()));
	
	while(true) {
		String line = br.readLine();
		if(line == null) {
			break;
			
		}
		res.append(line);
	}

	request.getSession().setAttribute("Resister_Username", username);
	
	out.println("<meta http-equiv=\"refresh\"content=\"0; url = ../Module1/otp.html\" />");
	
	
%>