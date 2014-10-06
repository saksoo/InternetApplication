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
	String dn = request.getParameter("dn");

	try{  
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
		String queryString = "UPDATE work SET done=? WHERE name=?";
		pstatement = connection.prepareStatement(queryString);
		pstatement.setString(1,dn);
		pstatement.setString(2,nm);
		updateQuery = pstatement.executeUpdate();
		
		if (updateQuery != 0) { 
			%>	
			<h1>Αλλαγή προόσου εργασίας</h1>
			<br />
			<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
			<br />
			<p><a href="project_list_stuff.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
		}
	}
	
	catch (Exception ex) {
			%>	
			<h1>Αλλαγή προόσου εργασίας</h1>
			<br />
			<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή της προόδου. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
			<br />
			<p><a href="project_list_stuff.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
	}

	finally {
		pstatement.close();
		connection.close();
	}

%>

</div>
<jsp:include page="footer.jsp"/>