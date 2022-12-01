<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%

if(request.getParameter("submit")!= null){
	String id = request.getParameter("id");
	String name = request.getParameter("sname");
	String course = request.getParameter("course");
	String fee = request.getParameter("fee");
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost/student_crud", "root", "");
	 pst = con.prepareStatement("update records set stname = ?, course = ?, fee = ? where id =?");
	 pst.setString(1, name);
	 pst.setString(2, course);
	 pst.setString(3, fee);
	 pst.setString(4, id);
	 pst.executeUpdate();
%>

	<script>
		alert("Record Updated")
	</script>

	
<% 	
}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<%@include file="includes/head.jsp" %>
	</head>
	<body>
		<h1 class="text-center">Update</h1>
		<div class="row justify-content-center">
			<div class="col-sm-4">
				<form method="post" action="#">
				
				<%
				Connection con;
				PreparedStatement pst;
				ResultSet rs;
				
				Class.forName("com.mysql.jdbc.Driver");
				
				con = DriverManager.getConnection("jdbc:mysql://localhost/student_crud", "root", ""); 
				
				String id = request.getParameter("id");
				pst = con.prepareStatement("select * from records where id = ?");
				pst.setString(1, id);
				rs = pst.executeQuery();
				
				while(rs.next()){
					%>
				
				
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("stname")  %>" name="sname" id="sname" required>
				</div>
				
				<div align="left">
					<label class="form-labe">Course</label>
					<input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course")  %>" name="course" id="course" required>
				</div>
				
				<div align="left">
					<label class="form-labe">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" value="<%= rs.getString("fee")  %>" name="fee" id="fee" required>
				</div>
				
				<%
				}
				
				%>
				
				
				
				<br>
				<div align="right">
					<input type="submit" id="submit" name="submit" class="btn btn-success">
				</div>
					<div align="right">
				<p><a href="index.jsp">Click to go back</a></p>
			</div>
				</form>
			</div>
			
			</div>
			
		
			<%@include file="includes/footer.jsp" %>
	</body>
</html>