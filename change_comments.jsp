<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**
*
*	Εδώ αλλάζουμε τα σχόλια για μια εργασία. Συγκεκριμένα παίρνουμε τα στοιχεία από τη φόρμα και τα στέλνουμε 
*	στο αρχείο dochange_comments.jsp όπου και αναλαμβάνει το παιχνίδι με τη βάση.
*
**/
%>

<div id="main"> 
	<h1>Αλλαγή των σχολίων της εργασίας</h1><br />
	<p>Δώστε τα νέα σχόλια παρακατω:</p><br />
<%
	String nm = request.getParameter("nm");
%>

	<form action="dochange_comments.jsp?nm=<% out.println(nm); %>" method="post">
		<label style="margin-top:20px;">Σχόλια</label><textarea name="text" rows="5" cols="5"></textarea><br />
		<input class="button" type="submit" value="Αλλαγή σχολίων"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>