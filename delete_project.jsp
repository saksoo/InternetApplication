<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
	<h1>Διαγραφή έργου</h1><br />
	<p>Πρόκειται να διαγράψετε το έργο (και όλες τις εργασίες του) με τα παρακάτω στοιχεία:</p><br />
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
	<p>Για να επιβεβαιώσετε τη διαγραφή, πατήστε το κουμπί παρακάτω:</p>
	<form action="dodelete_project.jsp?nm=<% out.println(nm); %>" method="post">
		<input class="button" type="submit" value="Διαγραφή έργου"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>