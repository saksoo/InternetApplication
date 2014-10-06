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
%>
	<h1>Κατάλογος έργων</h1>
	<br />
	<p>Παρακάτω εμφανίζεται η λίστα με τα έργα που έχουν καταχωρηθεί στην εφαρμογή. Μπορείτε να δημιουργήσετε ένα νέο έργο ακολουθώντας το σύνδεσμο που βρίσκεται ακριβώς από κάτω.</p>
	<p><br /><a href="create_project.jsp">Δημιουργία νέου έργου</a></p><br />
	<p>Κάνοντας κλικ πάνω σε κάποιο πεδίο του πίνακα μπορείτε να αλλάξετε το περιεχόμενο του. Συγκεκριμένα μπορείτε να τροποποιήσετε το την κατάσταση ενός έργου, την 
		περιγραφή του, τον manager αλλά και το προσωπικό που θα συμμετέχει. Επίσης μπορείτε να διαγράψετε ένα έργο (θα διαγραφούν και όλες οι εργασίες που σχετίζονται με αυτό) επιλέγοντας 
		το εικονίδιο στα δεξιά.</p><br />
	<table>
		<tr>
			<th>Όνομα</th>
			<th>Κατάσταση</th>
			<th>Περιγραφή</th>
			<th>Υπεύθυνος</th>
			<th>Προσωπικό</th>
			<th></th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM project");	
		while(res.next()){
		%>
			<tr class="row">
				<td><% out.println(res.getString("name")); %></td>
				<td><a href="change_view.jsp?nm=<% out.println(res.getString("name")); %>&mng=<% out.println(res.getString("manager")); %>"><% out.println(res.getString("view")); %></a></td>
				<td><a href="change_desc.jsp?nm=<% out.println(res.getString("name")); %>&mng=<% out.println(res.getString("manager")); %>"><% out.println(res.getString("description")); %></a></td>
				<td><a href="change_manager.jsp?nm=<% out.println(res.getString("name")); %>&vi=<% out.println(res.getString("view")); %>"><% out.println(res.getString("manager")); %></a></td>
				<td><a href="change_stuff.jsp?nm=<% out.println(res.getString("name")); %>&mng=<% out.println(res.getString("manager")); %>"><% String stf = res.getString("stuff");
						String[] stuff = stf.split(",");
						for(int i=0; i<stuff.length; i++){
							out.println(stuff[i]);
						}%></a>			
				</td>
				<td><a href="delete_project.jsp?nm=<% out.println(res.getString("name")); %>&mng=<% out.println(res.getString("manager")); %>"><img src="images/delete.png" alt="delete" title="Διαγραφή"/></a></td>
			</tr>		
		<%
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