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

    String nm = request.getParameter("nm");
	String tx = request.getParameter("text");

	try{  
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
		String queryString = "UPDATE project SET description=? WHERE name=?";
		pstatement = connection.prepareStatement(queryString);
		pstatement.setString(1,tx);
		pstatement.setString(2,nm);
		updateQuery = pstatement.executeUpdate();
		
		if (updateQuery != 0) { 
			%>	
			<h1>Αλλαγή περιγραφής έργου</h1>
			<br />
			<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
			<br />
			<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
		}
	}
	
	catch (Exception ex) {
			%>	
			<h1>Αλλαγή περιγραφής έργου</h1>
			<br />
			<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή της περιγραφής. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
			<br />
			<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
	}

	finally {
		pstatement.close();
		connection.close();
	}

%>

</div>
<jsp:include page="footer.jsp"/>