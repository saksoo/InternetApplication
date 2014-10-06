<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();

	PreparedStatement pstatement = null;
	PreparedStatement pstatement2 = null;
	int updateQuery = 0;
	int updateQuery2 = 0;

    String nm = request.getParameter("nm");

	try{  
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
		
		String queryString = "DELETE FROM project WHERE name=? LIMIT 1;";
		pstatement = connection.prepareStatement(queryString);
		pstatement.setString(1,nm);
		updateQuery = pstatement.executeUpdate();
		
		String queryString2 = "DELETE FROM work WHERE project=?;";
		pstatement2 = connection.prepareStatement(queryString2);
		pstatement2.setString(1,nm);
		updateQuery2 = pstatement2.executeUpdate();
		
		
		// elegxw etsi giati mporei na uparxoun ergasies, mporei kai oxi
		if ((updateQuery != 0 && updateQuery2 != 0) || (updateQuery != 0)) { 
			%>	
			<h1>Διαγραφή έργου</h1>
			<br />
			<p><span style="color:green";>Η διαγραφή ολοκληρώθηκε με επιτυχία.</span></p>
			<br />
			<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
		}
	}
	
	catch (Exception ex) {
			%>	
			<h1>Διαγραφή έργου</h1>
			<br />
			<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά τη διαγραφή. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
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