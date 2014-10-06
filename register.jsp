<jsp:include page="header.jsp"/>
<jsp:include page="sidebar.jsp"/>
<div id="main"> 
	<h1>Εγγραφή νέου μέλους</h1>
	<br />
	<p>Συμπληρώστε τη φόρμα παρακάτω για να εγγραφείτε στο σύστημα διαχείρισης έργων και να αποκτήσετε πλήρη πρόσβαση 
	σε όλες τις δυνατότητες του. Σημειώνεται πως <u>όλα</u> τα πεδία είναι <span style="color:red;">υποχρεωτικά</span>.</p><br />
	<p style="color:red;">* Σημαντικό *</p>
	<p>Λόγω προβλημάτων στον server σχετικά με την κωδικοποίηση των γραμμάτων, παρακαλείστε να εισάγετε τα στοιχεία σας στη φόρμα εγγραφής με αγγλικούς χαρακτήρες.</p>
	<h3>Φόρμα εγγραφής μέλους</h3>
	<form action="doregister.jsp" method="post">
		<label>Όνομα</label><input name="name" type="text" size="30" />
		<label>Επώνυμο</label><input name="surname" type="text" size="30" />
		<label>Όνομα χρήστη</label><input name="username" type="text" size="30" />
		<label>Διεύθυνση email</label><input name="email" type="text" size="30" />
		<label>Κωδικός</label><input name="password" type="password" size="30" />
		<label>Επαλήθευση κωδικού</label><input name="password2" type="password" size="30" /><br />
		<input class="button" type="submit" value="Αποστολή στοιχείων και εγγραφή"/>
	</form>
</div>
<jsp:include page="footer.jsp"/>