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
	<h1>Κατάλογος χρηστών</h1>
	<br />
	<p>Παρακάτω εμφανίζεται η λίστα με τα πλήρη στοιχεία των χρηστών που είναι εγγεγραμμένοι στην εφαρμογή. Κάνοντας κλικ πάνω στο Ρόλο του κάθε χρήστη, μπορείτε
	να τον αλλάξετε.</p><br />
	<table>
		<tr>
			<th>Όνομα χρήστη</th>
			<th>Όνομα</th>
			<th>Επώνυμο</th>
			<th>Email</th>
			<th>Ρόλος</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM user");	
		while(res.next()){
		%>
			<tr class="row">
				<td><% out.println(res.getString("username")); %></td>
				<td><% out.println(res.getString("name")); %></td>
				<td><% out.println(res.getString("surname")); %></td>
				<td><% out.println(res.getString("email")); %></td>
				<td><a href="change_role.jsp?usn=<% out.println(res.getString("username")); %>&nm=<% out.println(res.getString("name")); %>&snm=<% out.println(res.getString("surname")); %>&eml=<% out.println(res.getString("email")); %>"><% out.println(res.getString("type")); %></a></td>
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