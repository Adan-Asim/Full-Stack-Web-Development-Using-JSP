<html>
	<head>
		
		<title>show</title>
		<style>
			body
			{
				background-image:url('bg.jpg');
				background-size:cover; 
				color: white;
				padding-left:10%;
				margin-top:5%;
			}
		</style>
	</head>
	<body>
		<%
			HttpSession s = request.getSession(false);
			String iname;
			if(s ==null)
			{
				iname = "No item name is present in session";	
			}
			else
			{
				iname = (String) s.getAttribute("iname");
			}
			
			if(iname == null)
			{
				iname = "Nothing Searched";
			}
		%>
		<h1>Recently searched Item: <%= iname %></h1> <br><br>
		<a href = "searchForm.html" style = "text-decoration:none; font-size:1.5vw; color: white">>  Go back to main Page </a>
	</body>
</html>