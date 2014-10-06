
<%
// όταν κάνει Logout ο χρήστης, τότε ακυρώνουμε την εγγραφή του στον πίνακα session

session.invalidate();
		%>	

<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


		<h1>Επιτυχία αποσύνδεσης</h1>
		<br />
		<p><span style="color:green";>Έχετε αποσυνδεθεί με επιτυχία από την εφαρμογή.</span></p>
		<br />
		<p>Ακολουθήστε έναν από τους παρακάτω συνδέσμους.</p>
		<p><a href="login.jsp">Επανάληψη εισόδου</a></p>
		<p><a href="index.jsp">Αρχική σελίδα</a></p>		
</div>
<jsp:include page="footer.jsp"/>