<html>
	<head>
		<%@ page import = "java.sql.*" session = "false" %>
		<title>main</title>
		<style>
			body
			{
				background-image:url('bg.jpg');
				background-size:cover; 
				color: white;
				padding-left:10%;
				margin-top:15%;
			}
		</style>
	</head>
	<body>
		<table style = "border: 1px solid white; margin-bottom: 8%"> 
		<tr style = "margin-top:2%">
			<th><u>Item Name </u></th>
			<th><u>Description </u></th>
			<th><u>Price </u> </th>
		</tr>
		<%
			HttpSession s = request.getSession(false);
			String iname = (String) s.getAttribute("iname");
				
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/store", "root", "");
				Statement st = con.createStatement();
				
				String Query = "SELECT * FROM items WHERE itemname = '" + iname + "' ";
				ResultSet rs = st.executeQuery(Query);
				
				while(rs.next())
				{
					String name, description;
					int price;
					name = rs.getString("itemname");
					description = rs.getString("description");
					price = rs.getInt("price");
		%>
					<tr>
						<th><%= name %> |</th>
						<th><%= description %> |</th>
						<th><%= price %> </th>
					</tr>
		</table>
		<%
				 }
				con.close();
			}
			catch(Exception e)
			{
				System.out.println("Sorry an error occured, stated as: " + e);	
			}
		%>
		<a href = "searchForm.html" style = "text-decoration:none; font-size:110%; color:white;"><button>Go back to main Page</button></a><br><br><br>
	</body>
</html>