<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
	<h1>Αλλαγή προσωπικού</h1><br />
	<p>Πρόκειται να αλλάξετε το προσωπικό για το έργο με τα παρακάτω στοιχεία:</p><br />
	<table>
		<tr>
			<th>Όνομα έργου</th>
			<th>Υπεύθυνος</th>
		</tr>
<%
	String nm = request.getParameter("nm");
	String mng = request.getParameter("mng");
%>
		<tr class="row">
			<td><% out.println(nm); %></td>
			<td><% out.println(mng); %></td>
		</tr>
	</table>
	<br />
	<form action="dochange_stuff.jsp?nm=<% out.println(nm); %>" method="post">
<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");

    ResultSet res = null;
	Statement psdoLogin = connection.createStatement();
%>
	<label>Επιλέξτε το νέο προσωπικό για το έργο</label>
	<table>
		<tr>
			<th></th>
			<th>Όνομα χρήστη</th>
			<th>Όνομα</th>
			<th>Επώνυμο</th>
			<th>Email</th>
		</tr>
<%	
	// τυπώνω το διαθέσιμο stuff από τη βάση και το βάσω σε μια λίστα με checkbox, έτσι ώστε
	// να μπορεί ο manager να διαλέξει πάνω από έναν εργαζόμενο για την υλοποίηση του έργου
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM user WHERE type='stuff'");	
		while(res.next()){
		%>
			<tr class="row">
				<td><input type="checkbox" name="stuff" value="<% out.println(res.getString("username")); %>" /></td>
				<td><% out.println(res.getString("username")); %></td>
				<td><% out.println(res.getString("name")); %></td>
				<td><% out.println(res.getString("surname")); %></td>
				<td><% out.println(res.getString("email")); %></td>
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
	</table><br />	
		<input class="button" type="submit" value="Αλλαγή προσωπικού"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>