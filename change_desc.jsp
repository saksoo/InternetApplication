<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**
*
*	Εδώ αλλάζουμε την περιγραφή για ένα έργο. Συγκεκριμένα παίρνουμε τα στοιχεία από τη φόρμα και τα στέλνουμε 
*	στο αρχείο dochange_comments.jsp όπου και αναλαμβάνει το παιχνίδι με τη βάση.
*
**/
%>

<div id="main"> 
	<h1>Αλλαγή περιγραφής</h1><br />
	<p>Πρόκειται να αλλάξετε την περιγραφή για το έργο με τα παρακάτω στοιχεία:</p><br />
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
	<p>Γράψτε μια νέα περιγραφή:</p>
	<form action="dochange_desc.jsp?nm=<% out.println(nm); %>" method="post">
		<label style="margin-top:20px;">Περιγραφή έργου</label><textarea name="text" rows="5" cols="5"></textarea><br />
		<input class="button" type="submit" value="Αλλαγή περιγραφής"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>