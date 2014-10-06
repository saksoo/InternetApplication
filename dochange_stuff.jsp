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
	String[] stf = request.getParameterValues("stuff");
	
	// για να μπορέσουμε να αποθηκεύσουμε πολλά άτομα σε ένα πεδίο στη βάση, χρησιμοποιούμε την εξής πρακτική.
	// βάζουμε όλους τους εγραζομένους που έχουν επιλεχθεί σε ένα string, χωρισμένους με κόμμα και το αποθηκεύουμε έτσι.
	// όταν μετά θελήσουμε να ανακτήσουμε τα δεδομένα από τη βάση, τα χωρίζουμε και πάλι με τη συνάρτηση trim() 
	// και τα βάζουμε σε πίνακα
	StringBuilder arTostr = new StringBuilder();
    if (stf.length > 0) {
        arTostr.append(stf[0]);
        for (int i=1; i<stf.length; i++) {
            arTostr.append(",");
            arTostr.append(stf[i]);
        }
    }
	String stuff_for_db = arTostr.toString();

	if (stf==null){
		%>	
		<h1>Αποτυχία αλλαγής προσωπικού</h1>
		<br />
		<p><span style="color:red;">Πρέπει να επιλέξετε τουλάχιστον ένα άτομο για το προσωπικό.</span></p>
		<br />
		<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
		<%
	}
	else{
		try{  
			connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
			String queryString = "UPDATE project SET stuff=? WHERE name=?";
			pstatement = connection.prepareStatement(queryString);
			pstatement.setString(1,stuff_for_db);
			pstatement.setString(2,nm);
			updateQuery = pstatement.executeUpdate();
			
			if (updateQuery != 0) { 
				%>	
				<h1>Αλλαγή προσωπικού</h1>
				<br />
				<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
				<br />
				<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
				<%
			}
		}
		
		catch (Exception ex) {
				%>	
				<h1>Αλλαγή προσωπικού</h1>
				<br />
				<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή του προσωπικού. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
				<br />
				<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
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