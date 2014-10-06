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
	<h1>Κατάλογος όλων των δημοσίων έργων</h1>
	<br />
	<table>
		<tr>
			<th>Όνομα</th>
			<th>Κατάσταση</th>
			<th>Περιγραφή</th>
			<th>Υπεύθυνος</th>
			<th>Προσωπικό</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM project WHERE view='public'");	
		while(res.next()){
		%>
			<tr class="row">
				<td><% out.println(res.getString("name")); %></td>
				<td><% out.println(res.getString("view")); %></td>
				<td><% out.println(res.getString("description")); %></td>
				<td><% out.println(res.getString("manager")); %></td>
				<td><% String stf = res.getString("stuff");
						String[] stuff = stf.split(",");
						for(int i=0; i<stuff.length; i++){
							out.println(stuff[i]);
						}%>		
				</td>
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