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
	String vi = request.getParameter("view");
    String tx = request.getParameter("text");
	String mngr2 = request.getParameter("manager");
	String[] stf = request.getParameterValues("stuff");
	
	// trim()  to xrisimopoiw dioti gia kapoio logo otan pairnw string apo radiobutton, vazei ena space sto telos tou
	String mngr = mngr2.trim();

	if (nm=="" || tx=="" || mngr==null || stf==null){
		%>	
		<h1>Αποτυχία δημιουργίας έργου</h1>
		<br />
		<p><span style="color:red;">Όλα τα πεδία της φόρμας είναι υποχρεωτικά προκειμένου να δημιουργήσετε το έργο. Επίσης πρέπει να επιλέξετε τον Υπεύθυνο του έργου
		καθώς και τουλάχιστον ένα άτομο για το προσωπικό.</span></p>
		<br />
		<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να εισάγετε ξανά τα στοιχεία του έργου.</p>
		<p><a href="create_project.jsp">Δημιουργία νέου έργου</a></p>		
		<%
	}
	else {
		try{  
		
			StringBuilder arTostr = new StringBuilder();
			if (stf.length > 0) {
				arTostr.append(stf[0]);
				for (int i=1; i<stf.length; i++) {
					arTostr.append(",");
					arTostr.append(stf[i]);
				}
			}
			String stuff_for_db = arTostr.toString();			
		
		
			connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
			String queryString = "INSERT INTO project(name,view,description,manager,stuff) VALUES (?, ?, ?, ?, ?)";
			pstatement = connection.prepareStatement(queryString);
			pstatement.setString(1, nm);
			pstatement.setString(2, vi);
			pstatement.setString(3, tx);
			pstatement.setString(4, mngr);
			pstatement.setString(5, stuff_for_db);
			updateQuery = pstatement.executeUpdate();
			
			if (updateQuery != 0) { 
				%>	
				<h1>Επιτυχής δημιουργία έργου</h1>
				<br />
				<p><span style="color:green";>Η καταχώρηση του έργου ολοκληρώθηκε με επιτυχία.</span></p>
				<br />
				<p><a href="project_list.jsp">Επιστροφή στον κατάλογο των έργων</a></p>		
				<%
			}
		}
		
		catch (Exception ex) {
				%>	
				<h1>Αποτυχία δημιουργίας έργου</h1>
				<br />
				<p><span style="color:red;">Το όνομα του έργου που εισάγατε χρησιμοποιείται ήδη. Χρησιμοποιήστε ένα άλλο.</span></p>
				<br />
				<p>Ακολουθήστε τον παρακάτω σύνδεσμο για να συμπληρώσετε ξανά τη φόρμα.</p>
				<p><a href="create_project.jsp">Δημιουργία νέου έργου</a></p>		
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