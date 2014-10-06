<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");

    ResultSet res = null;
	Statement psdoLogin = connection.createStatement();
	String usn = session.getAttribute("username").toString();
%>
	<h1>Κατάλογος εργασιών που εκτελώ</h1>
	<br />
	<p>Βλέπετε τον κατάλογο των εργασιών που έχετε αναλάβει για το εξής έργο:</p>
	<table>
		<tr>
			<th>Όνομα έργου</th>
			<th>Κατάσταση</th>
		</tr>
<%
	String nm = request.getParameter("nm");
	String vi = request.getParameter("vi");
%>
		<tr class="row">
			<td><% out.println(nm); %></td>
			<td><% out.println(vi); %></td>
		</tr>
	</table>	
	<br />
	<p>Παρακάτω στο πεδίο "Πρόοδος", με πράσινο συμβολίζονται οι εργασίες που έχουν ολοκληρωθεί, ενώ με κόκκινο οι εργασίες που εκκραμμούν.</p>
	<p>Για να αλλάξετε την πρόοδο μιας εργασίας, απλά πατήστε πάνω στο τετράγωνο με το χρώμα.</p>
	<p>Για να αλλάξετε τα σχόλια μιας εργασίας, πατήστε πάνω τους.</p>
	
	<h3>Εργασίες</h3>
	<table>
		<tr>
			<th>Όνομα</th>
			<th>Περιγραφή</th>
			<th>Εκκίνηση</th>
			<th>Προθεσμία</th>
			<th>Πρόοδος</th>
			<th>Σχόλια</th>
		</tr>
<%	
	try{  
		// Φέρνω από τη βάση τις εγγραφές του πίνακα με τις εργασίες που αφορούν το συγκεκριμένο έργο.
		res = psdoLogin.executeQuery("SELECT * FROM work WHERE project='"+nm+"'");	
		
		// Εδώ ψάχνουμε μέσα στο πεδίο run του πίνακα με τις εργασίες, να βρούμε αν ο συγκεκριμένος υπάλληλος
		// εκτελεί κάποια εργασία του έργου. Αν βρεθεί το όνομα του μέσα στη λίστα με τα ονόματα, τότε το found
		// παίρνει την τιμή 1 και τυπώνω τα χαρακτηριστικά της αντίστοιχης εργασίας.
		
		while(res.next()){	
			String rn = res.getString("run");
			String[] run = rn.split(",");
			int found = 0;
			for(int i=0; i<run.length; i++){
				String run_trimmed = run[i].trim();
				if(run_trimmed.equals(usn)){
					found = 1;
				}
			}		

			if(found == 1){
				%>
				<tr class="row">
					<td><% out.println(res.getString("name")); %></td>
					<td><% out.println(res.getString("description")); %></td>
					<td><% out.println(res.getString("start")); %></td>
					<td><% out.println(res.getString("finish")); %></td>
					<td style="text-align:center;"><% String done = res.getString("done"); 
							if(done.equals("yes")){
							%><a href="dochange_done.jsp?nm=<%out.println(res.getString("name"));%>&dn=no"><img src="images/green.png" alt="green" title="Η εργασία έχει ολοκληρωθεί"/></a><%
							} 
							else {
							%><a href="dochange_done.jsp?nm=<%out.println(res.getString("name"));%>&dn=yes"><img src="images/red.png" alt="red" title="Η εργασία δεν έχει ολοκληρωθεί"/></a><%
							} 
					%></td>
					<td><a href="change_comments.jsp?nm=<%out.println(res.getString("name"));%>"><% out.println(res.getString("comments")); %></a></td>
				</tr>		
				<%	
			}
		}
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
	
	try{
		if(psdoLogin!=null){
			psdoLogin.close();
		}
		if(res!=null){
			res.close();
		}
		 
		if(connection!=null){
			connection.close();
		}
	}
	
	catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>

</div>
<jsp:include page="footer.jsp"/>