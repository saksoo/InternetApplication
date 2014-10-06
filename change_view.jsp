<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
	<h1>Αλλαγή κατάστασης</h1><br />
	<p>Πρόκειται να αλλάξετε την κατάσταση για το έργο με τα παρακάτω στοιχεία:</p><br />
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
	<p>Επιλέξτε μια από τις παρακάτω καταστάσεις:</p>
	<form action="dochange_view.jsp?nm=<% out.println(nm); %>" method="post">
		<label style="margin-top:20px;">Κατάσταση</label><select name="view"><option value="public">Δημόσιο</option><option value="private">Ιδιωτικό</option></select><br /><br />
		<input class="button" type="submit" value="Αλλαγή κατάστασης"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>