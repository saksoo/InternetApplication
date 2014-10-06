<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<%
	// το κάνουμε έτσι, ώστε να μην μπορεί να μπει κάποιος άλλος τύπος χρήστη στις λειτουργίες του manager
	String usertype = session.getAttribute("type").toString();
	if (!usertype.equals("manager")){
		session.invalidate();
		response.sendRedirect("notaccess.jsp");
	}
%>
<div id="main"> 
	<h1>Αρχική σελίδα</h1>
	<br />
	<p>Έχετε συνδεθεί ως manager.</p>
	<p>Καλωσήρθατε στην αρχική σελίδα διαχείρισης.</p><br />
	<p>Ως Διαχειριστής έργων μπορείτε να κάνετε τις παρακάτω ενέργειες:</p><br />
	<p>Προβολή του καταλόγου των έργων που είστε υπεύθυνος, προβολή των εργασιών ενός έργου, δημιουργία νέων εργασιών, καθώς και 
	προβολή όλων των δημοσίων έργων.</p>

</div>
<jsp:include page="footer.jsp"/>