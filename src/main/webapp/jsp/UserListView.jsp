<%@page import="in.co.online.crime.Ctl.UserRegisterCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.online.crime.Utility.ServletUtility"%>
<%@page import="in.co.online.crime.Utility.HTMLUtility"%>
<%@page import="in.co.online.crime.Ctl.UserListCtl"%>
<%@page import="in.co.online.crime.Model.UserModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserList</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<br>
	<h2 align="center">User List</h2>
	<br>

	<h4 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h4>
	<h4 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h4>

	<form action="<%=OCRView.USER_LIST_CTL%>" method="post">

		<table width="100%">
			<tr>
				<td align="center"><label style="color: blue">First Name :</label> <input
					type="text" name="firstName" placeholder="Enter First Name"
					value="<%=ServletUtility.getParameter("firstName", request)%>">
					&emsp;&emsp; <input type="submit" name="operation" style="color: blue"
					value="<%=UserListCtl.OP_SEARCH%>">&nbsp;&nbsp;&nbsp;<input type="submit" style="color: blue"
					name="operation" value="<%=UserListCtl.OP_RESET%>"></td>
			</tr>
		</table>
		<br>

		<table class="table table-striped">
			<tr >
				
				<th scope="col" style="color: blue">ID</th>
				<th scope="col"  style="color: blue">FirstName</th>
				<th scope="col"style="color: blue">LastName</th>
				<th scope="col"style="color: blue">Email</th>
				<th scope="col"style="color: blue">Gender</th>
				<th scope="col"style="color: blue">RoleName</th>
				<th scope="col"style="color: blue">Action</th>
					<th scope="col"></th>
			</tr>
			<%
			
				int index = 1;
				List list = ServletUtility.getList(request);
				Iterator it = list.iterator();
				while (it.hasNext()) {
					UserBean bean = (UserBean) it.next();
			%>
			<tr>
				
				<th scope="row" style="color: blue"><%=index++%></th>
				<td><%=bean.getFirstName()%></td>
				<td><%=bean.getLastName()%></td>
				<td><%=bean.getEmail()%></td>
				<td><%=bean.getPhoneNo()%></td>
				<td><%=bean.getGender()%></td>
				<td><a class="btn btn-info"
					href="<%=OCRView.USER_CTL%>?id=<%=bean.getId()%>">Edit</a></td>
				<td><a class="btn btn-danger" href="<%=OCRView.USER_LIST_CTL%>?id=<%=bean.getId()%>">Delete</a></td>
			</tr>
			<%
				}
			%>
			</tbody>
		</table>

		
	</form>
</body>
<%@include file="Footer.jsp"%>
</html>