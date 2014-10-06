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
	<h1>Κατάλογος έργων στα οποία εργάζομαι</h1>
	<br />
	<p>Μπορείτε να δείτε τις εργασίες που έχετε αναλάβει για το κάθε έργο κάνοντας κλικ πάνω στο όνομα του.</p><br />
	<table>
		<tr>
			<th>Όνομα</th>
			<th>Κατάσταση</th>
			<th>Περιγραφή</th>
			<th>Υπεύθυνος</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM project");	
		while(res.next()){
		
			String stf = res.getString("stuff");
			String[] stuff = stf.split(",");
			int found = 0;
			for(int i=0; i<stuff.length; i++){
				String stuff_trimmed = stuff[i].trim();
				if(stuff_trimmed.equals(usn)){
					found = 1;
				}
			}
			
			if(found == 1){
				%>
					<tr class="row">
						<td><a href="works_list_stuff.jsp?nm=<%out.println(res.getString("name"));%>&vi=<%out.println(res.getString("view"));%>"><% out.println(res.getString("name")); %></a></td>
						<td><% out.println(res.getString("view")); %></td>
						<td><% out.println(res.getString("description")); %></td>
						<td><% out.println(res.getString("manager"));%></td>
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