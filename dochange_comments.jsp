<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**
*
*	Εδώ γίνεται η αλλαγή των σχολίων για μια εργασία. 
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

    String nm = request.getParameter("nm");
	String tx = request.getParameter("text");

	try{  
		connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
		// Αφού έχουμε συνδεθεί στη βάση, ενημερώνουμε την αντίστοιχη εγγραφή της με το UPDATE
		String queryString = "UPDATE work SET comments=? WHERE name=?";
		pstatement = connection.prepareStatement(queryString);
		pstatement.setString(1,tx);
		pstatement.setString(2,nm);
		// την παρακάτω μορφή για την εκτέλεση του ερωτήματος την έχουμε πάρει από το ίντερνετ
		updateQuery = pstatement.executeUpdate();
		
		if (updateQuery != 0) { 
			%>	
			<h1>Αλλαγή σχολίων εργασίας</h1>
			<br />
			<p><span style="color:green";>Η αλλαγή ολοκληρώθηκε με επιτυχία.</span></p>
			<br />
			<p><a href="project_list_stuff.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
			<%
		}
	}
	
	catch (Exception ex) {
			%>	
			<h1>Αλλαγή σχολίων εργασίας</h1>
			<br />
			<p><span style="color:red;">Υπήρξε κάποιο πρόβλημα κατά την αλλαγή των σχολίων. Παρακαλούμε προσπαθήστε ξανά αργότερα.</span></p>
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