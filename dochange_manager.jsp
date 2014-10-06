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
	String mngr2 = request.getParameter("manager");
	
	// trim()  χρησιμοποιούμε αυτή τη συνάρτηση, διότι για κάποιο λόγο, όταν αποθηκεύεται ο manager στη βάση
	// μπαίνει ένα space στο τέλος του. πιθανώς κάτι γίνεται με το radiobutton
	String mngr = mngr2.trim();

	if (mngr==null){
		%>	
		<h1>Αποτυχία αλλαγής υπευθύνου</h1>
		<br />
		<p><span style="color:red;">Πρέπει να επιλέξετε οπωσδήποτε έναν υπεύθυνο.</span></p>
		<br />
		<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
		<%
	}
	else{
		try{  
			connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
			String queryString = "UPDATE project SET manager=? WHERE name=?";
			pstatement = connection.prepareStatement(queryString);
			pstatement.setString(1,mngr);
			pstatement.setString(2,nm);
			updateQuery = pstatement.executeUpdate();
			
			if (updateQuery != 0) { 
				%>	
				<h1>Αλλαγή υπευθύνου έργου</h1>
				<br />
				<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
				<br />
				<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
				<%
			}
		}
		
		catch (Exception ex) {
				%>	
				<h1>Αλλαγή υπευθύνου έργου</h1>
				<br />
				<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή του υπευθύνου. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
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