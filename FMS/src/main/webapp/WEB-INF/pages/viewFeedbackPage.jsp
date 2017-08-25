<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List"%>


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
		
			<%-- <table border="2"  >
				<tr> 
				<td>Feedback Id</td>
				<td>Feedback Given</td>
				<td>Operation</td>
				</tr>
				
  				<c:forEach items="${fbList}" var="listValue">
    				<tr>
      					<td>${listValue.feedbackId}</td>
	  					<td>${listValue.feedbackGiven}</td>
	  					<td>
	  						<a href="editFeedback?feedbackId=${listValue.feedbackId}&feedbackGiven=${listValue.feedbackGiven}">Edit</a>
	  						<a href="deleteFeedback?feedbackId=${listValue.feedbackId}">Delete</a>
	  					</td>
    				</tr>
  				</c:forEach>
			</table> --%>
			
			<div style="overflow-x:auto;">
			<table class="w3-table-all w3-hoverable">
				<thead>
					<tr class="w3-light-grey"></tr>
					<th>Feedback Id</th>
					<th>Feedback Given</th>
					<th>Operation</th>
				</thead>
				
				<c:forEach items="${fbList}" var="listValue">
    				<tr>
      					<td>${listValue.feedbackId}</td>
	  					<td>${listValue.feedbackGiven}</td>
	  					<td>
	  						<a href="viewFeedback?feedbackId=${listValue.feedbackId}">View</a>
	  						<a href="editFeedback?feedbackId=${listValue.feedbackId}&feedbackGiven=${listValue.feedbackGiven}">Edit</a>
	  						<a href="deleteFeedback?feedbackId=${listValue.feedbackId}">Delete</a>
	  					</td>
    				</tr>
  				</c:forEach>
				
			</table>
			</div>
			
			
	</article>

	<footer>Copyright &copy; TATA Consultancy Services</footer>

</body>