<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
div.container {
	width: 100%;
	/* border: 4px solid gray; */
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


input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}


input[type=password], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    /* background-color: #f2f2f2; */
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
		<div>
			<form:form method="post" action="#"
				modelAttribute="userdetails">
				<label for="password">Password</label>
				<input type="password" name="password" placeholder="Your Password" required="required">
				<label for="password">Repeat Password</label>
				<input type="password" name="cpassword" placeholder="Repeat Password" required="required">
				<input type="submit" value="Submit">
			</form:form>
		</div>

	</article>

	<footer>Copyright &copy; TATA Consultancy Services</footer>

</body>



