<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**
*
*	Το αρχείο αυτό καλείται από το register.jsp και παίρνει τα δεδομένα από τη φόρμα εγγραφής.
*	Δουλειά του είναι να εισάγει ένα νέο χρήστη στον πίνακα user της βάσης δεδομένων.
*
**/
%>

<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();

	PreparedStatement pstatement = null;
	int updateQuery = 0;

	String nm = request.getParameter("name");
	String surnm = request.getParameter("surname");
    String usn = request.getParameter("username");
	String eml = request.getParameter("email");
    String pwd = request.getParameter("password");
	String pwd2 = request.getParameter("password2");
	
	if (nm=="" || surnm=="" || usn=="" || eml=="" || pwd=="" || pwd2==""){
		%>	
		<h1>Αποτυχία εγγραφής</h1>
		<br />
		<p><span style="color:red;">Όλα τα πεδία της φόρμας είναι υποχρεωτικά προκειμένου να εγγραφείτε στην εφαρμογή.</span></p>
		<br />
		<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να εισάγετε ξανά τα στοιχεία σας.</p>
		<p><a href="register.jsp">Συμπλήρωση φόρμας</a></p>		
		<%
	}
	// έχει δώσει ο χρήστης διαφορετικούς κωδικούς
	else if (!(pwd.equals(pwd2))){
		%>	
		<h1>Αποτυχία εγγραφής</h1>
		<br />
		<p><span style="color:red;">Έχετε εισάγει διαφορετικούς κωδικούς.</span></p>
		<br />
		<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να εισάγετε ξανά τα στοιχεία σας.</p>
		<p><a href="register.jsp">Συμπλήρωση φόρμας</a></p>		
		<%		
	}
	else {
		try{  
			connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
			// εισάγουμε στη βάση το νέο χρήστη, συγκεκριμένα στον πίνακα user
			String queryString = "INSERT INTO user(username,password,email,name,surname) VALUES (?, ?, ?, ?, ?)";
			pstatement = connection.prepareStatement(queryString);
			pstatement.setString(1, usn);
			pstatement.setString(2, pwd);
			pstatement.setString(3, eml);
			pstatement.setString(4, nm);
			pstatement.setString(5, surnm);
			// το updateQuery το βρήκαμε έτοιμο από το ίντερνετ
			updateQuery = pstatement.executeUpdate();
			
			if (updateQuery != 0) { 
				%>	
				<h1>Επιτυχής εγγραφή</h1>
				<br />
				<p><span style="color:green";>Η εγγραφή σας στο σύστημα ολοκληρώθηκε με επιτυχία.</span></p>
				<br />
				<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να μεταβείτε στη σελίδα σύνδεσης.</p>
				<p><a href="login.jsp">Σύνδεση στην εφαρμογή</a></p>		
				<%
			}
		}
		
		catch (Exception ex) {
				%>	
				<h1>Αποτυχία εγγραφής</h1>
				<br />
				<p><span style="color:red;">Το όνομα χρήστη χρησιμοποιείται ήδη από άλλο μέλος.</span></p>
				<br />
				<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να συμπληρώσετε ξανά τη φόρμα εγγραφής.</p>
				<p><a href="register.jsp">Φόρμα εγγραφής</a></p>		
				<%
		}

		finally {
			pstatement.close();
			connection.close();
		}
	}
%>

</div>
<jsp:include page="footer.jsp"/>