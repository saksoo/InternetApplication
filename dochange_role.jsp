<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();

	PreparedStatement pstatement = null;
	int updateQuery = 0;

    String usn = request.getParameter("usn");
	String cr = request.getParameter("cr");

	try{  
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
		String queryString = "UPDATE user SET type=? WHERE username=?";
		pstatement = connection.prepareStatement(queryString);
		pstatement.setString(1,cr);
		pstatement.setString(2,usn);
		updateQuery = pstatement.executeUpdate();
		
		if (updateQuery != 0) { 
			%>	
			<h1>Αλλαγή ρόλου εγγεγραμμένου χρήστη</h1>
			<br />
			<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
			<br />
			<p><a href="user_list.jsp">Επιστροφή στον κατάλογο των χρηστών</a></p>		
			<%
		}
	}
	
	catch (Exception ex) {
			%>	
			<h1>Αλλαγή ρόλου εγγεγραμμένου χρήστη</h1>
			<br />
			<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή του ρόλου. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
			<br />
			<p><a href="user_list.jsp">Επιστροφή στον κατάλογο των χρηστών</a></p>		
			<%
	}

	finally {
		pstatement.close();
		connection.close();
	}

%>

</div>
<jsp:include page="footer.jsp"/>