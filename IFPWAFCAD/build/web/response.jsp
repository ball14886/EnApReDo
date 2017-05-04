<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : response
    Created on : May 2, 2017, 6:19:02 PM
    Author     : USER
--%>

<sql:query var="employeeskill" dataSource="jdbc/IFPWAFCAD">
    SELECT * from skill natural join employee_skill natural join employee
    where SID = ${param.skill_id}
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
                        Project name : <input type="text" name="ip_projectName" value="${param.ip_projectName}">
                    </td>
                </tr>
                <tr style="align-items: center">
                    <th style="align-self: center">Name</th>
                    <th>Position</th>
                    <th>Salary</th>
                </tr>
                <div id="box_checkboxList">
                    <c:forEach var="row" items="${employeeskill.rows}">
                        <tr>
                            <td>
                                <input onclick="getSelectedEID(${row.EID})" id="checkboxEID" type="checkbox" name="eid" value="${row.EID}"> ${row.NAME}
                            </td>
                            <td>
                                ${row.POSITION}
                            </td>
                            <td>
                                ${row.SALARY}
                            </td>
                        </tr>
                    </c:forEach>
                </div>
                <tr>
                    <td>
                        Man hour : <input name="ip_manHour" type="text" name="hours">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="temp" name="temp">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="submit"/>   
                    </td>
                </tr>
            </form>
        </tbody>
    </table>

    <script>
        function getSelectedEID(id) {
            var box_checkboxList = document.getElementById("box_checkboxList");
            var checkboxList = box_checkboxList.getElementsByTagName("input");
            var checkedList = "";
            for (int i = 0; i < checkboxList.length; i++) {
                if (checkboxList[i].checked) {
                    checkedList = checkedList + checkboxList[i].value + ",";
                }
            }
            alert("checkedList" + checkedList)
            //var checkboxEID = $("#checkboxEID");
            document.getElementById('temp').value += checkedList;
        }
    </script>
</body>
</html>
