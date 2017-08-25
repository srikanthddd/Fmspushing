<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
div.container {
	width: 100%;
	/* border: 1px solid gray; */
}

header, footer {
	padding: 1em;
	color: white;
	background-color: #4CAF50;
	clear: left;
	text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul a {
    text-decoration: none;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    /* background-color: #f1f1f1; */
}

li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
    background-color: #555;
    color: white;
}

article {
    margin-left: 230px;
    border-left: 3px solid gray;
    padding: 7em;
    overflow: hidden;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    padding: 20px;
}


</style>

</head>

<body>

	<div class="container"></div>
	<header>
		<h1>Feedback Management System</h1>
		<h4 align="right">
			Welcome <b> ${userSession.username} !! </b>
		</h4>
		<h4 align="right">
			<b> <a href="logout"> Logout ! </a>
			</b>
		</h4>
	</header>

	<nav>
		<ul>
			<li><a href="update">UpdateProfile</a></li>
			<li><a href="delete">DeleteProfile</a></li>
			<li><a href="changepassword">ChangePassword</a></li>
			<li><a href="feedback">RaiseFeedback</a></li>
			<li><a href="viewFeedBack">ViewFeedback</a></li>
		</ul>
	</nav>

	<article>
		<%-- <form:form method="post" action="saveFeedback" modelAttribute="feedback">
					<table align="center">
						<tr>
						<td>Feedback</td>
						<td><textarea rows="10" cols="100" name="feedbackGiven">Enter your feedback  here....</textarea></td>
						</tr>
						<tr>
							<td><input type="submit" /></td>
						</tr>
					</table>
			</form:form> --%>

		<div class="container">
			<form:form method="post" action="saveFeedback" modelAttribute="feedback">
				
				<textarea name="feedbackGiven" placeholder="Give your Feedback here.." style="height: 200px" required="required"></textarea>
				<input type="submit" value="Submit">
			</form:form>
		</div>

	</article>

	<footer>Copyright &copy; TATA Consultancy Services</footer>

</body>



<%-- <body style="background-color: #8ad0ff">

	<table border="1" width="100%" height="100%">
		<tr><p>Welcome :<b> ${userSession.username} </b></p>
			<td width="30%" valign="top">
				<table>
					<tr>
						<td><a href="update">Update Profile</a></td>
					</tr>

					<tr>
						<td><a href="delete">Delete Profile</a></td>
					</tr>

					<tr>
						<td><a href="changepassword">Change Password</a></td>
					</tr>
					<tr>
						<td><a href="feedback">Raise Feedback</a></td>
					</tr>
					<tr>
						<td><a href="viewFeedBack">View Feedback</a></td>
					</tr>
					
				</table>
			</td>
			<td width="70%">
			
			<form:form method="post" action="saveFeedback" modelAttribute="feedback">
					<table align="center">
						<tr>
						<td>Feedback</td>
						<td><textarea rows="10" cols="100" name="feedbackGiven">Enter your feedback  here....</textarea></td>
						</tr>
						<tr>
							<td><input type="submit" /></td>
						</tr>
					</table>
			</form:form></td>
			<p> <b> <a href="logout"> Logout ! </a> </b></p>
		</tr>
	</table>
</body>
 --%>
