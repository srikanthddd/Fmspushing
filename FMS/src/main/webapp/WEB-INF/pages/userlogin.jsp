

<body style="background-color: #8ad0ff">


   <form action="loginMethod" method="post"> 
	<table align="center">	
		<tr>
			<td>Name</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>password</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- <a href="userpersonalpage.html">
			   Login
			</a> -->
			<input align="right" type="submit" value="login">
			</td>
		</tr>
			<tr>
			 <td> <a href="userreg">New User? Register Here !!</a></td>
			 
			 
		</tr>
		<tr>
		<td> <br> <b> <p> ${LoginError}  </p>  </b></td>
		</tr>
	</table>
	</form>
</body>
