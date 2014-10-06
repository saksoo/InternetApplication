<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**	
*
*
*
*
*
**/ 
%>

<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
	// δημιουργούμε μια σύνδεση
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	// συνδεόμαστε στη βάση από τη σύνδεση αυτή (η βάση στην περίπτωση μας είναι στον wampserver)
    connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");

	// μεταβλητή για τα αποτελέσματα που θα επιστραφούν
    ResultSet res = null;
	Statement psdoLogin = connection.createStatement();
    
	// παίρνουμε τα στοιχεία από τη φόρμα
    String usn = request.getParameter("username");
    String pwd = request.getParameter("password");
	
	// τα στοιχεία που έδωσε ο χρήστης είναι κενά 
	if (usn=="" || pwd==""){
		%>	
		<h1>Αποτυχία εισόδου</h1>
		<br />
		<p><span style="color:red;">Το όνομα χρήστη και ο κωδικός πρόσβασης δεν μπορεί να είναι κενά.</span></p>
		<br />
		<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να εισάγετε ξανά τα στοιχεία σας.</p>
		<p><a href="login.jsp">Επανάληψη εισόδου</a></p>		
		<%
	}
	
	// αν τα στοιχεία στα πεδία δεν είναι κενά
	else {
		try{  
			res = psdoLogin.executeQuery("SELECT * FROM user WHERE username = '" + usn + "' AND password = '" + pwd + "'");	
			// αν υπάρχει ο χρήστης στη βάση, τότε φορτώνουμε τα στοιχεία του στον πίνακα session
			if(res.next()){
				session.setAttribute("id",res.getString("id"));
				session.setAttribute("username",res.getString("username"));
				session.setAttribute("name",res.getString("name"));
				session.setAttribute("surname",res.getString("surname"));
				session.setAttribute("type",res.getString("type"));
				session.setAttribute("userLoggedIn","true");  

				// εμφανίζουμε στο χρήστη μια οθόνη επιτυχίας ή αποτυχίας
				response.sendRedirect("login_success.jsp");
			}
			else{
				response.sendRedirect("login_error.jsp");
			}
		}
		
		// προέκυψε σφάλμα
		catch(Exception e){
			e.printStackTrace();
		}
		
		// κλείνουμε τις συνδέσεις που ανοίξαμε παραπάνω
		try{
			if(psdoLogin!=null){
				psdoLogin.close();
			}
			if(res!=null){
				res.close();
			}
			 
			if(connection!=null){
				connection.close();
			}
		}
		
		// σφάλμα στο κλείσιμο της σύνδεσης
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>

</div>
<jsp:include page="footer.jsp"/>