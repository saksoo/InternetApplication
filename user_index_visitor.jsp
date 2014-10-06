<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<%
	// το κάνουμε έτσι, ώστε να μην μπορεί να μπει κάποιος άλλος τύπος χρήστη στις λειτουργίες του visitor
	String usertype = session.getAttribute("type").toString();
	if (!usertype.equals("visitor")){
		session.invalidate();
		response.sendRedirect("notaccess.jsp");
	}
%>
<div id="main"> 
	<h1>Αρχική σελίδα</h1>
	<br />
	<p>Έχετε συνδεθεί ως visitor.</p>
	<p>Καλωσήρθατε στην αρχική σελίδα διαχείρισης.</p><br />
	<p>Ως επισκέπτης στην εφαρμογή μπορείτε μόνο να προβάλλετε τον κατάλογο των δημοσίων έργων.</p><br />

</div>
<jsp:include page="footer.jsp"/>