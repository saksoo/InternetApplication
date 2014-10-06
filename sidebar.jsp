<div id="sidebar"> 	
	<ul class="sidemenu">
<%
	if (session.getAttribute("userLoggedIn") == "true") {  
		out.println("<li>Έχετε συνδεθεί ως:</li>");
		out.println("<li>" + session.getAttribute("username") + "</li><hr />");
		
		%><h1>Περιεχόμενα</h1>
		<ul class="sidemenu">
			<% if(session.getAttribute("type").equals("administrator")) {  
				%><li><a href="user_index_administrator.jsp">Αρχική σελίδα</a></li>
				<li><a href="user_list.jsp">Κατάλογος χρηστών</a></li>
				<li><a href="project_list.jsp">Κατάλογος έργων</a></li><%
			} 
			else if(session.getAttribute("type").equals("manager")) {	
				%><li><a href="user_index_manager.jsp">Αρχική σελίδα</a></li>
				<li><a href="project_list_manager.jsp">Έργα στα οποία είμαι υπεύθυνος</a></li>
				<li><a href="project_list_public.jsp">Προβολή των δημοσίων έργων</a></li><%
			} 
			else if(session.getAttribute("type").equals("stuff")) {	
				%><li><a href="user_index_stuff.jsp">Αρχική σελίδα</a></li>
				<li><a href="project_list_stuff.jsp">Έργα στα οποία εργάζομαι</a></li>
				<li><a href="project_list_public.jsp">Προβολή των δημοσίων έργων</a></li><%
			} 	
			else {	
				%><li><a href="user_index_visitor.jsp">Αρχική σελίδα</a></li>
				<li><a href="project_list_public.jsp">Προβολή των δημοσίων έργων</a></li><%
			} %>
		</ul>
		<%
	}
	else{
		out.println("<li>Δεν έχετε συνδεθεί</li>");
	}
%>
	</ul>
</div>