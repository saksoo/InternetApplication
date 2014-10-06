<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<%
	// το κάνουμε έτσι, ώστε να μην μπορεί να μπει κάποιος άλλος τύπος χρήστη στις λειτουργίες του admin
	String usertype = session.getAttribute("type").toString();
	if (!usertype.equals("administrator")){
		session.invalidate();
		response.sendRedirect("notaccess.jsp");
	}
%>
<div id="main"> 
	<h1>Αρχική σελίδα</h1>
	<br />
	<p>Έχετε συνδεθεί ως administrator.</p>
	<p>Καλωσήρθατε στην αρχική σελίδα διαχείρισης.</p><br />
	<p>Ως Διαχειριστής της εφαρμογής μπορείτε να κάνετε τις παρακάτω ενέργειες:</p><br />
	<p>Προβολή του καταλόγου των χρηστών, προβολή του καταλόγου των έργων, αλλαγή των στοιχείων των έργων και των χρηστών, δημιουργία ενός νέου έργου 
	καθώς και διαγραφή. Για όλα αυτά, ακολουθήστε τους συνδέσμους στα δεξιά.</p>

</div>
<jsp:include page="footer.jsp"/>