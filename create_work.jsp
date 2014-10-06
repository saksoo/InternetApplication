<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
	<h1>Δημιουργία νέας εργασίας</h1>
	<br />
	<p>Πρόκειται να δημιουργήσετε μια νέα εργασία για το έργο με τα παρακάτω στοιχεία.</p><br />
	<p style="color:red;">* Σημαντικό *</p>
	<p>Λόγω προβλημάτων στον server σχετικά με την κωδικοποίηση των γραμμάτων, παρακαλείστε να εισάγετε τα στοιχεία της εργασίας με αγγλικούς χαρακτήρες.</p><br />
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
	<h3>Φόρμα δημιουργίας εργασίας</h3>
	<form action="docreate_work.jsp?project=<%out.println(nm);%>" method="post">
		<label>Όνομα εργασίας</label><input name="name" type="text" size="30" />
		<label>Ημερομηνία εκκίνησης</label><input name="start" type="text" size="30" />
		<label>Προθεσμία</label><input name="finish" type="text" size="30" />
		<label style="margin-top:20px;">Περιγραφή εργασίας</label><textarea name="text" rows="5" cols="5"></textarea><br />	
<%
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost/ted?user=nmaniac&password=nikos1990");
    ResultSet res = null;
	Statement psdoLogin = connection.createStatement();
%>
	<label>Επιλέξτε το προσωπικό για την υλοποίηση του έργου</label>
	<table>
		<tr>
			<th></th>
			<th>Όνομα χρήστη</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM project WHERE name='"+nm+"'");	
		if(res.next()){
		
			String stf = res.getString("stuff");
			String[] stuff = stf.split(",");
			for(int i=0; i<stuff.length; i++){
				%>
					<tr class="row">
						<td><input type="checkbox" name="stuff" value="<% out.println(stuff[i]); %>"/></td>
						<td><% out.println(stuff[i]); %>		
						</td>
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
	</table><br />			
		<input class="button" type="submit" value="Δημιουργία εργασίας"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>