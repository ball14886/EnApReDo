<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : result
    Created on : May 2, 2017, 9:38:34 PM
    Author     : USER
--%>
<% 
    String[] EID = request.getParameterValues("eid");
    System.out.print(EID);
%>
<sql:query var="employee" dataSource="jdbc/IFPWAFCAD">
    SELECT * from skill natural join employee_skill natural join employee
    where EID = ${param.eid}
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Employable list</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <table border="0">
            <tbody>
            <form action="result.jsp">
                <tr>
                    <td>
                        Project name : <Strong>${param.ip_projectName}</strong>
                    </td>
                </tr>
                <tr style="align-items: center">
                    <th>EID</th>
                    <th style="align-self: center">Name</th>
                    <th>Position</th>
                    <th>Salary</th>
                    <th>Rate</th>
                </tr>
                <c:forEach var="row" items="${employee.rows}">
                    <tr>
                        <td>${row.EID}</td>
                        <td>
                            ${row.NAME}
                        </td>
                        <td>
                            ${row.POSITION}
                        </td>
                        <td>
                            ${row.SALARY}
                        </td>
                        <td>
                            ${row.RATE}
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        Man hour : <strong>${param.ip_manHour}</strong>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</body>
</html>
