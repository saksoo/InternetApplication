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

	String nm = request.getParameter("name");
	String st = request.getParameter("start");
    String fin = request.getParameter("finish");
	String tx = request.getParameter("text");
	String[] stf = request.getParameterValues("stuff");
	String proj = request.getParameter("project");
	

	if (nm=="" || st=="" || fin=="" || tx=="" || stf==null){
		%>	
		<h1>Αποτυχία δημιουργίας εργασίας</h1>
		<br />
		<p><span style="color:red;">Όλα τα πεδία της φόρμας είναι υποχρεωτικά προκειμένου να δημιουργήσετε την εργασία. Επίσης πρέπει να επιλέξετε τουλάχιστον ένα 
			άτομο για το προσωπικό.</span></p>
		<br />
		<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να εισάγετε ξανά τα στοιχεία της εργασίας.</p>
		<p><a href="create_work.jsp">Δημιουργία νέας εργασίας</a></p>		
		<%
	}
	else {
	
		StringBuilder arTostr = new StringBuilder();
		if (stf.length > 0) {
			arTostr.append(stf[0]);
			for (int i=1; i<stf.length; i++) {
				arTostr.append(",");
				arTostr.append(stf[i]);
			}
		}
		String stuff_for_db = arTostr.toString();	
	

		try{  
			connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
			String queryString = "INSERT INTO work(name,description,start,finish,run,project) VALUES (?, ?, ?, ?, ?, ?)";
			pstatement = connection.prepareStatement(queryString);
			pstatement.setString(1, nm);
			pstatement.setString(2, tx);
			pstatement.setString(3, st);
			pstatement.setString(4, fin);
			pstatement.setString(5, stuff_for_db);
			pstatement.setString(6, proj);
			updateQuery = pstatement.executeUpdate();
			
			if (updateQuery != 0) { 
				%>	
				<h1>Επιτυχής δημιουργία εργασίας</h1>
				<br />
				<p><span style="color:green";>Η δημιουργία της εργασίας ολοκληρώθηκε με επιτυχία.</span></p>
				<br />
				<p><a href="project_list_manager.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
				<%
			}
		}
		
		catch (Exception ex) {
				%>	
				<h1>Αποτυχία δημιουργίας εργασίας</h1>
				<br />
				<p><span style="color:red;">Το όνομα της εργασίας που εισάγατε χρησιμοποιείται ήδη. Χρησιμοποιήστε ένα άλλο.</span></p>
				<br />
				<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να συμπληρώσετε ξανά τη φόρμα.</p>
				<p><a href="create_work.jsp">Δημιουργία νέας εργασίας</a></p>		
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