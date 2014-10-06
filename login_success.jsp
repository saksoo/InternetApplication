<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>

<%
/**	
*	Σε αυτό το αρχείο ερχόμαστε από το dologin.jsp, σε περίπτωση
*	που έχει γίνει επιτυχής σύνδεση στην εφαρμογή. Επίσης τυπώνουμε και το Όνομα και Επώνυμο 
*	του χρήστη που συνδέθηκε.
*
*
**/ 
%>

<div id="main"> 
	<h1>Επιτυχής είσοδος</h1>
	<br />
	<p>Συγχαρητήρια <span style="color:green";><% out.print(session.getAttribute("name") + " "); out.print(session.getAttribute("surname")); %></span>,</p>
	<p>Έχετε συνδεθεί με επιτυχία στην εφαρμογή.</p>
	<br />
	<p>Από το μενού "Περιεχόμενα" στα δεξιά μπορείτε να πλοηγηθείτε στις λειτουργίες της εφαρμογής.</p>
</div>
<jsp:include page="footer.jsp"/>