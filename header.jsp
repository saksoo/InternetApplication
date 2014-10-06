<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Project Worker</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="stylesheet/style.css" type="text/css" />
</head>
<body>
<div id="wrap">
	<div id="header">
		<h1 id="logo-text">Project Worker</h1>
		<h2 id="slogan">Η Νο1 διαδικτυακή εφαρμογή διαχείρισης έργων</h2>
	</div>
	<div id="menu">
		<ul>
			
			<%
				// αν δεν έχει γίνει login, δεν εμφανίζουμε το σύνδεσμο για logout
				if (session.getAttribute("userLoggedIn") == "true") {  
				%>
				<li><a href="dologout.jsp">Αποσύνδεση</a></li>								
				<%

				} 
				else{
				%>
				<li><a href="index.jsp">Αρχική σελίδα</a></li>
				<li><a href="register.jsp">Εγγραφή</a></li>
				<li><a href="login.jsp">Σύνδεση</a></li>								
				<%				
				}
			%>			
		</ul>
	</div>
	<div id="content-wrap">