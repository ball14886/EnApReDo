<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<sql:query var="skill" dataSource="jdbc/IFPWAFCAD">
    SELECT * from skill
</sql:query>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>IFPWAFCAD Homepage.</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <table border="0">
            <tbody>
            <form action="response.jsp">
                <tr>
                    <td>
                        Project name : <input name="ip_projectName" type="text"><br>
                    </td>
                </tr>
                <tr>
                    <th>Skill</th>
                    <th>Rate</th>
                </tr>
                <c:forEach var="row" items="${skill.rows}">
                    <tr>
                        <td>
                            <input type="checkbox" name="skill_id" value="${row.SID}"> ${row.SKILL}
                        </td>
                        <td>${row.RATE}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        <input type="submit" value="submit"/>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</body>
</html>
