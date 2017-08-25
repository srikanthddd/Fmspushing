
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
div.container {
	width: 100%;
	border: 1px solid gray;
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
			<li><a href="loginMethod">Home</a>
			<li><a href="update">UpdateProfile</a></li>
			<li><a href="delete">DeleteProfile</a></li>
			<li><a href="changepassword">ChangePassword</a></li>
			<li><a href="feedback">RaiseFeedback</a></li>
			<li><a href="viewFeedBack">ViewFeedback</a></li>
		</ul>
	</nav>

	<article>
		The feedback management module can give customers a means to send/share 
		comments to	the client regarding their own experiences.
		As well as provide a means to give client a satisfaction rating of the website.
		This feedback system helps the client know what user experiences are and 
		how to improve the application in future. so that they can enhance their product.
	</article>

	<footer>Copyright &copy; TATA Consultancy Services</footer>

</body>
