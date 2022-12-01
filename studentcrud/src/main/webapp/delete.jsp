<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
	String id = request.getParameter("id");
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost/student_crud", "root", "");
	 pst = con.prepareStatement("delete from records where id = ?");
	 pst.setString(1, id);
	 pst.executeUpdate();
%>

	<script>
		alert("Record Deleted")
	</script>

	
