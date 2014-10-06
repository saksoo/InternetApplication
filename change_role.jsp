<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
	<h1>Αλλαγή ρόλου</h1><br />
	<p>Πρόκειται να αλλάξετε το ρόλο του χρήστη με τα παρακάτω στοιχεία:</p><br />
	<table>
		<tr>
			<th>Όνομα χρήστη</th>
			<th>Όνομα</th>
			<th>Επώνυμο</th>
			<th>Email</th>
		</tr>
<%
	String usn = request.getParameter("usn");
	String nm = request.getParameter("nm");
	String snm = request.getParameter("snm");
	String eml = request.getParameter("eml");
%>
		<tr class="row">
			<td><% out.println(usn); %></td>
			<td><% out.println(nm); %></td>
			<td><% out.println(snm); %></td>
			<td><% out.println(eml); %></td>
		</tr>
	</table>
	<br />
	<p style="color:red;">* Σημαντικό *</p>
	<p>Πριν αλλάξετε το ρόλο ενός υπευθύνου έργου (Manager) βεβαιωθείτε από τον "Κατάλογο των έργων" οτι δεν διευθύνει κάποιο project.</p><br />
	<p>Επιλέξτε έναν από τους παρακάτω ρόλους:</p><br />
	<table>
	<tr>
		<th>Υπεύθυνος εφαρμογής</th>
		<th>Υπεύθυνος έργου</th>
		<th>Προσωπικό</th>
		<th>Επισκέπτης</th>
	</tr>
	<tr class="row">
		<td><a href="dochange_role.jsp?usn=<% out.println(usn); %>&cr=administrator">administrator</a></td>
		<td><a href="dochange_role.jsp?usn=<% out.println(usn); %>&cr=manager">manager</a></td>
		<td><a href="dochange_role.jsp?usn=<% out.println(usn); %>&cr=stuff">stuff</a></td>
		<td><a href="dochange_role.jsp?usn=<% out.println(usn); %>&cr=visitor">visitor</a></td>
	</tr>
	</table>

</div>
<jsp:include page="footer.jsp"/>