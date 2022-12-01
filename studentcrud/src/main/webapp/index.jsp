<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<% 
	if(request.getParameter("submit")!= null){
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fee = request.getParameter("fee");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost/student_crud", "root", "");
		 pst = con.prepareStatement("insert into records(stname, course, fee)values(?,?,?)");
		 pst.setString(1, name);
		 pst.setString(2, course);
		 pst.setString(3, fee);
		 pst.executeUpdate();
%>

		<script>
			alert("Record Added")
		</script>

		
<% 	
	}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Student Registration System</title>
		<%@include file="includes/head.jsp" %>
	</head>
	<body >
	<h1 class="text-center">Student Registration</h1>
		<br>
		<div class="row ml-4 mr-4">
			<div class="col-sm-4">
				<form method="post" action="#">
				<div align="left">
					<label class="form-label">Student Name</label>
					<input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
				</div>
				
				<div align="left">
					<label class="form-labe">Course</label>
					<input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
				</div>
				
				<div align="left">
					<label class="form-labe">Fee</label>
					<input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
				</div>
				<br>
				<div align="right">
					<input type="submit" id="submit" name="submit" class="btn btn-success">
					<input type="reset" id="reset" name="reset" class="btn btn-danger">
				</div>
				
				</form>
			</div>
			<div class="col-sm-8">
				<div>
					<table id="tbl-student" class="table table-bordered">
						<thead>
							<tr>
								<th>Student Name</th>
								<th>Course</th>
								<th>Fee</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							
							<%
							Connection con;
							PreparedStatement pst;
							ResultSet rs;
							
							Class.forName("com.mysql.jdbc.Driver");
							
							con = DriverManager.getConnection("jdbc:mysql://localhost/student_crud", "root", "");
							
							String query = "select * from records";
							Statement st = con.createStatement();
							rs = st.executeQuery(query);
							while(rs.next()){
								String id = rs.getString("id");
								%>
							
							
							
							<tr>
								<td><%=rs.getString("stname") %></td>
								<td><%=rs.getString("course") %></td>
								<td><%=rs.getString("fee") %></td>
								<td><a href="update.jsp?id=<%=id%>" class="text-warning">Edit</a></td>
								<td><a href="delete.jsp?id=<%=id%>" class="text-danger">Delete</a></td>
							</tr>
							
							<% 
							
							}
							
							%>
						
							
					</table>
				</div>
			</div>
		</div>
		<%@include file="includes/footer.jsp" %>
	</body>
</html>