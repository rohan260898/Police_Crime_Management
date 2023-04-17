<%@page import="in.co.online.crime.Bean.FirBean"%>
<%@page import="in.co.online.crime.Ctl.FirListCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.online.crime.Utility.ServletUtility"%>
<%@page import="in.co.online.crime.Utility.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FIR List</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<br>

	<%
		UserBean bean2 = (UserBean) session.getAttribute("user");
	%>
	<jsp:useBean id="bean1" scope="request"
		class="in.co.online.crime.Bean.RoleBean" />
	<input type="hidden" name="id" value="<%=bean1.getId()%>">
	<h2 align="center" style="color: red">FIR List</h2>
	<br>

	<h4 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h4>
	<h4 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h4>

	<form action="<%=OCRView.FIR_LIST_CTL%>" method="post">
	
	<%if(bean2.getRoleid()==1){ %>

		<table width="100%">
			<tr>
				<td align="center"><label>Name :</label> <input type="text"
					name="name" placeholder="Enter  Name"
					value="<%=ServletUtility.getParameter("name", request)%>">
					&emsp; &emsp; &emsp;&emsp; <input type="submit" name="operation"
					value="<%=FirListCtl.OP_SEARCH%>">&nbsp;&nbsp;&nbsp;<input
					type="submit" name="operation" value="<%=FirListCtl.OP_RESET%>"></td>
			</tr>
		</table>
		<%}else{ %>
		<% }%>
		<br>

		<table class="table table-striped" style="background-color: fuchsia;">
			<tr>

				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">FatherName</th>
				<th scope="col">MotherName</th>
				<th scope="col">Address</th>
				<th scope="col">MobileNo</th>
			<!-- 	<th scope="col">Email</th> -->
				<th scope="col">Date</th>
				<th scope="col">Information</th>
				<th scope="col">Gender</th>
				<th scope="col">Crime</th>

			</tr>
			<%
				int index = 1;
				List list = ServletUtility.getList(request);
				Iterator it = list.iterator();
				while (it.hasNext()) {
					FirBean bean = (FirBean) it.next();
			%>
			<tr style="background-color: gray;">


				<th scope="row"><%=index++%></th>
				<td><%=bean.getName()%></td>
				<td><%=bean.getFather_name()%></td>
				<td><%=bean.getMother_name()%></td>
				<td><%=bean.getAddress()%></td>
				<td><%=bean.getMobileno()%></td>
			<%-- 	<td><%=bean.getEmail()%></td> --%>
				<td><%=bean.getDate()%></td>
				<td><%=bean.getInformation()%></td>
				<td><%=bean.getGender()%></td>
				<td><%=bean.getCrime()%></td>
				<%
					}
				%>
			
			</tbody>
		</table>

	</form>
	<%@include file="Footer.jsp"%>
</body>
</html>