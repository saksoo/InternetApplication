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
	<h1>Κατάλογος εργασιών έργου</h1>
	<br />
	<p>Βλέπετε τον κατάλογο των εργασιών για το εξής έργο:</p>
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
	
	<h3>Εργασίες</h3>
	<table>
		<tr>
			<th>Όνομα</th>
			<th>Περιγραφή</th>
			<th>Εκκίνηση</th>
			<th>Προθεσμία</th>
			<th>Εκτέλεση</th>
			<th>Πρόοδος</th>
		</tr>
<%	
	try{  
		res = psdoLogin.executeQuery("SELECT * FROM work WHERE project='"+nm+"'");	
		while(res.next()){
		%>
			<tr class="row">
				<td><% out.println(res.getString("name")); %></td>
				<td><% out.println(res.getString("description")); %></td>
				<td><% out.println(res.getString("start")); %></td>
				<td><% out.println(res.getString("finish")); %></td>
				<td><% String stf = res.getString("run");
						String[] stuff = stf.split(",");
						for(int i=0; i<stuff.length; i++){
							out.println(stuff[i]);
						}%>		
				</td>
				<td style="text-align:center;"><% String done = res.getString("done"); 
						if(done.equals("yes")){
						%><img src="images/green.png" alt="green" title="Η εργασία έχει ολοκληρωθεί"/><%
						} 
						else {
						%><img src="images/red.png" alt="red" title="Η εργασία δεν έχει ολοκληρωθεί"/><%
						} 
				%></td>
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
	
	<br />
	<p>Για να δημιουργήσετε μια νέα εργασία, ακολουθήστε τον παρακάτω σύνδεσμο:</p>
	<p><a href="create_work.jsp?nm=<%out.println(nm);%>&vi=<%out.println(vi);%>">Δημιουργία νέας εργασίας</a></p>
</div>
<jsp:include page="footer.jsp"/>