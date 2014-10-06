<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**	
*	Εδώ έχουμε τη φόρμα που θα δίνει τα στοιχεία του ο χρήστης.
*	Τα στοιχεία πάνε με μέθοδο post στο αρχείο dologin.jsp
*
*
*
**/ 
%>

<div id="main"> 
	<h1>Είσοδος εγγεγραμμένου μέλους</h1>
	<br />
	<p>Χρησιμοποιήστε το όνομα χρήστη και τον κωδικό σας στη φόρμα παρακάτω για να συνδεθείτε στην εφαρμογή.</p>
	<h3>Φόρμα σύνδεσης</h3>
	<form action="dologin.jsp" method="post">
		<label>Όνομα χρήστη</label><input name="username" type="text" size="30" />
		<label>Κωδικός</label><input name="password" type="password" size="30" /><br />
		<input class="button" type="submit" value="Είσοδος"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>