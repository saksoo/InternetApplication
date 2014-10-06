<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<%
	// το κάνουμε έτσι, ώστε να μην μπορεί να μπει κάποιος άλλος τύπος χρήστη στις λειτουργίες του stuff
	String usertype = session.getAttribute("type").toString();
	if (!usertype.equals("stuff")){
		session.invalidate();
		response.sendRedirect("notaccess.jsp");
	}
%>
<div id="main"> 
	<h1>Αρχική σελίδα</h1>
	<br />
	<p>Έχετε συνδεθεί ως stuff.</p>
	<p>Καλωσήρθατε στην αρχική σελίδα διαχείρισης.</p><br />
	<p>Ως Προσωπικό μπορείτε να κάνετε τις παρακάτω ενέργειες:</p><br />
	<p>Προβολή του καταλόγου των έργων στα οποία εργάζεστε, προβολή των εργασιών που σας έχουν ανατεθεί για κάθε έργο, αλλαγή 
	της προόδου κάθε εργασίας, καταχώρηση σχολίων για τις εργασίες καθώς και προβολή όλων των δημοσίων έργων.</p>

</div>
<jsp:include page="footer.jsp"/>