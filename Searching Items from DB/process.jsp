<html>
	<head>
		<%@ page import = "java.sql.*" session = "true" %>
		<title>process</title>
	</head>
	
	<% 
		String iname = request.getParameter("iname");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/store", "root", "");
			Statement st = con.createStatement();

			String Query = "SELECT * FROM items WHERE itemname = '" + iname + "'";
			ResultSet rs = st.executeQuery(Query);
			if(rs.next())	
			{
				HttpSession s = request.getSession(true);
				s.setAttribute("iname", iname);
	%>
				<jsp:forward page = 'main.jsp'/>
	<%		
			}
			else
			{
	%>
				<jsp:forward page = 'error.jsp'/>
	<%
			}	
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Sorry an error occured, stated as: " + e);	
		}
	%>
</html>
			
