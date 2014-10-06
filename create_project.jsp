<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
	<h1>Δημιουργία νέου έργου</h1>
	<br />
	<p>Συμπληρώστε τη φόρμα παρακάτω για να δημιουργήσετε ένα νέο έργο.</p>
	<p>Ο υπεύθυνος του έργου μπορεί να είναι μόνο ένας, ενώ για το προσωπικό μπορείτε να επιλέξετε όσους επιθυμείτε από τη αντίστοιχη λίστα.</p><br />
	<p style="color:red;">* Σημαντικό *</p>
	<p>Λόγω προβλημάτων στον server σχετικά με την κωδικοποίηση των γραμμάτων, παρακαλείστε να εισάγετε τα στοιχεία του έργου με αγγλικούς χαρακτήρες.</p>
	<h3>Φόρμα δημιουργίας έργου</h3>
	<form action="docreate_project.jsp" method="post">
		<label>Όνομα έργου</label><input name="name" type="text" size="30" />
		<label style="margin-top:20px;">Κατάσταση</label><select name="view"><option value="public">Δημόσιο</option><option value="private">Ιδιωτικό</option></select>
		<label style="margin-top:20px;">Περιγραφή έργου</label><textarea name="text" rows="5" cols="5"></textarea><br />

<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");

    ResultSet res = null;
	Statement psdoLogin = connection.createStatement();
%>
	<label>Επιλέξτε έναν υπεύθυνο για το έργο</label>
	<table>
		<tr>
			<th></th>
			<th>Όνομα χρήστη</th>
			<th>Όνομα</th>
			<th>Επώνυμο</th>
			<th>Email</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM user WHERE type='manager'");	
		while(res.next()){
		%>
			<tr class="row">
				<td><input type="radio" name="manager" value="<% out.println(res.getString("username")); %>" /></td>
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
	
		
<%
    Connection connection2 = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection2 = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");

    ResultSet res2 = null;
	Statement psdoLogin2 = connection2.createStatement();
%>
	<label>Επιλέξτε το προσωπικό για την υλοποίηση του έργου</label>
	<table>
		<tr>
			<th></th>
			<th>Όνομα χρήστη</th>
			<th>Όνομα</th>
			<th>Επώνυμο</th>
			<th>Email</th>
		</tr>
<%	
	try{  
		res2 = psdoLogin2.executeQuery("SELECT * FROM user WHERE type='stuff'");	
		while(res2.next()){
		%>
			<tr class="row">
				<td><input type="checkbox" name="stuff" value="<% out.println(res2.getString("username")); %>" /></td>
				<td><% out.println(res2.getString("username")); %></td>
				<td><% out.println(res2.getString("name")); %></td>
				<td><% out.println(res2.getString("surname")); %></td>
				<td><% out.println(res2.getString("email")); %></td>
			</tr>		
		<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	try{
		if(psdoLogin2!=null){
			psdoLogin2.close();
		}
		if(res2!=null){
			res2.close();
		}
		 
		if(connection2!=null){
			connection2.close();
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>		
	</table><br />		
		

		<input class="button" type="submit" value="Δημιουργία έργου"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>