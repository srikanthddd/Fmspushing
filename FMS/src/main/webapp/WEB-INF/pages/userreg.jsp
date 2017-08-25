<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<body style="background-color: powderblue;">

	<center>
		<h3>User Register here</h3>
	</center>
	<form:form method="post" action="saveUser" modelAttribute="user">
	<table align="center" border="1">

		<tr>
			<td>Name</td>
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>password</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>confirm password</td>
			<td><input type="password" name="cpassword"></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="email" name="email"></td>
		</tr>
		<tr>
			<td>Phone</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>gender</td>
			<td><input type="radio" name="gender" value="male" checked>male
				<input type="radio" name="gender" value="female">Female</td>
		</tr>
		<tr>
			<td>Location</td>
			<td><input type="text" name="location"></td>
		</tr>
		<tr>
			<td><input type="submit" value="Register"></td>
		</tr>
	</table>
	</form:form>
</body>

</html>